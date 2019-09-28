#!/usr/bin/perl

use strict;
use warnings;

# Complete the alternatingCharacters function below.
sub alternatingCharacters {
	my $str=shift;

	# indentify the base sequence
	my $sequence="A";
	$sequence="B" if (substr($str,0,1) eq "A");
	my $delete=0;	
	for (my $i=1; $i < length($str); $i++){	
		my $charis=substr($str,$i,1);
		if ($charis ne $sequence) {
			$delete++;
		} else {
			$sequence= ($sequence eq "A") ? "B":"A";
		}
	}

	return $delete;
}


my @arr=("AAAA","BBBBB","ABABABAB","BABABA","AAABBB");
#@arr=("ABABABAB");

for (my $i=0; $i < scalar @arr; $i++) {
	my $s=$arr[$i];
	my $result = alternatingCharacters $s;

	print "$result\n";
}
