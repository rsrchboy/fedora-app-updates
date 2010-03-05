package Fedora::App::Updates::Schema::Result::RpmFilelist;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Fedora::App::Updates::Schema::Result::RpmFilelist

=cut

__PACKAGE__->table("rpm_filelist");

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

=head2 dirname

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 255

=head2 filenames

  data_type: LONGTEXT
  default_value: undef
  is_nullable: 1
  size: 4294967295

=head2 filetypes

  data_type: LONGTEXT
  default_value: undef
  is_nullable: 1
  size: 4294967295

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
  "dirname",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "filenames",
  {
    data_type => "LONGTEXT",
    default_value => undef,
    is_nullable => 1,
    size => 4294967295,
  },
  "filetypes",
  {
    data_type => "LONGTEXT",
    default_value => undef,
    is_nullable => 1,
    size => 4294967295,
  },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-03-04 23:10:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:FF/9TURUvMNg0vs7opjjvw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
