use 5.006;
use strict;
use ExtUtils::MakeMaker;

# This module is only for Win32
unless ( $^O eq 'MSWin32' or $^O eq 'cygwin' ) {
	print "Not supported on this platform\n";
	exit(0);
}

WriteMakefile(
	'NAME'         => 'Win32::TieRegistry',
	'VERSION_FROM' => 'lib/Win32/TieRegistry.pm',
	'LICENSE'      => 'perl',
	'PREREQ_PM'    => {
		'Carp'               => 0,
		'Tie::Hash'          => 0,
		'Test::More'         => '0.42',

		# If we are upgrading Win32::TieRegistry,
		# then we want to also force the upgrade
		# of the underlying module.
		'Win32API::Registry' => '0.24',
	},
);
