use ExtUtils::MakeMaker;

# This module is only for Win32
unless ( $^O eq 'MSWin32' or $^O eq 'cygwin' ) {
	print "Win32::TieRegistry is only applicable to Win32 and cygwin\n";
	print "Install Result: N/A\n";
	exit(255);
}

WriteMakefile(
	'NAME'         => 'Win32::TieRegistry',
	'VERSION_FROM' => 'TieRegistry.pm', # finds $VERSION
	'LIBS'         => [''],             # e.g., '-lm'
	'DEFINE'       => '',               # e.g., '-DHAVE_SOMETHING'
	'INC'          => '',               # e.g., '-I/usr/include/other'
	'PREREQ_PM'    => {
		'Carp'               => 0,
		'Tie::Hash'          => 0,
		# If we are upgrading this, then we want to also
		# force the upgrade of the underlying module.
		'Win32API::Registry' => '0.24',
		},
);
