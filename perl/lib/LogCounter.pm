package LogCounter;
use strict;
use warnings;

sub new {
    my ($class, $logs) = @_;
    return bless { logs => $logs }, $class;
};

sub group_by_user {
    my $self = shift;
    my $rtn = {};
    foreach my $log (@{$self->{logs}}) {
        my $name = "guest";
        if (exists $log->{user}) {
            $name = $log->{user};
        }
        if (exists $rtn->{$name}) {
            push @{$rtn->{$name}}, $log;
        } else {
            $rtn->{$name} = [$log];
        }
    }
    return $rtn;
}

sub count_error {
    my $self = shift;
    my $count = 0;
    foreach my $log (@{$self->{logs}}) {
        if ($log->{status} =~ /^5\d{2}$/) {
            $count++;
        }
    }
    return $count;
}

1;
