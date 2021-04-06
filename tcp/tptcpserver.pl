#! /usr/bin/perl -w
# server0.pl
#--------------------

use strict;
use Socket;

#If wrong input
if ($#ARGV != 0 ) {
    print "tptcpserver <port>\n";
    exit;
}

# capture the arguments into variables
my $proto =getprotobyname('tcp');
my $port=$ARGV[0];

# create a socket, make it reusable
socket(SERVER, PF_INET, SOCK_STREAM, $proto) or die "socket: $!\n";
setsockopt(SERVER, SOL_SOCKET, SO_REUSEADDR, 1) or die "setsock: $!\n";

# grab a port on this machine
my $paddr = sockaddr_in($port, INADDR_ANY); #INADDR_ANY could also be changed to localhost, but will not :)

# bind to a port, then listen
bind(SERVER, $paddr) or die "bind: $!\n";
listen(SERVER, SOMAXCONN) or die "listen: $!\n";
print "SERVER started on port $port.\n";

# accepting a connection
my $client_addr;


while ($client_addr = accept(CLIENT, SERVER))
{
    # find out who connected
    my ($client_port, $client_ip) = sockaddr_in($client_addr);
    my $client_ipnum = inet_ntoa($client_ip);
    my $client_host = gethostbyaddr($client_ip, AF_INET);
    
    #Time gives seconds from 1970 to now
    my $send_time = time() + 2208988800; #2208988800 is seconds from 1900 to 1970
    print "$send_time\n";

    my $bin = sprintf ("%b", $send_time);
    print "$bin\n";
    
    # print who has connected
    print "got a connection from: $client_host","[$client_ipnum]\n";

    # send them a message, close connection
    print CLIENT "$bin\n";
    close CLIENT;
 }