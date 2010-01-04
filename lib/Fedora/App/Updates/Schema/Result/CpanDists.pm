package Fedora::App::Updates::Schema::Result::CpanDists;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("cpan_dists");
__PACKAGE__->add_columns(
  "dist_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "dist_vers",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 20,
  },
  "dist_dslip",
  { data_type => "VARCHAR", default_value => undef, is_nullable => 1, size => 5 },
  "dist_name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 90,
  },
  "auth_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "dist_abs",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => 65535,
  },
  "dist_file",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 110,
  },
);
__PACKAGE__->set_primary_key("dist_id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2010-01-03 17:46:23
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:qZO/WXyQrGyZ+dxmer7Tjg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
