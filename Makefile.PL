use 5.006;
use strict;
use ExtUtils::MakeMaker;

# Don't prevent this running on Win32.
# THIS distribution is inherantly platform-neutral, but the underlying
# dependency is not. Allow non-Win32 platforms to fail on our dependency,
# instead of on this module. This allows any unusual cases like Wine
# (that are able to get the dependency installed) to install this ok.

WriteMakefile(
	'NAME'         => 'Win32::TieRegistry',
	'ABSTRACT'     => 'Manipulate the Win32 Registry',
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
