#! /usr/bin/perl -w

# modeller puts the nuclrotide name in the  th solumn
# pymol expects it in 

@ARGV ||
    die "Usage:  $0  <file name> \n";

$filename = $ARGV[0];
open (IF, "<$filename" ) 
    || die "Cno $filename: $!.\n";

while ( <IF> ) {
    if ( ! /^ATOM/ && ! /^HETATM/ ) {
	print;
	next;
    }
    $newline = $_;
    $name = substr $_,  12, 4;

    if ( $name =~ /\'/ ) {
	$name =~ s/\'/\*/g;
	(substr $newline,  12, 4) = $name;
    }

    $res_name = substr $_,  17, 3; $res_name=~ s/\s//g;
    if ( length $res_name == 3){
	print  $newline;
	next;

    } elsif ( length $res_name == 2){
	die "Do not know  how to handle res name $res_name.\n";

    }
   
    (substr $newline, 17, 3) = "$res_name  ";
    
    print  $newline;
}

close IF;
