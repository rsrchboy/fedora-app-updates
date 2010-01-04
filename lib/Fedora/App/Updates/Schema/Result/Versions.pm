package Fedora::App::Updates::Schema::Result::Versions;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("versions");
__PACKAGE__->add_columns(
  "dist_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "package_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "ga_version",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 16,
  },
  "ga_release",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 16,
  },
  "ga_build_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "updates_version",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 16,
  },
  "updates_release",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 16,
  },
  "updates_build_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "testing_version",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 16,
  },
  "testing_release",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 16,
  },
  "testing_build_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "candidates_version",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 16,
  },
  "candidates_release",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 16,
  },
  "candidates_build_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "stamp",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => 14,
  },
  "extra",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => 65535,
  },
);
__PACKAGE__->set_primary_key("dist_id", "package_id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2010-01-03 17:46:23
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:1fNHE0jK0z1n+l9FVN3PkQ

__PACKAGE__->belongs_to(
  'dist',
  'Dist',
  { 'foreign.id' => 'self.dist_id' },
);

__PACKAGE__->belongs_to(
  'package',
  'Packages',
  { 'foreign.id' => 'self.package_id' },
);

# find the latest version generally installable version
sub current {
    my $self = shift @_;

    my $update_ver = $self->updates_version;
    my $ga_ver     = $self->ga_version;

    return $update_ver ? $update_ver : $ga_ver;
}

# determine what the td class should be for this package/version
sub update_class {
    my $self = shift @_;

    #my $current     = $self->current;
    #my $upstream_ga = $self->package->upstream_ga;
    #return 'attn' if $self->current lt $self->package->upstream_ga;
    #return 'check'

    return 'error' if not defined $self->current;
    return 'check' if not defined $self->package->upstream_ga;
    return $self->current lt $self->package->upstream_ga
         ? 'attn'
         : 'check'
         ;
}

1;
