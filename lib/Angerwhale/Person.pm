use MooseX::Declare;

class Angerwhale::Person {
    use KiokuDB::Util qw(set weak_set);
    use Angerwhale::TypeLibrary;

    has [qw/name shortname/] => (
        is       => 'ro',
        isa      => 'Str',
        required => 1,
    );

    has 'identities' => (
        is       => 'ro',
        does     => 'KiokuDB::Set',
        default  => sub { set() },
        required => 1,
    );

    # TODO: make these lazy (needs Devel::Declare hacking to get the
    # KDB instance metaclass)
    has [qw/sites articles comments/] => (
        is       => 'ro',
        does     => 'KiokuDB::Set',
        default  => sub { weak_set() },
        required => 1,
    );

    method add_identity(Identity $id){
        $self->identities->insert($id);
    }

    method add_site(Site $site) {
        $self->sites->insert($site);
    }

};

1;
