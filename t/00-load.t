use strict;
use warnings;

use Test::More tests => 1; # last test to print

BEGIN {
    use_ok ( 'Dancer::Plugin::String::TT' ) || print 'Bail out';
}

diag( "Testing Dancer::Plugin::String::TT $Dancer::Plugin::String::TT::VERSION, Perl $], $^X" );
