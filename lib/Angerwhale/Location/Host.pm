use MooseX::Declare;

class Angerwhale::Location::Host with Angerwhale::Location {
    has 'host' => (
        is       => 'ro',
        isa      => 'Str',
        required => 1,
    );

    method match(URI $uri){
        return unless $uri->host eq $self->host;

        my @path = $uri->path_segments;
        shift @path;

        return Angerwhale::Dispatcher::Path->new(
            path_parts => \@path,
        );
    }


};

1;
