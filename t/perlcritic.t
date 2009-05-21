# perlcritic config set in this file
use FindBin qw($RealBin);
$ENV{PERLCRITIC} = $RealBin . '/perlcriticrc';

use Test::Perl::Critic;
all_critic_ok();
