#!/usr/bin/perl

use strict;
use warnings;

# Complete the rotLeft function below.
sub rotLeft {
	my @array=@{$_[0]};
	my $direction=$_[1];
	my $shifting=0;
	my @leftarray=@array;
	foreach my $arr (@array) {
		if ($shifting < $direction) {
			shift(@leftarray);
			push @leftarray, $arr; 
		}
		$shifting++;
	}

	return @leftarray;
}

#5 4
my @a=(1,2,3,4,5);
my $d=4;

my @result = rotLeft \@a, $d;

print join " ", @result;
