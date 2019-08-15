#!/usr/bin/perl -w

use strict;
use warnings;

# modules used
use Getopt::Long;
use Net::Pcap::Easy;
 
my ($dev, $filter, $promiscuous);
# arguement command paramters for things we want done.
GetOptions (
            "dev=s"      	=> \$dev,
            "filter=s"   	=> \$filter,
            "promiscuous=s" => \$promiscuous || 0,
);

# all arguments to new are optoinal
# example of --filter "host 192.168.1.8 and (tcp or icmp)"
# example of --filter "tcp"
my $npe = Net::Pcap::Easy->new(
    dev              => $dev,
    filter           => $filter,
    packets_per_loop => 10,
    bytes_to_capture => 1024,
    promiscuous      => $promiscuous, # true or false
 
 	# outputs tcp  
    tcp_callback => sub {
        my ($npe, $ether, $ip, $tcp, $header ) = @_;
        my $xmit = localtime( $header->{tv_sec} );
 
        print "$xmit TCP: $ip->{src_ip}:$tcp->{src_port}"
         . " -> $ip->{dest_ip}:$tcp->{dest_port}\n";
    },
 
 	# outputs icmp
    icmp_callback => sub {
        my ($npe, $ether, $ip, $icmp, $header ) = @_;
        my $xmit = localtime( $header->{tv_sec} );
 
        print "$xmit ICMP: $ether->{src_mac}:$ip->{src_ip}"
         . " -> $ether->{dest_mac}:$ip->{dest_ip}\n";
    },
);
 
print "Initialize read of network packets...\n"; 
1 while $npe->loop;

1;