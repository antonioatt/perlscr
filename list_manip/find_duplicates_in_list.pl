#! /usr/bin/perl -w
use IO::Handle;         #autoflush
# FH -> autoflush(1);

while ( <> ) {
    next if ( !/\S/ );
    chomp;
    @aux = split;
    if ( defined $found{$aux[0]} ) {
	print "$_\n";
    } else {
	$found{$aux[0]} = 1;
    }
}
