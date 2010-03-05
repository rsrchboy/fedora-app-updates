package Fedora::App::Updates::Schema::Result::CpanAuths;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Fedora::App::Updates::Schema::Result::CpanAuths

=cut

__PACKAGE__->table("cpan_auths");

=head1 ACCESSORS

=head2 auth_id

  data_type: INT
  default_value: undef
  is_nullable: 0
  size: 11

=head2 email

  data_type: TEXT
  default_value: undef
  is_nullable: 1
  size: 65535

=head2 fullname

  data_type: VARCHAR
  default_value: undef
  is_nullable: 0
  size: 40

=head2 cpanid

  data_type: VARCHAR
  default_value: undef
  is_nullable: 0
  size: 20

=cut

__PACKAGE__->add_columns(
  "auth_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "email",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => 65535,
  },
  "fullname",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 40,
  },
  "cpanid",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 20,
  },
);
__PACKAGE__->set_primary_key("auth_id");


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-03-04 23:10:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:k488PIaAoHuYBJ+zvl8z6g


# You can replace this text with custom content, and it will be preserved on regeneration
1;
