#! /usr/bin/perl -w
# client1.pl - a simple client
#----------------

use strict;
use Socket;

if ($#ARGV != 1 ) {
    print "tptcpclient <serverhost> <port>\n";
    exit;
}

my $proto =getprotobyname('tcp');
my $host=$ARGV[0];
my $port=$ARGV[1];

# get the port address
my $iaddr = inet_aton($host);
my $paddr = sockaddr_in($port, $iaddr);

# create the socket, connect to the port
socket(SOCKET, PF_INET, SOCK_STREAM, $proto) or die "socket: $!\n";
connect(SOCKET, $paddr) or die "connect: $!\n";

my $line;
while ($line = <SOCKET> )  
{
    print $line;
}
close SOCKET or die "close: $!";