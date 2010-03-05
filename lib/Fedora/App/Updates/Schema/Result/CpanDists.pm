package Fedora::App::Updates::Schema::Result::CpanDists;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Fedora::App::Updates::Schema::Result::CpanDists

=cut

__PACKAGE__->table("cpan_dists");

=head1 ACCESSORS

=head2 dist_id

  data_type: INT
  default_value: undef
  is_nullable: 0
  size: 11

=head2 dist_vers

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 20

=head2 dist_dslip

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 5

=head2 dist_name

  data_type: VARCHAR
  default_value: undef
  is_nullable: 0
  size: 90

=head2 auth_id

  data_type: INT
  default_value: undef
  is_nullable: 0
  size: 11

=head2 dist_abs

  data_type: TEXT
  default_value: undef
  is_nullable: 1
  size: 65535

=head2 dist_file

  data_type: VARCHAR
  default_value: undef
  is_nullable: 0
  size: 110

=cut

__PACKAGE__->add_columns(
  "dist_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "dist_vers",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 20,
  },
  "dist_dslip",
  { data_type => "VARCHAR", default_value => undef, is_nullable => 1, size => 5 },
  "dist_name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 90,
  },
  "auth_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "dist_abs",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => 65535,
  },
  "dist_file",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 110,
  },
);
__PACKAGE__->set_primary_key("dist_id");


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-03-04 23:10:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:pQRipjeQUYkcXwJ8R3lcpw

######################################################################
# relationships

__PACKAGE__->belongs_to(
    'author',
    'CpanAuths',
    { 'foreign.id' => 'self.auth_id' },
);

1;
