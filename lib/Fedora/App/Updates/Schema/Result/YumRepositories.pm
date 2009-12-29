package Fedora::App::Updates::Schema::Result::YumRepositories;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("yum_repositories");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "source",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 32,
  },
  "name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 54,
  },
  "description",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => 65535,
  },
  "url",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "active",
  { data_type => "TINYINT", default_value => undef, is_nullable => 0, size => 1 },
  "stamp",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => 14,
  },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 15:58:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:xLw+y1/UXUWHABhvOBMyZQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
