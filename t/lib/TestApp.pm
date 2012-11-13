package t::lib::TestApp;

use Dancer;
use Dancer::Plugin::String::TT;

get '/' => sub {
    my $template = qq{ [% hello = 'Hello World' %] [% hello %]};
    return tt($template);
};

1;
