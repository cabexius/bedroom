#!/usr/bin/perl

use strict;
use warnings;

# Complete the makeAnagram function below.
sub makeAnagram {
	my ($a,$b)=@_;
	my @alphabet=();
	#$#alphabet=25;
	my $count=0;

	my $alpha=ord("a");
	foreach my $char (split//,$a) {$alphabet[(ord($char)-$alpha)]++}
	foreach my $char (split//,$b) {$alphabet[(ord($char)-$alpha)]--}
	foreach my $intr (@alphabet) {$count+= abs($intr);}		
	return $count;
}

my $a="fcrxzwscanmligyxyvym";
my $b="jxwtrhvujlmrpdoqbisbwhmgpmeoke";

my $res = makeAnagram $a, $b;

print "$res\n";
