use strict;
use warnings;

use Fedora::App::Updates;

my $app = Fedora::App::Updates->apply_default_middlewares(Fedora::App::Updates->psgi_app);
$app;

