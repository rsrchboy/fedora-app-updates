#!/usr/bin/env perl

use strict;
use warnings;

use lib "$ENV{HOME}/Fedora::App::Updates/lib";

use Plack::Handler::FCGI;
use Plack::Builder;

my $app = builder {

    do "$ENV{HOME}/Fedora::App::Updates/fedora::app::updates.psgi";
};

Plack::Handler::FCGI->new->run($app);
