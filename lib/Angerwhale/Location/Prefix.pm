use MooseX::Declare;

class Angerwhale::Location::Prefix with Angerwhale::Location {
    use Angerwhale::Dispatcher::Path;
    use URI;

    has 'prefix' => (
        is       => 'ro',
        isa      => 'Str',
        required => 1,
    );

    method match(URI $uri){
        my ($nothing, $prefix, @rest) = $uri->path_segments;
        if( $prefix eq $self->prefix ){
            return Angerwhale::Dispatcher::Path->new(
                path_parts => \@rest,
            );
        }
        return;
    }

};

1;
