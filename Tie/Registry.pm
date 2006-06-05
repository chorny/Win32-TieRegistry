# Tie/Registry.pm -- Provides backward compatibility for Win32::TieRegistry
# that was called Tie::Registry prior to version 0.20.
# by Tye McQueen, tye@metronet.com, see http://www.metronet.com/~tye/.

package Tie::Registry;

use strict;
use vars qw( $VERSION @ISA );

$VERSION= '0.15';	# to be Released Sat May 02 1998

use Carp;
require Win32::TieRegistry;
@ISA= qw(Win32::TieRegistry);

sub import
{
  my $pkg= shift(@_);
    Win32::TieRegistry->import( ExportLevel=>1, SplitMultis=>0, @_ );
}
