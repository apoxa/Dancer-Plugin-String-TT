package Dancer::Plugin::String::TT; # You have to 'use' this in your App.pm

use strict;
use warnings;
our $VERSION = '0.02';

use Dancer ':syntax';  # This provides Dancer keywords like 'register'
use Dancer::Plugin;

use String::TT;

# The module adds a hook, which is called, just before the template is
# rendered. It then provides the 'tt'-keyword to the stash, so you can use
# this keyword in your templates like this:
# [% tt('[% foo %]') %]
add_hook(
    before_template => sub {
        my $tokens = shift;
        $tokens->{tt} = sub { _tt(@_); };
    },
);

# The module also registers the 'tt'-keyword to Dancer. After that, you can
# use it in your Dancer-app like this:
# my $rendered = tt('[% foo %]');
register tt => sub {
    _tt(@_);
};

# This is a wrapper-function, which calls the functions from another module
sub _tt {
    my ($str) = @_;
    return String::TT::strip(String::TT::tt($str));
}

# This function call is essential. It exports all functions defined with
# 'register', so your main Dancer-app can use them.
register_plugin;

# A perl module always ends with true!
1;

=encoding UTF-8

=head1 THIS IS AN EXAMPLE ONLY

You probably don't need this module. Consult the README for reasons.
It now serves mainly as an example for first-time Dancer-plugin authors.

=head1 NAME

Dancer::Plugin::String::TT - Easy way to use String:TT in Dancer

=head1 SYNOPSIS

use Dancer ':syntax';
use Dancer::Plugin::String::TT;

get '/' => sub {
    return tt('[% foo %]');
}

=head1 DESCRIPTION

Provides a way to process Templates in a scalar. This module relies on
L<String::TT>, please consult the documentation of String::TT.

=head1 CONTRIBUTING

This module is developed on Github at:

L<http://github.com/apoxa/Dancer-Plugin-String-TT>

=head1 ACKNOWLEDGEMENTS

Thanks to Tomas Doran to String::TT

=head1 BUGS

Please report any bugs or feature requests in github.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

perldoc Dancer::Plugin::String::TT

=head1 SEE ALSO

L<Dancer>
L<String::TT>

=cut
