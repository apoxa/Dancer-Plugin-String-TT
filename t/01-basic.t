use strict;
use warnings;

use Test::More import => ['!pass'];

use Dancer;
use Dancer::Test;

use lib 't/lib';
use TestApp;

plan tests => 2;

setting appdir => setting('appdir') . '/t';

my $res = dancer_response GET => '/';
is $res->{status}, 200, 'check status response';
is $res->{content}, 'Hello World', 'check simple variable';
