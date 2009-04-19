#!/usr/bin/perl

use strict;
BEGIN {
	$|  = 1;
	$^W = 1;
}

use Test::More tests => 3;

my $reg;
use Win32::TieRegistry (
	Delimiter   => "/",
	ArrayValues => 1,
	TiedRef     => \$reg,
	":REG_",
);

my $val = $reg->{ "CUser/Software/Microsoft/Windows/CurrentVersion/"
    . "Policies/Explorer//NoDriveTypeAutoRun" };
ok( $val, 'Opened CU/SW/MS/Win/CV/Pol/Exp//NoDriveTypeAutoRun' );
is( REG_DWORD, $val->[1], 'Type is REG_DWORD' );
like( $val->[0], qr/^0x[\da-f]{8}$/i, 'Value matches expected' );
