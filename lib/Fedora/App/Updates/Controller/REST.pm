package Fedora::App::Updates::Controller::REST;

use Moose;
use namespace::autoclean;

BEGIN { extends  'Catalyst::Controller::REST' }

use DBIx::Class::ResultClass::HashRefInflator;

##############################################################3
# Helpers

sub status_partial_content {
    my $self = shift;
    my $c    = shift;
    my %p    = Params::Validate::validate( @_, { entity => 1, }, );

    $c->response->status(206);
    $self->_set_entity($c, $p{'entity'});

    return 1;
}

# take a DBIC::ResultSet and "explode" it out into an arrayref of hashrefs
# (hashrefs being just the raw rows).

sub _explode {
    my ($self, $rs) = @_;

    # return as an array of hashrefs, rather than DBIC::Rows
    $rs->result_class('DBIx::Class::ResultClass::HashRefInflator');
    return [ $rs->all ];
}

sub handle_partial_request {
    my ($self, $c, $rs, $transform_sub) = @_;

    return unless my $range = $c->req->header('Range');

    my $total = $rs->count;

    # break out our start and end ranges...
    # we do sometimes see 'items=0-'
    $range =~ s/items=//;
    my ($from, $to) = split /-/, $range;
    $to = $total unless $to && $to < $total;

    # now, touch up our result set...
    $rs = $rs->search(undef, { rows => $to - $from + 1, offset => $from });

    $c->res->header('Content-Range' => "items $from-$to/$total");
    return $self->status_partial_content($c, entity => $transform_sub->($rs));
}

##############################################################3
# Actions

sub package_names : Local ActionClass('REST') { }

sub package_names_GET {
    my ($self, $c) = @_;

    my $like = $c->req->params->{name} || '%';
    $like =~ s/\*/%/g;

    my $rs = $c->model('Updates::Packages');
    my @names = $rs
        ->search(
            { name => { like => $like }         },
            { distinct => 1, order_by => 'name' },
        )
        ->get_column('name')
        ->all
        ;

    if (my $range = $c->req->header('Range')) {

        my $total = @names;
        $range =~ s/items=//;
        my ($from, $to) = split /-/, $range;
        # we do sometimes see 'items=0-'
        warn "to: $to";
        $to = $total - 1 unless $to && $to < $total;

        my @partial = @names[$from..$to];

        # make sure $to = $from + actual number of items
        $to = $from + scalar @partial;

        my @items = map { { name => $_, label => $_ } } @partial;

        $c->res->header('Content-Range' => "items $from-$to/$total");
        #return $self->status_partial_content($c, entity => \@partial);
        #return $self->status_partial_content($c, entity => { label => 'name', identifier => 'name', items => \@items});
        return $self->status_partial_content($c, entity => \@items);
    }

    @names = map { { name => $_, label => $_ } } @names;
    $self->status_ok($c, entity => \@names);
}


sub packages : Local ActionClass('REST') { }

sub packages_GET {
    my ($self, $c) = @_;

    # FIXME need search bits here
    my $search = $self->query_to_dbic($c);

    my $rs = $c->model('Updates::Packages')->search($search, { order_by => 'me.name' });
    my $transform_sub = sub { shift->all_versions };

    return $self->handle_partial_request($c, $rs, $transform_sub)
        if $c->req->header('Range');

    return $self->status_ok($c, entity => $transform_sub->($rs));
}

sub query_to_dbic {
    my ($self, $c) = @_;

    # FIXME this needs refactoring... ew
    my $name  = $c->req->parameters->{name};
    my $owner = $c->req->parameters->{owner};

    my $search = {};

    if ($name =~ /\*/) {

        # if we're a wildcard search...
        $name =~ s/\*/%/g;
        $search->{'me.name'} = { LIKE => $name };
    }
    elsif ($name) { $search->{'me.name'} = $name }

    if ($owner =~ /\*/) {

        # if we're a wildcard search...
        $owner =~ s/\*/%/g;
        $search->{'me.owner_id'} = { LIKE => $owner };
    }
    elsif ($owner) { $search->{'me.owner_id'} = $owner }

    return $search;
}

__PACKAGE__->meta->make_immutable;

__END__

=head1 NAME

Fedora::App::Updates::Controller::REST - Catalyst Controller

=head1 DESCRIPTION

RESTful Catalyst Controller.

=head1 HELPERS

=head2 status_partial_content

Returns a "206 Partial Content" response.  Takes an "entity" to serialize.

Dojo uses this for requesting chunks of information.

Example:

  $self->status_partial_content(
     $c,
     entity => { ... },
  );

=head2 _explode

Take a L<DBIx::Class::ResultSet> and "explode" it out into a collection of
hashrefs, using L<DBIx::Class::ResultClass::HashRefInflator>.

=head1 PATH ACTIONS

=head2 package_names


=head2 packages


=head1 AUTHOR

Chris Weyl <cweyl@alumni.drew.edu>

=head1 LICENCE AND COPYRIGHT

Copyright (c) 2008, Chris Weyl <cweyl@alumni.drew.edu>

This library is free software; you can redistribute it and/or modify it under
the terms of the GNU Lesser General Public License as published by the Free
Software Foundation; either version 2.1 of the License, or (at your option)
any later version.

This library is distributed in the hope that it will be useful, but WITHOUT
ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
OR A PARTICULAR PURPOSE.

See the GNU Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with this library; if not, write to the

    Free Software Foundation, Inc.,
    59 Temple Place, Suite 330,
    Boston, MA  02111-1307 USA

=cut
