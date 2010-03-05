package Fedora::App::Updates::Schema::Result::CpanChaps;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Fedora::App::Updates::Schema::Result::CpanChaps

=cut

__PACKAGE__->table("cpan_chaps");

=head1 ACCESSORS

=head2 chap_id

  data_type: INT
  default_value: undef
  is_nullable: 0
  size: 11

=head2 chapterid

  data_type: INT
  default_value: undef
  is_nullable: 1
  size: 11

=head2 subchapter

  data_type: TEXT
  default_value: undef
  is_nullable: 1
  size: 65535

=head2 dist_id

  data_type: INT
  default_value: undef
  is_nullable: 0
  size: 11

=cut

__PACKAGE__->add_columns(
  "chap_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "chapterid",
  { data_type => "INT", default_value => undef, is_nullable => 1, size => 11 },
  "subchapter",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => 65535,
  },
  "dist_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("chap_id");


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-03-04 23:10:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:qYLhnxmDntU9Iy5abQmuLg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
