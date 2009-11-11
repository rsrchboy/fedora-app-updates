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


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-11-10 22:55:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:e/6TGiEu4s0QL9c5NRYrDA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
