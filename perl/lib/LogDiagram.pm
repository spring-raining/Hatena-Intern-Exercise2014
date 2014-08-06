package LogDiagram;
use strict;
use warnings;

use Data::Dumper;

sub new {
    my ($class, $logs) = @_;
    return bless { logs => $logs }, $class;
};

sub show {
    my $self = shift;
    my $data = {};
    my @chara = (' ','▁','▂','▃','▅','▆','▇','█',);

    foreach my $log (@{$self->{logs}}) {
        if (!exists $data->{$log->{path}}) {
            $data->{$log->{path}} = [];
            for (0..20) {
                push @{$data->{$log->{path}}}, 0;
            }
        }
        my $index = int($log->{reqtime_microsec} / 50000);
        $index = ($index > 20)? 20 : $index;
        @{$data->{$log->{path}}}[$index]++;
    }

    print "reqtime(ms) 0        500k       1M\n";
    while (my ($k, $v) = each %$data) {
        print $k . "\n           |";
        @$v = map { ($_ > $#chara)? $chara[$#chara] : $chara[$_] } @$v;
        print @$v;
        print "|\n";
    }
}

1;
