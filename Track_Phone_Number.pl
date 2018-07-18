#!/usr/bin/perl

use if $^O eq "MSWin32", Win32::Console::ANSI;
use Getopt::Long;
use HTTP::Request;
use LWP::UserAgent;
use IO::Select;
use HTTP::Headers;
use IO::Socket;
use HTTP::Response;
use Term::ANSIColor;
use HTTP::Request::Common qw(POST);
use HTTP::Request::Common qw(GET);
use URI::URL;
use IO::Socket::INET;
use Data::Dumper;
use LWP::Simple;
use JSON qw( decode_json encode_json );

my $ua = LWP::UserAgent->new;
$ua = LWP::UserAgent->new(keep_alive => 1);
$ua->agent("Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.31 (KHTML, like Gecko) Chrome/26.0.1410.63 Safari/537.31");

GetOptions(
"h|help" => \$help,
"n|number" => \$PhoneNumber,

);

if($help) {banner();help(); }
if($PhoneNumber) {banner(); PhoneNumberInformation(); }


unless ($help|$PhoneNumber) {banner();menu();}

sub help{ 
  print item('1'),"\nTrack Phone Number ";
print color('bold red'), "===> ";
}

sub banner {
if ($^O =~ /MSWin32/) {system("mode con: cols=149 lines=37");
system("cls"); 
}else { 
system("resize -s 78 87");
system("clear"); }

print "  +------------------------------------------------------------------------------------+  \n";
print "  | ❰  Mx Gray Hackers ❱                                                               |   \n";
print "  |           ⦗ Track Phone Number ⦘              . .IIIII             .II             |   \n";
print "  |                      IIsIIII. I  II  .    II..IIIIIIIIIIIIIIIIIIII                 |   \n";
print "  |                    .  .IIIIII  II             IIIIIIIsIIIII  I.           |        |   \n";
print "  |                       .IIIII.III I        IIIIIIIIIIIIIIIIIIIIIII         |        |   \n";
print "  |                  ∆   .IIII⊠I           II  .IIIII IIIIIIIIIIII. II        |        |   \n";
print "  |                 ∆∆    eIIIIIIS            IIII I  IIIsIIIIIII I         __|__      |   \n";
print "  |              /        I .II   e          IIIIIIIIIIIII  IIIIIIIII       | | |      |   \n";
print "  |            /              I.           .IIIIsIIII    I   II  I    --------⊗------- |   \n";
print "  |          /                 .IIII        IIIIIIIIIIII     .       I      |_|_|      |   \n";
print "  |        /                    IIIII.          IIIIII           . I.        ̣ |        |   \n";
print "  |    __∏∎__                   IIIsIII         IIIII             ..I  II .   |        |   \n";
print "  |    ∟____/                     IIIIII          IIII...             IIII    |        |   \n";
print "  |                               IIII           III. I            IIIsII              |   \n";
print "  |                               III             I                I  III              |   \n";
print "  |                               II                                   I   .           |   \n";
print "  |                                I             ⊏=∎⊺===⊐                              |   \n";
print "  |   MX Gray Hackers                                                                  |   \n";
print "  |           https://github.com/Leviatan3301/TrackPhoneNumber                         |   \n";
print "  |           https://mxgrayhackers.blogspot.com/                                      |   \n";
print "  |                                                                                    |   \n";
print "  +------------------------------------------------------------------------------------+   \033[0;33m\n";

print" ";


  print " +-----------------------------------------------+\n";
  print "  |            Track Phone Number    📡           |\n ";
  print " |  Valid : True                                 |\n";
  print "  |  Number : 14158586273                         |\n";
  print "  |  Local_format : 4158586273                    |\n";
  print "  |  International_format: +14158586273           |\n";
  print "  |  Country_prefix : +1                          |\n";
  print "  |  Country_code : US                            |\n";
  print "  |  Country_name : United States of America      |\n";
  print "  |  Location : Novato                            |\n";
  print "  |  Carrier : AT&T Mobility LLC                  |\n";
  print "  |  Line_type : Mobile               V=1.0       |\n";
  print "  +-----------------------------------------------+\n";

print" ";

}

sub menu {
print " \n";
print item('01'), "Track Phone Number\n";
print item('-'), "EXIT [ENTER] : ";
print color('reset');


chomp($number=<STDIN>);

if($number eq '01'){

  print item('📡'),"Track Phone Number + : ";
  chomp($PhoneNumber=<STDIN>);
  PhoneNumberInformation();
  enter();
}


}
### Geolocaliza el numero

sub  PhoneNumberInformation {

  $url = "https://pastebin.com/raw/eimxvUhK";
      $request = $ua->get($url);
      $api2 = $request->content;
               $url = "http://apilayer.net/api/validate?access_key=$api2&number=$PhoneNumber&country_code=&format=";
               $request = $ua->get($url);
               $response = $request->content;
               if($response =~/"valid":true/)
               {
               $valid=$1;
                print item(),"Valid :   ";
                print color("bold green"),"true\n";

                if($response =~/number":"(.*?)"/)
                {
                  $number=$1;
                  print item(),"Number : $number\n";
                }
                if($response =~/local_format":"(.*?)"/)
                {
                  $local_format=$1;
                  print item(),"Local Format : $local_format\n";
                }
                
                if($response =~/international_format":"(.*?)"/)
                {
                  $international_format=$1;
                  print item(),"International format : $international_format\n";
                }      
      
                if($response =~/country_prefix":"(.*?)"/)
                {
                  $country_prefix=$1;
                  print item(),"Country prefix : $country_prefix\n";
                }

                if($response =~/country_code":"(.*?)"/)
                {
                  $country_code=$1;
                  print item(),"Country code : $country_code\n";
                }

                if($response =~/country_name":"(.*?)"/)
                {
                  $country_name=$1;
                  print item(),"Country name : $country_name\n";
                }

                if ($response =~/location":"(.*?)"/)
                {
                  $location=$1;
                  print item(), "Location : $location\n\n";
                }

                if ($response =~/carrier":"(.*?)"/)
                {
                  $carrier=$1;
                  print item(), "Carrier : $carrier\n";
                }

                if ($response =~/line_type":"(.*?)"/)
                {
                  $line_type=$1;
                  print item(), "Line type  : $line_type\n\n";
                }

                print item(), "https://www.google.com/maps/search/$location\n";
                print item(), "---------------------------------------------------\n";
                print item(), "https://www.facebook.com/search/top/?q= [1] / [= Number]\n";
                print item(), "https://www.facebook.com/search/top/?q=$local_format\n";
                print item(), "https://stalkscan.com/ ← Doxing Cuentas Facebook.\n";
                print item(), "https://namechk.com/ ← Doxing con namechk.\n";
}else {
                print item(),"There Is A Problem\n\n";
                print item('1'),"Checking The Connection\n";
                print item('2'),"Enter Phone Number Without +/00\n";
                print item('3'),"Check If Phone Number Exists\n";

              }
            }


##### Enter #######
sub enter {
    print "\n";
    print item(),"Press ";
    print color('bold blue'),"[";
    print color("bold white"),"ENTER";
    print color('bold blue'),"] ";
    print color("bold white"),"Key To Continue\n";

    local( $| ) = ( 1 );

    my $resp = <STDIN>;
    banner();
    menu();
}

### Item format ###
sub item
{
    my $n = shift // '+';
    return color('bold blue')," ["
    , color('bold green'),"$n"
    , color('bold blue'),"] "
    , color("bold white")
    ;
}
__END__
