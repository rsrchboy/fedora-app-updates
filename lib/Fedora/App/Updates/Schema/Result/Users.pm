package Fedora::App::Updates::Schema::Result::Users;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Fedora::App::Updates::Schema::Result::Users

=cut

__PACKAGE__->table("users");

=head1 ACCESSORS

=head2 id

  data_type: VARCHAR
  default_value: undef
  is_nullable: 0
  size: 64

=head2 extra

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
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 64,
  },
  "extra",
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
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:TrY3zmSn4ucTXK4Vl9QYQQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
