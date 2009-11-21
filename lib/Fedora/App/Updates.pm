package Fedora::App::Updates;

use strict;
use warnings;

use Catalyst::Runtime 5.80;

# Set flags and add plugins for the application
#
#         -Debug: activates the debug mode for very useful log messages
#   ConfigLoader: will load the configuration from a Config::General file in the
#                 application's home directory
# Static::Simple: will serve static files from the application's root
#                 directory

use parent qw/Catalyst/;
use Catalyst qw/-Debug
                StackTrace
                ConfigLoader
                Static::Simple/;

our $VERSION = '0.000001';

# Configure the application.
#
# Note that settings in fedora_app_updates.conf (or other external
# configuration file that you set up manually) take precedence
# over this when using ConfigLoader. Thus configuration
# details given here can function as a default configuration,
# with an external configuration file acting as an override for
# local deployment.

__PACKAGE__->config( name => 'Fedora::App::Updates' );

# Start the application
__PACKAGE__->setup();


=head1 NAME

Fedora::App::Updates - Catalyst based application

=head1 SYNOPSIS

    script/fedora_app_updates_server.pl

=head1 DESCRIPTION

[enter your description here]

=head1 SEE ALSO

L<Fedora::App::Updates::Controller::Root>, L<Catalyst>

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
