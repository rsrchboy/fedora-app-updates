package Fedora::App::Updates::Schema::Result::YumRepositories;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

Fedora::App::Updates::Schema::Result::YumRepositories

=cut

__PACKAGE__->table("yum_repositories");

=head1 ACCESSORS

=head2 id

  data_type: INT
  default_value: undef
  is_auto_increment: 1
  is_nullable: 0
  size: 11

=head2 collection_id

  data_type: INT
  default_value: undef
  is_nullable: 0
  size: 11

=head2 arch

  data_type: VARCHAR
  default_value: undef
  is_nullable: 0
  size: 12

=head2 source

  data_type: VARCHAR
  default_value: undef
  is_nullable: 0
  size: 32

=head2 name

  data_type: VARCHAR
  default_value: undef
  is_nullable: 0
  size: 54

=head2 description

  data_type: TEXT
  default_value: undef
  is_nullable: 1
  size: 65535

=head2 url

  data_type: VARCHAR
  default_value: undef
  is_nullable: 0
  size: 255

=head2 srpm_url

  data_type: VARCHAR
  default_value: undef
  is_nullable: 1
  size: 255

=head2 active

  data_type: TINYINT
  default_value: 1
  is_nullable: 0
  size: 1

=head2 stamp

  data_type: TIMESTAMP
  default_value: SCALAR(0x1370ef8)
  is_nullable: 0
  size: 14

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
    default_value => \"CURRENT_TIMESTAMP",
    is_nullable => 0,
    size => 14,
  },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.05002 @ 2010-03-04 23:10:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:NzlkaYCHigC3uiExpg80/g

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
    'Collections',
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
