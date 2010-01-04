package Fedora::App::Updates::Schema::Result::CpanAuths;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("cpan_auths");
__PACKAGE__->add_columns(
  "auth_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "email",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => 65535,
  },
  "fullname",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 40,
  },
  "cpanid",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 20,
  },
);
__PACKAGE__->set_primary_key("auth_id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2010-01-03 17:46:23
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:VGrSC97rnBXJvvH1BGIWUQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
