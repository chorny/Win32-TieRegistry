#!/usr/bin/perl

use strict;
BEGIN {
	$|  = 1;
	$^W = 1;
}

use Test::More;
if ( $^O eq 'MSWin32' or $^O eq 'cygwin' ) {
	plan( tests => 3 );
} else {
	plan( skip_all => 'Not testing on non-Windows' );
}

my $reg;
use Win32API::Registry 'regLastError';
use Win32::TieRegistry (
	Delimiter   => "/",
	ArrayValues => 1,
	TiedRef     => \$reg,
	":REG_", ":KEY_",
);

$reg = $reg->Open('', {Access => KEY_READ} ); # RT#102385
my $val = $reg->{ "CUser/Software/Microsoft/Windows/CurrentVersion/"
    . "Policies/Explorer//NoDriveTypeAutoRun" };
if (!defined($val)) {
  diag "\$^E = $^E, code=".(0+$^E).' regLastError='.(regLastError());
  diag "does not exist" unless exists $reg->{ "CUser/Software/Microsoft/Windows/CurrentVersion/"
    . "Policies/Explorer//NoDriveTypeAutoRun" };
  diag "parent does not exist" unless exists $reg->{ "CUser/Software/Microsoft/Windows/CurrentVersion/"
    . "Policies/Explorer" };
}
ok( $val, 'Opened CU/SW/MS/Win/CV/Pol/Exp//NoDriveTypeAutoRun' );
is( REG_DWORD, $val->[1], 'Type is REG_DWORD' );
like( $val->[0], qr/^0x[\da-f]{8}$/i, 'Value matches expected' );
