package Fedora::App::Updates::Schema::Result::YumReposLog;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Fedora::App::Updates::Schema::Result::YumReposLog

=cut

__PACKAGE__->table("yum_repos_log");

=head1 ACCESSORS

=head2 id

  data_type: INT
  default_value: undef
  is_auto_increment: 1
  is_nullable: 0
  size: 11

=head2 repo_id

  data_type: INT
  default_value: undef
  is_nullable: 0
  size: 11

=head2 repo_unixtime

  data_type: INT
  default_value: undef
  is_nullable: 1
  size: 11

=head2 repo_date

  data_type: DATETIME
  default_value: undef
  is_nullable: 1
  size: 19

=head2 start_time

  data_type: DATETIME
  default_value: undef
  is_nullable: 1
  size: 19

=head2 stop_time

  data_type: DATETIME
  default_value: undef
  is_nullable: 1
  size: 19

=head2 status

  data_type: ENUM
  default_value: undef
  extra: HASH(0x1959f50)
  is_nullable: 0
  size: 8

=head2 message

  data_type: TEXT
  default_value: undef
  is_nullable: 1
  size: 65535

=head2 stamp

  data_type: TIMESTAMP
  default_value: SCALAR(0x1370ef8)
  is_nullable: 0
  size: 14

=cut

__PACKAGE__->add_columns(
  "id",
  {
    data_type => "INT",
    default_value => undef,
    is_auto_increment => 1,
    is_nullable => 0,
    size => 11,
  },
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
  {
    data_type => "ENUM",
    default_value => undef,
    extra => { list => ["SUCCESS", "FAIL", "ABORTED", "UPTODATE"] },
    is_nullable => 0,
    size => 8,
  },
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
    default_value => \"CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => 14,
  },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-03-04 23:10:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:i9bTQ8moJkzhFwmO87xw8A

######################################################################
# relationships

__PACKAGE__->belongs_to(
    'repos',
    'Yumrepositories',
    { 'foreign.id' => 'self.repo_id' },
);

1;
