#
# NOTE: this test expects a $HOME/.perltidyrc file containing:
#   -pbp -nst -nse
#

use strict;
use warnings;
use English qw(-no_match_vars);
use Test::More;

eval { require Test::PerlTidy; import Test::PerlTidy; };

if ($EVAL_ERROR) {
    plan( skip_all => 'Test::PerlTidy required to check code' );
}

run_tests();
