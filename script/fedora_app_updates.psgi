#!/usr/bin/env perl
use strict;
use warnings;
use Fedora::App::Updates;

Fedora::App::Updates->setup_engine('PSGI');
my $app = sub { Fedora::App::Updates->run(@_) };

