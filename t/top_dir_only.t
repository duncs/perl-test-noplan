use Test::NoPlan;

all_plans_ok(
    {   recurse     => 0,
        check_files => qr/^.*\.t$/xsm,
        topdir      => '.',
    }
);
