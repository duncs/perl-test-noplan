use Test::NoPlan;

all_plans_ok(
    {   recurse      => 0,
        check_files  => qr/^.*\.t$/xsm,
        ignore_files => qr/^new_method.t$/xsm,
        topdir       => '.',
    }
);
