This is a TCP and a UDP implementation of RFC 868. To run the code simply extract the files in the repositoy -> navigate to location of the root folder via the terminal.

    $ cd ../Client_Server_Perl
    
To run the TCP implementation we first start the tcp-server:

    $ cd tcp
    $ perl tptcpserver.pl <port>
    
Example:

    $ perl tptcpserver.pl 8000
    
Open a new terminal and navigate to the same folder, and start the client which connects to the server at the ip and port:

    $ cd ../Client_Server_Perl/tcp
    $ perl tptcpclient.pl <ip> <port>
    
Example:
    
    $ perl tptcpclient.pl 127.0.0.1 8000
    
    
    
    
    
    
    
The same procedure goes for the UDP implementation. Navigate back to the root folder:

    $ cd ../Client_Server_Perl
    
Start the server:
    
    $ cd udp
    $ perl tpudpserver.pl <port>
    
Example:

    $ perl tpudpserver.pl 8000
    
Start client in another terminal:

    $ cd ../Client_Server_Perl/udp
    $ perl tpudpclient.pl <ip> <port>
    
Example:
    
    $ perl tpudpclient.pl 127.0.0.1 8000
