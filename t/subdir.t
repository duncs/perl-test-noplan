use FindBin qw($Bin);
use lib $Bin. '/../lib';
use File::Spec;
use Test::More tests => 4;
use IO::Scalar;

use Test::NoPlan;

my $stdout = '';
my $stderr = '';
my $stdout_expected;
my $stderr_expected;

if ( $ENV{TEST_VERBOSE} ) {
    diag 'Testing results for normal regexp';
}
all_plans_ok(
    {   recurse     => 'yes',
        check_files => qr/^.*\.t$/xsm,
        topdir      => File::Spec->catdir( $Bin, 'subdir' ),
        _stderr     => IO::Scalar->new( \$stderr ),
        _stdout     => IO::Scalar->new( \$stdout ),
    }
);

$stdout_expected = q{1..3
not ok 1 - 't/subdir/no_plan_0.t' does not have 'no_plan' set
not ok 2 - 't/subdir/no_plan_1.t' does not have 'no_plan' set
ok 3 - 't/subdir/plan_0.t' does not have 'no_plan' set
};
$stderr_expected = qr{^
#   Failed test ''t/subdir/no_plan_0.t' does not have 'no_plan' set'
#   at t/subdir.t line \d+.

#   Failed test ''t/subdir/no_plan_1.t' does not have 'no_plan' set'
#   at t/subdir.t line \d+.
$}xsm;

is( $stdout, $stdout_expected, 'got correct stdout error' );

like( $stderr, $stderr_expected, 'got correct stderr error' );

if ( $ENV{TEST_VERBOSE} ) {
    diag 'Testing results for different regexp';
}
$stdout = '';
$stderr = '';
all_plans_ok(
    {   recurse     => 'yes',
        check_files => qr/^.*\.s$/xsm,
        topdir      => File::Spec->catdir( $FindBin::Bin, 'subdir' ),
        _stderr     => IO::Scalar->new( \$stderr ),
        _stdout     => IO::Scalar->new( \$stdout ),
    }
);

$stdout_expected = q{1..3
not ok 1 - 't/subdir/no_plan_0.s' does not have 'no_plan' set
not ok 2 - 't/subdir/no_plan_1.s' does not have 'no_plan' set
ok 3 - 't/subdir/plan_0.s' does not have 'no_plan' set
};
$stderr_expected = qr{^
#   Failed test ''t/subdir/no_plan_0.s' does not have 'no_plan' set'
#   at t/subdir.t line \d+.

#   Failed test ''t/subdir/no_plan_1.s' does not have 'no_plan' set'
#   at t/subdir.t line \d+.
$}xsm;

is( $stdout, $stdout_expected, 'got correct stdout error' );

like( $stderr, $stderr_expected, 'got correct stderr error' );
