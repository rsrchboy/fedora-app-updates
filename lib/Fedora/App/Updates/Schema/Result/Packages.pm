package Fedora::App::Updates::Schema::Result::Packages;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Fedora::App::Updates::Schema::Result::Packages

=cut

__PACKAGE__->table("packages");

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

=head2 owner_id

  data_type: VARCHAR
  default_value: undef
  is_nullable: 0
  size: 64

=head2 upstream_ga

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 64

=head2 upstream_devel

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 64

=head2 summary

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 128

=head2 url

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 255

=head2 license

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 64

=head2 group

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 64

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
  "owner_id",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 64,
  },
  "upstream_ga",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 64,
  },
  "upstream_devel",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 64,
  },
  "summary",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 128,
  },
  "url",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "license",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 64,
  },
  "group",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 64,
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
__PACKAGE__->add_unique_constraint("name", ["name"]);


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-03-04 23:10:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:WzwqWm1dOslZvLlo3b1i/w


__PACKAGE__->has_many(
  'versions',
  'Versions',
  { "foreign.package_id" => "self.id" },
);

__PACKAGE__->belongs_to(
  'owner',
  'Users',
  { "foreign.id" => "self.owner_id" },
);

sub dist_version {
    my ($self, $shortname) = @_;

    #return $self
    my $foo = $self
        ->versions
        ->find(
        #->search(
            #{ 'dist_id.shortname' => $shortname },
            { dist_id => $shortname },
            #{ join => 'dist_id'                 }
        )
        #->first

        ;

    ### $foo
    return $foo;
}

1;
