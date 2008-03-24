#!/usr/bin/perl

# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl test.pl'

######################### We start with some black magic to print on failure.

# Change 1..1 below to 1..last_test_to_print .
# (It may become useful if the test is moved to ./t subdirectory.)

BEGIN {
	$|  = 1;
	$^W = 1;
	print "1..4\n";
}
END {
	print "not ok 1\n" unless $loaded;
}
my $reg;
use Win32::TieRegistry (
	Delimiter   => "/",
	ArrayValues => 1,
	TiedRef     => \$reg,
	":REG_",
);
$loaded = 1;
print "ok 1\n";

######################### End of black magic.

$|= 1   if  $Debug= ( -t STDIN ) != ( -t STDOUT );

my $val= $reg->{ "CUser/Software/Microsoft/Windows/CurrentVersion/"
    . "Policies/Explorer//NoDriveTypeAutoRun" };
print "# Can't open CU/SW/MS/Win/CV/Pol/Exp//NoDriveTypeAutoRun: ",$^E,$/
    if  ! $val  &&  $Debug;
print $val ? "" : "not ", "ok 2\n";

print '# REG_DWORD is ',REG_DWORD,', type is ',$val->[1],$/   if  $Debug;
print REG_DWORD == $val->[1] ? "" : "not ", "ok 3\n";

print '# $val->[0] is "',$val->[0],'".',$/   if  $Debug;
print $val->[0] =~ /^0x[\da-f]{8}$/i ? "" : "not ", "ok 4\n";
