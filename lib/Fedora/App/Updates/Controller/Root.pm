package Fedora::App::Updates::Controller::Root;

use Moose;
use namespace::autoclean;
use CatalystX::Alt::Routes;

BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config->{namespace} = q{};

index_action {
    my ( $self, $c ) = @_;

    # get our list of dists to display
    my @dists = $c
        ->model('Updates::Dist')
        ->search(undef, { order_by => 'shortname DESC' })
        ->get_column('shortname')
        ->all
        ;
    $c->stash->{dists} = \@dists;

    my @users = $c
        ->model('Updates::Users')
        ->search(undef, { order_by => 'id' })
        ->get_column('id')
        ->all
        ;
    $c->stash->{users} = \@users;

    return;
};

default_action {
    my ($self, $c) = @_;

    $c->response->body('Page not found');
    $c->response->status(404);
};

public packages
    => args 0
    => sub {

        my ($self, $c) = @_;

        # forward to /, redirect from old path...
        $c->res->redirect($c->uri_for('/'), 301);
        $c->detach;

        return;
    };

public test => { };

end_action { };

#sub end : ActionClass('RenderView') {}

__PACKAGE__->meta->make_immutable;

__END__

=head1 NAME

Fedora::App::Updates::Controller::Root - Root Controller for Fedora::App::Updates

=head1 METHODS

=head2 index

The main -- and only -- real public path.

=index2 packages

Redirect to the index action -- formerly an active public path.

=head2 end

Attempt to render a view, if needed.

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

