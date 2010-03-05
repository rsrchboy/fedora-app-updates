package Fedora::App::Updates::Schema::Result::RpmRequires;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Fedora::App::Updates::Schema::Result::RpmRequires

=cut

__PACKAGE__->table("rpm_requires");

=head1 ACCESSORS

=head2 id

  data_type: INT
  default_value: undef
  is_auto_increment: 1
  is_nullable: 0
  size: 11

=head2 rpm_package_id

  data_type: INT
  default_value: undef
  is_nullable: 0
  size: 11

=head2 name

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 255

=head2 flags

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 255

=head2 epoch

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 255

=head2 version

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 255

=head2 release

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 255

=head2 pre

  data_type: ENUM
  default_value: undef
  extra: HASH(0x196d320)
  is_nullable: 1
  size: 1

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
  "rpm_package_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "flags",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "epoch",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "version",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "release",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "pre",
  {
    data_type => "ENUM",
    default_value => undef,
    extra => { list => [0, 1] },
    is_nullable => 1,
    size => 1,
  },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-03-04 23:10:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:VdOwl8Q/KnS/sh///z9llA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
