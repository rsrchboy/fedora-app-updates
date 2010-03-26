#############################################################################
#
# Author:  Chris Weyl (cpan:RSRCHBOY), <cweyl@alumni.drew.edu>
# Company: No company, personal work
# Created: 03/26/2010
#
# Copyright (c) 2010  <cweyl@alumni.drew.edu>
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
#############################################################################

package Fedora::App::Updates::Schema::ResultSet::Packages;

use strict;
use warnings;

use base 'DBIx::Class::ResultSet';

sub all_versions {
    my ($self) = @_;

    my @rows = ();

    while (my $row = $self->next) {

        # FIXME this should all be refactored out into a Result class method

        my $data = {
            name        => $row->name,
            upstream_ga => $row->upstream_ga,
            owner       => $row->owner_id,
        };

        my $versions_rs = $row->search_related(
            'versions', undef, { prefetch => [ 'dist' ] },
        );

        #$data->{$_->dist->shortname} = $_->current while $_ = $versions_rs->next;
        while (my $v = $versions_rs->next) {

            #my $sn = $v->dist->shortname;
            my ($sn, $c, $class) =
                ($v->dist->shortname, $v->current, $v->update_class);
            $data->{$sn}         = $v->current;
            $data->{"$sn-class"} = $v->update_class;
            $data->{"$sn-html"}  = qq{<span class="$class">$c</span>};
        }

        push @rows, $data;
    }

    return \@rows;
}

1;

__END__

=head1 NAME

Fedora::App::Updates::Schema::ResultSet::Packages - Packages ResultSet class

=head1 SYNOPSIS

use <Module::Name>;
# Brief but working code example(s) here showing the most common usage(s)

# This section will be as far as many users bother reading
# so make it as educational and exemplary as possible.


=head1 DESCRIPTION

    A full description of the module and its features.
May include numerous subsections (i.e. =head2, =head3, etc.)


=head1 methods

=head2 all_versions

Collapse our disparate versions down into one hash, suitable for sending back
as encoded data (typically JSON).

=head1 AUTHOR

Chris Weyl  <cweyl@alumni.drew.edu>


=head1 LICENSE AND COPYRIGHT

Copyright (c) 2010  <cweyl@alumni.drew.edu>

This library is free software; you can redistribute it and/or
modify it under the terms of the GNU Lesser General Public
License as published by the Free Software Foundation; either
version 2.1 of the License, or (at your option) any later version.

This library is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
Lesser General Public License for more details.

You should have received a copy of the GNU Lesser General Public
License along with this library; if not, write to the

    Free Software Foundation, Inc.
    59 Temple Place, Suite 330
    Boston, MA  02111-1307  USA

=cut


