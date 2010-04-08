use FindBin qw($Bin);
use lib $Bin. '/../lib';
use File::Spec;
use Test::More tests => 3;
use IO::Scalar;

use Test::NoPlan;

my $stdout = '';
my $stderr = '';

eval {
    all_plans_ok(
        {   method  => 'what nonsense',
            recurse => 'test',
            topdir  => File::Spec->catdir( $Bin, 'subdir' ),
            _stderr => IO::Scalar->new( \$stderr ),
            _stdout => IO::Scalar->new( \$stdout ),
        }
    );
};

is( $stdout, '', 'stdout empty' );
is( $stderr, '', 'stderr empty' );

$eval_err_expected
    = qr{Method must be one of "create" or "new", not "what nonsense" at};

like( $@, $eval_err_expected, 'got correct eval error text' );
