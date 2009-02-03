use strict;
use warnings;
use Test::More tests => 7;

use Angerwhale::Person;
use Angerwhale::Site;
use Angerwhale::Location::Host;
use Angerwhale::Identity::Passphrase;

my $person = Angerwhale::Person->new(
    name      => 'Jonathan Rockway',
    shortname => 'jrockway',
);
ok $person;

my $location = Angerwhale::Location::Host->new(
    host => 'test',
);
ok $location;

my $site = Angerwhale::Site->new(
    name     => 'test blog',
    owner    => $person,
    location => $location,
);
ok $site;

is_deeply [$person->sites->members], [$site], 'owner <-> site trigger OK';

my $id = Angerwhale::Identity::Passphrase->new(
    passphrase => 'OH HAI',
);

ok $id;
ok $id->match('OH HAI');

$person->add_identity($id);
ok $person->identities->members;
