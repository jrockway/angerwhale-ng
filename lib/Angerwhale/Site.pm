use MooseX::Declare;

class Angerwhale::Site {
    use Angerwhale::Person;
    use Angerwhale::TypeLibrary;

    has 'name' => (
        is       => 'ro',
        isa      => 'Str',
        required => 1,
    );

    has 'owner' => (
        is       => 'ro',
        isa      => 'Person',
        required => 1,
        trigger  => sub {
            my ($self, $owner) = @_;
            $owner->add_site($self);
        }
    );

    has 'location' => (
        is       => 'ro',
        isa      => 'Location',
        required => 1,
    );
};

1;
