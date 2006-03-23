use ExtUtils::MakeMaker;

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
