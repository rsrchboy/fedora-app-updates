package Fedora::App::Updates::Schema::Result::CpanMods;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Fedora::App::Updates::Schema::Result::CpanMods

=cut

__PACKAGE__->table("cpan_mods");

=head1 ACCESSORS

=head2 mod_id

  data_type: INT
  default_value: undef
  is_nullable: 0
  size: 11

=head2 chapterid

  data_type: INT
  default_value: undef
  is_nullable: 1
  size: 11

=head2 dslip

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 5

=head2 mod_vers

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 10

=head2 dist_id

  data_type: INT
  default_value: undef
  is_nullable: 0
  size: 11

=head2 mod_abs

  data_type: TEXT
  default_value: undef
  is_nullable: 1
  size: 65535

=head2 mod_name

  data_type: VARCHAR
  default_value: undef
  is_nullable: 0
  size: 100

=cut

__PACKAGE__->add_columns(
  "mod_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "chapterid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "dslip",
  { data_type => "VARCHAR", default_value => undef, is_nullable => 1, size => 5 },
  "mod_vers",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 10,
  },
  "dist_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "mod_abs",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => 65535,
  },
  "mod_name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 100,
  },
);
__PACKAGE__->set_primary_key("mod_id");


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-03-04 23:10:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:VBVFq9yhgeZybVUMzjgKkw

######################################################################
# relationships

__PACKAGE__->belongs_to(
    'dist',
    'CpanDists',
    { 'foreign.id' => 'self.dist_id' },
);


1;
