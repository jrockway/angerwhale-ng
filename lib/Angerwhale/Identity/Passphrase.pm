use MooseX::Declare;

class Angerwhale::Identity::Passphrase with Angerwhale::Identity {
    use Authen::Passphrase;
    use Authen::Passphrase::BlowfishCrypt;

    use MooseX::Types -declare => ['Passphrase'];

    subtype Passphrase() => as 'Object' => where {
        $_->isa('Authen::Passphrase');
    };

    coerce Passphrase() => from 'Str' => via {
        Authen::Passphrase::BlowfishCrypt->new(
            salt_random => 1,
            cost        => 8,
            passphrase  => $_,
        );
    };

    has 'passphrase' => (
        is       => 'ro',
        isa      => Passphrase,
        coerce   => 1,
        required => 1,
        handles  => ['match'],
    );
};

1;
