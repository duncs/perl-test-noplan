use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name       => 'Test::NoPlan',
    license           => 'perl',
    dist_author       => 'Duncan Ferguson <duncan_j_ferguson@yahoo.co.uk>',
    dist_version_from => 'lib/Test/NoPlan.pm',
    build_requires    => {
        'version'             => 0,
        'Test::More'          => 0,
        'Test::Perl::Critic'  => '0',
        'Test::PerlTidy'      => '0',
        'Test::Pod'           => '0',
        'Test::Pod::Coverage' => '0',
        'Devel::Cover'        => '0.42',
        'Perl::Critic::Bangs' => '1.02',
    },
    add_to_cleanup     => ['Test-NoPlan-*'],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
