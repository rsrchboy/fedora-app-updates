package Fedora::App::Updates::Schema::Result::RpmsToRepos;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Fedora::App::Updates::Schema::Result::RpmsToRepos

=cut

__PACKAGE__->table("rpms_to_repos");

=head1 ACCESSORS

=head2 rpm_id

  data_type: BIGINT
  default_value: undef
  is_nullable: 0
  size: 20

=head2 repo_id

  data_type: INT
  default_value: undef
  is_nullable: 0
  size: 11

=cut

__PACKAGE__->add_columns(
  "rpm_id",
  { data_type => "BIGINT", default_value => undef, is_nullable => 0, size => 20 },
  "repo_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
);
__PACKAGE__->set_primary_key("rpm_id", "repo_id");


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-03-04 23:10:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:5dcd9fZ6eZxABJ2oiEmgLQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
