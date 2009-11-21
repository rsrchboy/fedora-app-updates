package Fedora::App::Updates::Schema::Result::Packages;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("packages");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
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
    default_value => "CURRENT_TIMESTAMP",
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


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-11-10 22:55:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:BZneemEqJx8q4zq9JXzseQ


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
