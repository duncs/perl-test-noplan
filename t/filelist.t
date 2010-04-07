use strict;
use warnings;

use Test::More tests => 3;
use Test::Deep;

use Test::NoPlan qw( get_file_list );

my @expected;
my @found;

@expected = (
    't/00-load.t',      't/boilerplate.t',
    't/check_file.t',   't/filelist.t',
    't/kwalitee.t',     't/method.t',
    't/perlcritic.t',   't/perltidy.t',
    't/pod-coverage.t', 't/pod.t',
    't/subdir.t',       't/top_dir_only.t',
    't/zz_defaults_test.t',
);
@found = get_file_list( { topdir => '.', } );
is_deeply( \@found, \@expected, 'found correct files' );

@expected = (
    't/00-load.t',          't/boilerplate.t',
    't/check_file.t',       't/filelist.t',
    't/kwalitee.t',         't/method.t',
    't/perlcritic.t',       't/perltidy.t',
    't/pod-coverage.t',     't/pod.t',
    't/subdir.t',           't/subdir/no_plan_0.t',
    't/subdir/no_plan_1.t', 't/subdir/plan_0.t',
    't/top_dir_only.t',     't/zz_defaults_test.t',
);
@found = get_file_list( { topdir => '.', recurse => 1, } );
is_deeply( \@found, \@expected, 'found correct files' );

@expected
    = ( 't/subdir/no_plan_0.t', 't/subdir/no_plan_1.t', 't/subdir/plan_0.t',
    );
@found = get_file_list( { topdir => 't/subdir' } );
is_deeply( \@found, \@expected, 'found correct files' );
