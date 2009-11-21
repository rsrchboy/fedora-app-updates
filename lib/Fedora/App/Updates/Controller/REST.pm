package Fedora::App::Updates::Controller::REST;

use strict;
use warnings;

use parent 'Catalyst::Controller::REST';

use DBIx::Class::ResultClass::HashRefInflator;

=head1 NAME

Fedora::App::Updates::Controller::REST - Catalyst Controller

=head1 DESCRIPTION

RESTful Catalyst Controller.

=head1 HELPERS

=head2 status_partial_content

Returns a "206 Partial Content" response.  Takes an "entity" to serialize.

Dojo uses this for requesting chunks of information..

Example:

  $self->status_partial_content(
     $c,
     entity => { ... },
  );

=cut

sub status_partial_content {
    my $self = shift;
    my $c    = shift;
    my %p    = Params::Validate::validate( @_, { entity => 1, }, );

    $c->response->status(206);
    $self->_set_entity($c, $p{'entity'});

    return 1;
}

sub _explode {
    my ($self, $rs) = @_;

    # return as an array of hashrefs, rather than DBIC::Rows
    $rs->result_class('DBIx::Class::ResultClass::HashRefInflator');
    return [ $rs->all ];
}

=head1 METHODS

=head2 packages

=cut

sub packages : Local ActionClass('REST') { }

sub packages_GET {
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

=head1 AUTHOR

Chris Weyl

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

1;
