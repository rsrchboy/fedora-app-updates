package Fedora::App::Updates::Schema::Result::Collections;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Fedora::App::Updates::Schema::Result::Collections

=cut

__PACKAGE__->table("collections");

=head1 ACCESSORS

=head2 id

  data_type: INT
  default_value: undef
  is_auto_increment: 1
  is_nullable: 0
  size: 11

=head2 name

  data_type: VARCHAR
  default_value: undef
  is_nullable: 0
  size: 128

=head2 active

  data_type: TINYINT
  default_value: 1
  is_nullable: 0
  size: 1

=head2 description

  data_type: TEXT
  default_value: undef
  is_nullable: 1
  size: 65535

=head2 url

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 255

=head2 parent_id

  data_type: INT
  default_value: undef
  is_nullable: 1
  size: 11

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
  "name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 128,
  },
  "active",
  { data_type => "TINYINT", default_value => 1, is_nullable => 0, size => 1 },
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
    is_nullable => 1,
    size => 255,
  },
  "parent_id",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:fNU8MDklTH78OADalntsXw

__PACKAGE__->has_many(
    'yum_repositories',
    'YumRepositories',
    { 'foreign.collection_id' => 'self.id' },
);

__PACKAGE__->has_many(
    'rpm_packages',
    'RpmPackages',
    { 'foreign.collection_id' => 'self.id' },
);

1;
