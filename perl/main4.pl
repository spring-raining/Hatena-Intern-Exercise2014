use strict;
use warnings;

use Data::Dumper;

use Parser;
use LogDiagram;

my $parser = Parser->new( filename => '../sample_data/log.ltsv' );
my $diagram = LogDiagram->new($parser->parse);
$diagram->show;
