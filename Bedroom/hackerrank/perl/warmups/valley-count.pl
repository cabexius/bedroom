#!/usr/bin/perl

use strict;
use warnings;

# Complete the countingValleys function below.
sub countingValleys {
	my ($step,$path)=@_;
	my $valley=0;
	my $sum=0;
  	
	for my $c (split //, $path) {
		if ("$c" eq "U") {
			$valley++ if (++$sum==0);
		} else { $sum-- };
	}
	return $valley;
}


my $n=12;
my $s="DDUUDDUDUUUD";


my $result = countingValleys $n, $s;

print "Valley=$result\n";

