use strict;
use warnings;
use Test::More tests => 6;

use Angerwhale::Location;
use Angerwhale::Location::Host;
use Angerwhale::Location::Prefix;
use URI;

my $host = Angerwhale::Location::Host->new( host => 'jrock.us' );
my $prefix = Angerwhale::Location::Prefix->new( prefix => 'blag' );

my $matching_uri = URI->new('http://jrock.us/blag/articles/It+Works!');

ok $host->match($matching_uri);
ok $prefix->match($matching_uri);

is $host->match($matching_uri)->to_string, 'blag/articles/It+Works!';
is $prefix->match($matching_uri)->to_string, 'articles/It+Works!';

my $non_matching_uri = URI->new('http://blog.jrock.us/foo/bar/baz');

ok !$host->match($non_matching_uri);
ok !$prefix->match($non_matching_uri);
