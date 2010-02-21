#!/usr/bin/env perl
# IMPORTANT: if you delete this file your app will not work as
# expected.  You have been warned.
use inc::Module::Install;

name 'Fedora-App-Updates';
#githubmeta;
all_from 'lib/Fedora/App/Updates.pm';

requires 'Catalyst::Runtime' => '5.80013';
requires 'Catalyst::Plugin::ConfigLoader';
requires 'Catalyst::Plugin::Static::Simple';
requires 'Catalyst::Plugin::StackTrace' => '0.11';
requires 'Catalyst::Action::RenderView';
requires 'Catalyst::Model::DBIC::Schema' => '0.31';
requires 'Catalyst::View::TT' => '0.31';

requires 'parent';
requires 'namespace::autoclean';
requires 'namespace::clean';

requires 'Config::General'; 
requires 'DBIx::Class' => '0.08112';
requires 'YUM::RepoQuery';

# tools
requires 'autodie';
requires 'IPC::System::Simple';
requires 'CPAN::SQLite';
requires 'URI::Fetch';
requires 'JSON::XS';

catalyst;

install_script glob('script/*.pl');

extra_tests;
auto_install;
auto_provides;
WriteAll;
