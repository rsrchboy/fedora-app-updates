package Fedora::App::Updates::Schema::Result::YumRepositories;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("yum_repositories");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "source",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 32,
  },
  "name",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 54,
  },
  "description",
  {
    data_type => "TEXT",
    default_value => undef,
    is_nullable => 1,
    size => 65535,
  },
  "url",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "srpm_url",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "active",
  { data_type => "TINYINT", default_value => 1, is_nullable => 0, size => 1 },
  "stamp",
  {
    data_type => "TIMESTAMP",
    default_value => "CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => 14,
  },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2009-12-31 13:39:10
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:5eYuIcz8OaTQCaygLg5H4Q

use YUM::RepoQuery;

sub repo {
    my $self = shift @_;

    my $repo_id = $self->id;
    return YUM::RepoQuery->new(id => "repo-$repo_id-rpms", uri => $self->url);
}

sub srpm_repo {
    my $self = shift @_;

    return unless $self->srpm_url;

    my $repo_id = $self->id;
    return YUM::RepoQuery->new(
        id  => "repo-$repo_id-srpms", 
        uri => $self->srpm_url,
    );
}

1;