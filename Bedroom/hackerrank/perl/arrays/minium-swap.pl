#!/usr/bin/perl

use strict;
use warnings;

# Complete the minimumSwaps function below.
sub minimumSwaps {
	my @arr=@{$_[0]};
	my $size = scalar @arr;
	my $miniumswap=0;
	# create an indexing for the unsorted for quick lookup
	my @search_index=();
	while (my ($index, $value) = each @arr) {
		$search_index[$value]=$index;
	}

	for (my $i=0; $i < $size; $i++) {
	
		if ($arr[$i] ne $i+1) {
			$miniumswap++;
			my $tmp=$arr[$i];
			$arr[$i] = $i+1;
			#we use the temp search index to locate position
			$arr[$search_index[$i+1]] = $tmp;
			# make sure to adjust index location
			$search_index[$tmp] = $search_index[$i+1];

			# verification search index.
			#print "$i Case $miniumswap ========================\n";
			#for (my $ii=0; $ii < $size; $ii++) {
			#	print $arr[$ii]."\n";
			#}
		}
	}
	return $miniumswap;
}

my @arr=(2,3,4,1,5);
#(2,3,1,4,5)
#(1,3,2,4,5)
#(1,2,3,4,5)

my $res = minimumSwaps \@arr;

print "\n";
print "MinimumSwap=$res\n";

