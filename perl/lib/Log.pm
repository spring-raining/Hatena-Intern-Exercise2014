package Log;
use strict;
use warnings;
use Time::Piece;

sub new {
    my ($class, %args) = @_;
    return bless \%args, $class;
}

sub protocol {
    my $self = shift;
    @_ = split / /, $self->{req};
    $_[2]
}

sub method {
    my $self = shift;
    @_ = split / /, $self->{req};
    $_[0]
}

sub path {
    my $self = shift;
    @_ = split / /, $self->{req};
    $_[1]
}

sub uri {
    my $self = shift;
    "http://" . $self->{host} . $self->path
}

sub time {
    my $self = shift;
    $_ = gmtime $self->{epoch};
    $_->datetime
}

sub to_hash {
    my $self = shift;
    %$self = map {
        if ($_ eq "epoch") {
            time => $self->time
        } elsif ($_ eq "req") {
            method => $self->method
        } elsif ($_ eq "host") {
            uri => $self->uri
        } else {
            $_ => $self->{$_}
        }
    } keys %$self;
    return $self
}

1;
