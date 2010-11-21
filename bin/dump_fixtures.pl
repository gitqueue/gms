#!/usr/bin/perl

use strict;
use warnings;

use FindBin;
use lib "$FindBin::Bin/../lib";

use GMS::Schema;
use GMS::Config;

use DBIx::Class::Fixtures;

my $db = GMS::Schema->connect($GMS::Config::dbstring,
    $GMS::Config::dbuser, $GMS::Config::dbpass);

my $config_dir = "$FindBin::Bin/../t/etc";

my $fixtures = DBIx::Class::Fixtures->new({
    config_dir => $config_dir
});

$fixtures->dump({
    config => 'basic_db.json',
    schema => $db,
    directory => "$config_dir/basic_db"
});

