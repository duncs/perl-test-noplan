use strict;
use warnings;
use FindBin qw($RealBin);
use English qw(-no_match_vars);
use Test::More;

# perlcritic config set in this file
$ENV{PERLCRITIC} = $RealBin . '/perlcriticrc';

eval { require Test::Perl::Critic; import Test::Perl::Critic; };

if ($EVAL_ERROR) {
    plan( skip_all => 'Test::Perl::Critic required to criticise code' );
}

all_critic_ok();
