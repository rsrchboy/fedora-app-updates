use strict;
use warnings;
use Test::More tests => 3;

BEGIN { use_ok 'Catalyst::Test', 'Fedora::App::Updates' }
BEGIN { use_ok 'Fedora::App::Updates::Controller::Packages' }

ok( request('/packages')->is_success, 'Request should succeed' );


