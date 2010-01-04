package Fedora::App::Updates::Schema::Result::YumRepositories;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("InflateColumn::DateTime", "Core");
__PACKAGE__->table("yum_repositories");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "collection_id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "arch",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 0,
    size => 12,
  },
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


# Created by DBIx::Class::Schema::Loader v0.04006 @ 2010-01-03 17:46:23
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:V7ZzJoINrv7/r8TThYCAUg

use YUM::RepoQuery;

######################################################################
# relationships

__PACKAGE__->has_many(
    'logs',
    'YumReposLog',
    { 'foreign.repo_id' => 'self.id' },
);

__PACKAGE__->belongs_to(
    'collection',
    'Collection',
    { 'foreign.id' => 'self.collection_id' },
);

######################################################################
# row methods

sub last_update_unixtime {
    my $self = shift @_;

    my $rs = $self
        ->search_related(logs => { status => 'SUCCESS' })
        ->get_column('repo_unixtime')
        ->max
        || 0
        ;
}

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
