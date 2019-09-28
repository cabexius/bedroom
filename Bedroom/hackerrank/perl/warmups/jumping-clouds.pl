#!/usr/bin/perl

use strict;
use warnings;

# Complete the jumpingOnClouds function below.
sub jumpingOnClouds {
	my @clouds=@{$_[0]};
	my $size=scalar(@clouds);
	my $moves_taken=0;
	
	#identify the index to be skipped
	my %thundercloud=();
	for (my $i=0; $i < $size; $i++) {
		$thundercloud{$i}=1 if ($clouds[$i]);
	}
	
	#loop through the cloud
	my $game_running=1;
	my $mycloud=0;
	my $currentCloud;
	while ($game_running) {
	  if ($mycloud >= $size-1) {
	  		#if ($mycloud==$size-1) {print "Win Game\n";}
	  		#else {print "Lost Game\n"};
	  		$game_running=0;
	  } elsif((not $thundercloud{$mycloud+2}) || (not $thundercloud{$mycloud+1})){
	  		$currentCloud=$mycloud;
	  		#-69 is just a dummy and will never be set.
	  		my $condition =(not $thundercloud{$mycloud+2}) ? 2:(not $thundercloud{$mycloud+1})?1:-69;
	  		$mycloud=$mycloud+$condition;
	  		$moves_taken++;
	  		#print "CurrentCloud=$currentCloud myNextCloud=$mycloud LastCloud=$size Plus=2\n";	  		
	  } else {
			#no jumps possible
	  		$mycloud=$size+1;
	  }
	  
	  
	}
	# always returns the max possible jump that one can take
	return $moves_taken;
}


# change cloud-game array here..
#      0,1,2,3,4,5,6
my @c=(0,0,1,0,1,0,0);

my $result = jumpingOnClouds \@c;

print "MaxCloudJump=$result\n";
