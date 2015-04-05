#!perl -T

use Test::More;
eval "use Test::Pod 1.14";
plan skip_all => "Test::Pod 1.14 required for testing POD" if $@;
diag "Test::Pod version $Test::Pod::VERSION, Pod::Simple version $Pod::Simple::VERSION";
all_pod_files_ok();
