#!/usr/bin/perl -w

use strict;
use warnings;

use Net::PcapUtils;
use NetPacket::Ethernet;
use NetPacket::IP;
use NetPacket::TCP;
use Data::HexDump;

Net::PcapUtils::loop(\&process_pkt, FILTER => 'ip host 127.0.0.1');
my $i=0;

sub process_pkt {
  my ($user_data,$hdr,$pkt)=@_;
  my $eth=NetPacket::Ethernet->decode($pkt);
  if($eth->{type} == 2048){
    my $ip=NetPacket::IP->decode($eth->{data});
    if($ip->{proto} == 6){
      my $tcp=NetPacket::TCP->decode($ip->{data});
      print "\n\n$i $ip->{src_ip}($tcp->{src_port}) -> $ip->{dest_ip}($tcp->{dest_port})\n";
      print HexDump $ip->{data};
      $i++;
    }
  }
}

1;