use MooseX::Declare;

class Angerwhale::Dispatcher::Path {
    has 'path_parts' => (
        is         => 'ro',
        isa        => 'ArrayRef[Str]',
        required   => 1,
        auto_deref => 1,
    );

    method next() {
        my @parts = $self->path_parts;
        shift @parts;
        return $self->new( path_parts => \@parts );
    }

    method to_string() {
        join '/', $self->path_parts;
    }
};

1;
