use FindBin qw($Bin);
use lib $Bin. '/../lib';
use File::Spec;
use Test::More tests => 2;
use IO::Scalar;

use Test::NoPlan qw/ all_plans_ok /;

my $stdout = '';
my $stderr = '';

all_plans_ok(
    {   recurse     => 'yes',
        check_files => qr/^.*\.t$/xsm,
        topdir      => File::Spec->catdir( $FindBin::Bin, 'subdir' ),
        _stderr     => IO::Scalar->new(\$stderr),
        _stdout     => IO::Scalar->new(\$stdout),
    }
);

like( $stdout, qr!'t/subdir/no_plan.t' has 'no_plan'!, 'got correct error' );
like( $stderr, qr!'t/subdir/no_plan.t' has 'no_plan'!, 'got correct error' );

#is( $stdout, '', 'stdout' );
#is( $stderr, '', 'stderr' );

#is( $trap->leaveby, 'return', 'leaveby ok' );
#is( $trap->exit,    undef,    'exit ok' );
#is( $trap->die,     undef,    'exit ok' );
#is( $trap->stdout,  undef,    'exit ok' );
#is( $trap->stderr,  undef,    'exit ok' );
