use strict;
use warnings;

# This code does some basic testing. 

use Test::More import => ['!pass'];

use Dancer;
use Dancer::Test;

# Provide the path to your test-application
use lib 't/lib';
use TestApp;

# Number of planned tests
plan tests => 2;

setting appdir => setting('appdir') . '/t';

# This test check's if a request to '/' returns status-code 200 and the
# content 'Hello World'. Check the code in lib/TestApp.pm 
my $res = dancer_response GET => '/';
is $res->{status}, 200, 'check status response';
is $res->{content}, 'Hello World', 'check simple variable';
