package Fedora::App::Updates::ControllerRole::REST;

# ABSTRACT: additional REST status helpers

use Moose::Role;
use namespace::autoclean;
use common::sense;

use DBIx::Class::ResultClass::HashRefInflator;

# debugging...
#use Smart::Comments '###';

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

sub query_to_dbic {
    my ($self, $c) = @_;

    # FIXME this needs refactoring... ew
    #my %legal = map { $_ => 1 } qw{ name owner };
    my %legal = (owner => 'owner_id', name => 'name');
    my $params = $c->req->parameters;

    ### $params

    my ($search, $attrs) = ({}, { order_by => 'me.name' });

    PARAM_LOOP:
    for my $param (keys %$params) {

        if ($legal{$param}) {

            # if we're a wildcard search...
            my $value = $params->{$param};
            $value =~ s/\*/%/g;
            $search->{"me.$legal{$param}"} = $value =~ /%/ ? { LIKE => $value } : $value;
            next PARAM_LOOP;
        }

        next PARAM_LOOP unless $param =~ /^sort\(/;

        # so, get our sort name and ASC/DESC
        $param =~ s/^sort\(//;
        $param =~ s/\)$//;

        my $order = $param =~ /^-/ ? '-desc' : '-asc';
        warn $param;
        $param =~ s/^(-| )//;
        warn $param;
        next PARAM_LOOP unless $legal{$param};
        $attrs->{order_by} = { $order => "me.$legal{$param}" };
    }

    ### $search
    ### $attrs

    return ($search, $attrs);

    my $name  = $c->req->parameters->{name};
    my $owner = $c->req->parameters->{owner};

    my ($search, $atts) = ({}, {});

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

1;

__END__

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

=cut
