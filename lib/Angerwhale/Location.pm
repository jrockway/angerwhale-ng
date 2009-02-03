use MooseX::Declare;

# "You're entering the vicinity of an area adjacent to a Location."

role Angerwhale::Location {
    use Angerwhale::Dispatcher::Path;
    use URI;

    requires 'match';
}

1;
