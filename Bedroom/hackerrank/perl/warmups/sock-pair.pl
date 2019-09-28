#!/usr/bin/perl

use strict;
use warnings;


# Complete the sockMerchant function below.
sub sockMerchant {
	my ($index,$array)=@_;
	#find pairs;
	my $pairs=0;
	while (@$array) {
		my $n=shift @$array;
		next if (!$n);
		my @dups=@$array;

		# recode for faster performance.
		for (my $i=0; $i < scalar(@dups); $i++) {
			my $item=$dups[$i];
			next if (!$item);
			if ($item==$n) {
				$pairs++;
				delete @$array[$i];
				last;
			}
		}	
	}
	return $pairs;
}

# data-test
my @ar = (10,20,20,10,10,30,50,10,20);  # 3 pairs
# @ar = (10,20,20,10,10,30,50,10,20,50);     # 4 pairs

my $result = sockMerchant (9,\@ar);

print "$result\n";