package Fedora::App::Updates::Schema::Result::YumReposLog;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("yum_repos_log");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "repo_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "repo_unixtime",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "repo_date",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 1,
    size => 19,
  },
  "start_time",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 1,
    size => 19,
  },
  "stop_time",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 1,
    size => 19,
  },
  "status",
  { data_type => "ENUM", default_value => undef, is_nullable => 0, size => 8 },
  "message",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => 65535,
  },
  "stamp",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => 14,
  },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2010-01-04 21:06:11
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:4Tq4i2Ysk/Sjk8lf8rrZAQ

######################################################################
# relationships

__PACKAGE__->belongs_to(
    'repos',
    'Yumrepositories',
    { 'foreign.id' => 'self.repo_id' },
);

1;
