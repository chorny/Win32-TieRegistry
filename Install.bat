@rem = '--*-Perl-*--
@echo off
if "%OS%" == "Windows_NT" goto WinNT
perl -x -S "%0" %1 %2 %3 %4 %5 %6 %7 %8 %9
goto endofperl
:WinNT
perl -x -S "%0" %*
if NOT "%COMSPEC%" == "%SystemRoot%\system32\cmd.exe" goto endofperl
if %errorlevel% == 9009 echo You do not have Perl in your PATH.
goto endofperl
@rem ';
#!/usr/bin/perl
#line 14
    eval 'exec perl -x -S "$0" ${1+"$@"}'
	if 0;	# In case running under some shell

use strict;
use Config;
use File::Copy qw( copy );
use File::Path qw( mkpath rmtree );
use ExtUtils::Install qw( install_default );;

exit main();

sub main
{
  my $dir= "Win32";
  my $name= "TieRegistry";
  my $pkg= "${dir}::$name";
    $pkg =~ s./.::.g;
  my $blib= "blib/lib/$dir";
    mkpath( $blib, 1 )
      or  die "Can't make path, $blib: $!\n";
    copy( "$name.pm", "$blib/$name.pm" )
      or  die "Can't copy $name.pm to $blib/$name.pm: $!\n";
    install_default( "$dir/$name" )
      or die "Can't install package $dir/$name: $!\n";
    # install_default() should append to perl/lib/perllocal.pod but doesn't
    # as of Perl5.004_04 so use "make install" if this is important to you.
    unlink( "$blib/$name.pm" )
      or  warn "Can't delete $blib/$name.pm: $!\n";
    rmtree( "blib" )
      or  warn "Can't remove tree blib: $!\n";
    0;
}

__END__
:endofperl
