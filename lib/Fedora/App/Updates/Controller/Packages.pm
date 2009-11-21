package Fedora::App::Updates::Controller::Packages;

use strict;
use warnings;
use parent 'Catalyst::Controller';

=head1 NAME

Fedora::App::Updates::Controller::Packages - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    $c->response->body('Matched Fedora::App::Updates::Controller::Packages in Packages.');
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
