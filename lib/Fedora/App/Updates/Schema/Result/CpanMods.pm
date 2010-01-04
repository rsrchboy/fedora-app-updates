package Fedora::App::Updates::Schema::Result::CpanMods;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("cpan_mods");
__PACKAGE__->add_columns(
  "mod_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "chapterid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "dslip",
  { data_type => "VARCHAR", default_value => undef, is_nullable => 1, size => 5 },
  "mod_vers",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 10,
  },
  "dist_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "mod_abs",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => 65535,
  },
  "mod_name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 100,
  },
);
__PACKAGE__->set_primary_key("mod_id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2010-01-03 17:46:23
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:yflZY/vl/4X/aldPGEOw+g


# You can replace this text with custom content, and it will be preserved on regeneration
1;
