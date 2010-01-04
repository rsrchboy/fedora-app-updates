package Fedora::App::Updates::Schema::Result::CpanChaps;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("cpan_chaps");
__PACKAGE__->add_columns(
  "chap_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "chapterid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "subchapter",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => 65535,
  },
  "dist_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("chap_id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2010-01-03 17:46:23
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ayLkh3dwApQHrrsbXI+QbQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
