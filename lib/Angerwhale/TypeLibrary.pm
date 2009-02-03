package Angerwhale::TypeLibrary;
use strict;
use warnings;

use Moose::Util::TypeConstraints;

subtype Location => as Object => where {
    $_->does('Angerwhale::Location');
};

subtype Identity => as Object => where {
    $_->does('Angerwhale::Identity');
};

subtype Person => as Object => where {
    $_->isa('Angerwhale::Person');
};

subtype Site => as Object => where {
    $_->isa('Angerwhale::Site');
};


1;
