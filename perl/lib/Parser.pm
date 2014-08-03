package Parser;
use strict;
use warnings;

use Log;

sub new {
    my ($class, %args) = @_;
    return bless \%args, $class;
}

sub parse {
    my $self = shift;
    my @rtn;
    open my $fh, '<', $self->{filename} or die $!;
    while (defined($_ = <$fh>)) {
        my @arr = split /\t/, $_;
        @arr = grep !/:-$/, @arr;
        my %hash = map {/([0-9A-Za-z_.-]+):(.*)/; $1 => $2} @arr;
        push @rtn, Log->new(%hash);
    }
    \@rtn
}

1;
