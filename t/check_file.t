use FindBin qw($Bin $Script);
use lib $Bin. '/../lib';
use File::Spec;
use Test::More tests => 8;
use IO::Scalar;

use Test::NoPlan qw/ check_file_for_no_plan /;

my $result;

eval { $result = check_file_for_no_plan( $Bin . '/' . $Script ); };
is( $@,      '', 'no error reported' );
is( $result, 1,  $Bin . '/' . $Script . ' is ok' );

eval { $result = check_file_for_no_plan('t/subdir/plan_0.t'); };
is( $@,      '', 'no error reported' );
is( $result, 1,  'plan_0.t is ok' );

eval { $result = check_file_for_no_plan('t/subdir/no_plan_0.t'); };
is( $@,      '', 'no error reported' );
is( $result, 0,  'no_plan_0.t error picked up' );

eval { $result = check_file_for_no_plan('t/subdir/no_plan_1.t'); };
is( $@,      '', 'no error reported' );
is( $result, 0,  'no_plan_1.t error picked up' );
