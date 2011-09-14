use strict;
use warnings;

use Plack::Builder;
use Plack::Middleware::MethodOverride ();

use Fedora::App::Updates;

builder {

    # Plack::Middleware::Static::Minifier <-- use in !development

    enable 'AccessLog';
    enable Static =>
        path => qr{^/static/(images|js|css)/},
        root => 'root/'
        ;

    enable 'Debug'; # XXX only in debug mode, yes?
    enable 'MethodOverride';

    my $app = Fedora::App::Updates->apply_default_middlewares(Fedora::App::Updates->psgi_app);
    $app;
};
