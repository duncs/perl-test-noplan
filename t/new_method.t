use FindBin qw($Bin);
use lib $Bin. '/../lib';
use File::Spec;
use Test::Builder::Tester tests => 3;
use Test::More;
use IO::Scalar;

use Test::NoPlan;

test_out(
    q{not ok 1 - 't/subdir/no_plan_0.t' has 'no_plan' set
not ok 2 - 't/subdir/no_plan_1.t' has 'no_plan' set
ok 3 - 't/subdir/plan_0.t' has 'no_plan' set}
);

test_err(
    qq{#   Failed test ''t/subdir/no_plan_0.t' has 'no_plan' set'
#   at t/new_method.t line 23.
#   Failed test ''t/subdir/no_plan_1.t' has 'no_plan' set'
#   at t/new_method.t line 23.}
);

all_plans_ok(
    {   recurse     => 'yes',
        method      => 'new',
        check_files => qr/^.*\.t$/xsm,
        topdir      => File::Spec->catdir( $Bin, 'subdir' ),
    }
);

test_test('Output as expected');

# these dummy tests are here to prove the test count is correct
# and can be updated as required
ok( 1 == 1, 'extra test to prove new method works' );
ok( 1 == 1, 'extra test to prove new method works' );
