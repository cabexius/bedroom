#!/usr/bin/perl

use strict;
use warnings;

# Complete the maximumToys function below.
sub maximumToys {
	my @prices=@{$_[0]};
	my $k=$_[1];

	# primary filters remove all prices greater than k
	my @buget = grep { $_ <= $k } @prices;
	my @buget_sorted = sort { $a <=> $b } @buget;
       	
	my $toy_count=0;
	foreach my $toy_price (@buget_sorted){
		($toy_price>$k) ? next:($k < 0) ? last:undef;
		# less the price, and increment counter	
        $k -= $toy_price; 
		$toy_count++;
	}
	return $toy_count;
}


my $k=50;
my $prices = "1 12 5 111 200 1000 10";
$prices =~ s/\s+$//;
my @prices = split /\s+/, $prices;

my $result = maximumToys \@prices, $k;

print "$result\n";
