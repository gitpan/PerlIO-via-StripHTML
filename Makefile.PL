require 5.008;
use Config;
use ExtUtils::MakeMaker;

if (!$Config{useperlio}) {
    warn <<WHOA
*** WHOA THERE!!! ***
This is not a perlio-enabled perl !
WHOA
}

WriteMakefile(
    NAME	    => 'PerlIO::Via::StripHTML',
    VERSION_FROM    => 'lib/PerlIO/Via/StripHTML.pm',
    PREREQ_PM	    => {
	'HTML::Parser' => 3.00,
    },
);
