package Fedora::App::Updates::Controller::Root;

#use strict;
#use warnings;
#use parent 'Catalyst::Controller';

use Moose;
BEGIN { extends 'Catalyst::Controller' }

#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config->{namespace} = '';

=head1 NAME

Fedora::App::Updates::Controller::Root - Root Controller for Fedora::App::Updates

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=cut

=head2 index

=cut

sub index : Path Args(0) {
    my ( $self, $c ) = @_;

    # Hello World
    #$c->response->body( $c->welcome_message );
}

sub default : Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

use Fedora::App::Updates::Form::Search;

has search_form => (
    is      => 'ro',
    isa     => 'Fedora::App::Updates::Form::Search',
    lazy    => 1,
    clearer => 'clear_search_form',
    default => sub { Fedora::App::Updates::Form::Search->new },
);

sub packages : Path('packages') Args(0) {
    my ($self, $c) = @_;

    # setup our packages resultset
    my $packages = $c->stash->{packages} = $c
        ->model('Updates::Packages')
        ->search(
            { name => { like => 'perl%' }   },
            { order_by => 'name', rows => 40},
        )
        ;

    # let's try out this pager thingie, hmm?
    my $page = $c->request->param('page');
    $page = 1 if (not defined $page) || ($page !~ /^\d+$/);

    $packages = $c->stash->{packages}->page($page);
    $c->stash->{pager} = $packages->pager;

    # get our list of dists to display
    my @dists = $c
        ->model('Updates::Dist')
        ->search(undef, { order_by => 'shortname DESC' })
        ->get_column('shortname')
        ->all
        ;
    $c->stash->{dists} = \@dists;

    my @dist_ids = $c
        ->model('Updates::Dist')
        ->search(undef, { order_by => 'shortname DESC' })
        ->get_column('id')
        ->all
        ;
    $c->stash->{dist_ids} = \@dist_ids;

    $c->stash->{search_form} = $self->search_form;

    return;
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

Chris Weyl

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
