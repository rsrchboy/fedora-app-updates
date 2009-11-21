use strict;
use warnings;
use Test::More tests => 3;

BEGIN { use_ok 'Catalyst::Test', 'Fedora::App::Updates' }
BEGIN { use_ok 'Fedora::App::Updates::Controller::REST' }

ok( request('/rest')->is_success, 'Request should succeed' );


