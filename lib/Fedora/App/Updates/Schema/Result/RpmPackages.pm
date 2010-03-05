package Fedora::App::Updates::Schema::Result::RpmPackages;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Fedora::App::Updates::Schema::Result::RpmPackages

=cut

__PACKAGE__->table("rpm_packages");

=head1 ACCESSORS

=head2 id

  data_type: INT
  default_value: undef
  is_auto_increment: 1
  is_nullable: 0
  size: 11

=head2 collection_id

  data_type: INT
  default_value: undef
  is_nullable: 0
  size: 11

=head2 in_ga

  data_type: TINYINT
  default_value: undef
  is_nullable: 0
  size: 1

=head2 in_updates

  data_type: TINYINT
  default_value: undef
  is_nullable: 0
  size: 1

=head2 in_testing

  data_type: TINYINT
  default_value: undef
  is_nullable: 0
  size: 1

=head2 in_other

  data_type: TINYINT
  default_value: undef
  is_nullable: 0
  size: 1

=head2 stamp

  data_type: TIMESTAMP
  default_value: SCALAR(0x1370ef8)
  is_nullable: 0
  size: 14

=head2 rpmkey

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 255

=head2 name

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 255

=head2 arch

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 255

=head2 version

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 255

=head2 epoch

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 255

=head2 release

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 255

=head2 summary

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 255

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

=head2 time_file

  data_type: DATETIME
  default_value: undef
  is_nullable: 1
  size: 19

=head2 time_build

  data_type: DATETIME
  default_value: undef
  is_nullable: 1
  size: 19

=head2 rpm_license

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 255

=head2 rpm_vendor

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 255

=head2 rpm_group

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 255

=head2 rpm_buildhost

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 255

=head2 rpm_sourcerpm

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 255

=head2 rpm_header_start

  data_type: INT
  default_value: undef
  is_nullable: 1
  size: 11

=head2 rpm_header_end

  data_type: INT
  default_value: undef
  is_nullable: 1
  size: 11

=head2 rpm_packager

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 255

=head2 size_package

  data_type: INT
  default_value: undef
  is_nullable: 1
  size: 11

=head2 size_installed

  data_type: INT
  default_value: undef
  is_nullable: 1
  size: 11

=head2 size_archive

  data_type: INT
  default_value: undef
  is_nullable: 1
  size: 11

=head2 location_href

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 255

=head2 location_base

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 255

=head2 checksum_type

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 255

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
  "collection_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "in_ga",
  { data_type => "TINYINT", default_value => undef, is_nullable => 0, size => 1 },
  "in_updates",
  { data_type => "TINYINT", default_value => undef, is_nullable => 0, size => 1 },
  "in_testing",
  { data_type => "TINYINT", default_value => undef, is_nullable => 0, size => 1 },
  "in_other",
  { data_type => "TINYINT", default_value => undef, is_nullable => 0, size => 1 },
  "stamp",
  {
    data_type => "TIMESTAMP",
    default_value => \"CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => 14,
  },
  "rpmkey",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "arch",
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
  "epoch",
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
  "summary",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
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
    is_nullable => 1,
    size => 255,
  },
  "time_file",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 1,
    size => 19,
  },
  "time_build",
  {
    data_type => "DATETIME",
    default_value => undef,
    is_nullable => 1,
    size => 19,
  },
  "rpm_license",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "rpm_vendor",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "rpm_group",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "rpm_buildhost",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "rpm_sourcerpm",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "rpm_header_start",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "rpm_header_end",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "rpm_packager",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "size_package",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "size_installed",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "size_archive",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "location_href",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "location_base",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "checksum_type",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("repo_id", ["collection_id", "rpmkey"]);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-03-04 23:10:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:r9TiIcuacZvaTeNyo2NYCQ

######################################################################
# relationships

__PACKAGE__->has_many(
    'rpm_changelog',
    'RpmChangelog',
    { 'foreign.rpm_package_id' => 'self.id' },
);

__PACKAGE__->has_many(
    'rpm_conflicts',
    'Rpm',
    { 'foreign.rpm_package_id' => 'self.id' },
);

__PACKAGE__->has_many(
    'rpm_filelist',
    'RpmFilelist',
    { 'foreign.rpm_package_id' => 'self.id' },
);

__PACKAGE__->has_many(
    'rpm_files',
    'RpmFiles',
    { 'foreign.rpm_package_id' => 'self.id' },
);

__PACKAGE__->has_many(
    'rpm_obsoletes',
    'RpmObsoletes',
    { 'foreign.rpm_package_id' => 'self.id' },
);

__PACKAGE__->has_many(
    'rpm_provides',
    'RpmProvides',
    { 'foreign.rpm_package_id' => 'self.id' },
);

__PACKAGE__->has_many(
    'rpm_requires',
    'RpmRequires',
    { 'foreign.rpm_package_id' => 'self.id' },
);

__PACKAGE__->belongs_to(
    'repo',
    'YumRepositores',
    { 'foreign.id' => 'self.repo_id' },
);

1;
