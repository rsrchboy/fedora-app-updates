package Fedora::App::Updates::Schema::Result::Requires;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("requires");
__PACKAGE__->add_columns(
  "id",
  { data_type => "BIGINT", default_value => undef, is_nullable => 0, size => 20 },
  "version_id",
  { data_type => "BIGINT", default_value => undef, is_nullable => 0, size => 20 },
  "name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "qualifier",
  { data_type => "VARCHAR", default_value => undef, is_nullable => 1, size => 8 },
  "value",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 128,
  },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-28 15:58:39
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:2ESfPKLwHS9fSkZ1xmtWaQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
