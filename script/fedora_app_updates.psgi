#!/usr/bin/env perl
use strict;
use warnings;

use Fedora::App::Updates;
Fedora::App::Updates->setup_engine('PSGI');

use Plack::Builder;

my $app = sub { Fedora::App::Updates->run(@_) };

builder {

    enable Debug => panels =>
        [ qw( Environment Response Timer Memory CatalystLog) ];

    $app;
}

#my $app = sub { Fedora::App::Updates->run(@_) };

