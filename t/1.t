#!perl

use strict;
use warnings;

use Test::More tests => 6;

BEGIN {
    use_ok('PerlIO::Via::StripHTML');
}

chdir 't' if -d 't';

undef $/;
open my $fh, '<:Via(PerlIO::Via::StripHTML)', '1.html'
    or die "Can't open 1.html: $!\n";
my $file = <$fh>;
close $fh;

like( $file, qr/Hello world/, 'Got some text' );
like( $file, qr/Normal and bold text/, 'Strips tags' );
unlike( $file, qr/be.ignored/, 'Ignores parts to be ignored' );
like( $file, qr/<\xe9>/, 'Translates entities' );
like( $file, qr/entities\n\n\n\z/, 'Got the end of file' );
