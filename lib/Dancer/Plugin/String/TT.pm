package Dancer::Plugin::String::TT;

use strict;
use warnings;
our $VERSION = '0.01';

use Dancer ':syntax';
use Dancer::Plugin;

use String::TT;

add_hook(
    before_template => sub {
        my $tokens = shift;
        $tokens->{tt} = sub { _tt(@_); };
    },
);

register tt => sub {
    _tt(@_);
};

sub _tt {
    my ($str) = @_;
    return String::TT::strip(String::TT::tt($str));
}

register_plugin;

1;

=encoding UTF-8

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
