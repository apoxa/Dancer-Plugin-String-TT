

use ExtUtils::MakeMaker;
# See lib/ExtUtils/MakeMaker.pm for details of how to influence
# the contents of the Makefile that is written.
WriteMakefile(
    NAME         => 'Dancer::Plugin::String::TT',
    VERSION_FROM => 'lib/Dancer/Plugin/String/TT.pm', # finds \$VERSION
    AUTHOR       => 'Benjamin Stier (ben@unpatched.de)',
    ABSTRACT     => 'Easy way to use String::TT in Dancer apps',
    PREREQ_PM    => {
                     'Test::Simple' => 0.44,
                    },
);
