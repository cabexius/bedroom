#!/usr/bin/perl

use strict;
use warnings;

use POSIX;

# Complete the repeatedString function below.
sub repeatedString {
	my ($s,$n)=@_;
	return $n if ($s eq "a");
	my $sz=length($s);
	# search for a, first char might not be a.
	my $a_char="a";
	my $same_char = () = $s =~ /$a_char/g;
	
	# a bit of a math problem to avoid iteration
	my $dupsize=floor($n/$sz);
	my $repeatstring=$dupsize * $same_char;
	my $diff= $n - ($sz*$dupsize);
	if ($diff > 0) {
		my $difchar=substr $s,0,$diff;
		my $same_char = () = $difchar =~ /$a_char/g;
		$repeatstring=$repeatstring+$same_char;		
	}
	return $repeatstring;
}
#0123456789
#abadabadabadabad
my $s="aba";
my $n=10;

my $result = repeatedString $s, $n;

print "Result=$result\n";
