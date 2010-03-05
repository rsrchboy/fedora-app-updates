package Fedora::App::Updates::Schema::Result::Dist;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Fedora::App::Updates::Schema::Result::Dist

=cut

__PACKAGE__->table("dist");

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
  size: 64

=head2 shortname

  data_type: VARCHAR
  default_value: undef
  is_nullable: 0
  size: 8

=head2 ga_tag

  data_type: VARCHAR
  default_value: undef
  is_nullable: 0
  size: 128

=head2 updates_tag

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 128

=head2 testing_tag

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 128

=head2 candidates_tag

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 128

=head2 stamp

  data_type: TIMESTAMP
  default_value: SCALAR(0x1370ef8)
  is_nullable: 0
  size: 14

=head2 extra

  data_type: TEXT
  default_value: undef
  is_nullable: 1
  size: 65535

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
    size => 64,
  },
  "shortname",
  { data_type => "VARCHAR", default_value => undef, is_nullable => 0, size => 8 },
  "ga_tag",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 128,
  },
  "updates_tag",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 128,
  },
  "testing_tag",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 128,
  },
  "candidates_tag",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 128,
  },
  "stamp",
  {
    data_type => "TIMESTAMP",
    default_value => \"CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => 14,
  },
  "extra",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => 65535,
  },
);
__PACKAGE__->set_primary_key("id");
__PACKAGE__->add_unique_constraint("shortname", ["shortname"]);
__PACKAGE__->add_unique_constraint("name", ["name"]);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-03-04 23:10:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:X+q62WcsMqOljcxZreh9Gw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
