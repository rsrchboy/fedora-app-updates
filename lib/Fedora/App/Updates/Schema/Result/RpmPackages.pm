package Fedora::App::Updates::Schema::Result::RpmPackages;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("rpm_packages");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "repo_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
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


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2010-01-03 17:46:23
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:WqJtCzaLezBeu2waFq8uJw

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
