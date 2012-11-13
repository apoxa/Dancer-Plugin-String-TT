package t::lib::TestApp;

use Dancer;
use Dancer::Plugin::String::TT;

# Provide a simple test-case
get '/' => sub {
    my $template = qq{ [% hello = 'Hello World' %] [% hello %]};
    return tt($template);
};

1;
