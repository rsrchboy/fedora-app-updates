package Fedora::App::Updates::View::TT;

use strict;
use base 'Catalyst::View::TT';

__PACKAGE__->config({
    INCLUDE_PATH => [
        Fedora::App::Updates->path_to( 'root', 'src' ),
        Fedora::App::Updates->path_to( 'root', 'lib' )
    ],

    TEMPLATE_EXTENSION => '.tt2',

    PRE_PROCESS  => 'config/main',
    WRAPPER      => 'site/wrapper',
    ERROR        => 'error.tt2',
    TIMER        => 0
});

=head1 NAME

Fedora::App::Updates::View::TT - Catalyst TTSite View

=head1 SYNOPSIS

See L<Fedora::App::Updates>

=head1 DESCRIPTION

Catalyst TTSite View.

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
