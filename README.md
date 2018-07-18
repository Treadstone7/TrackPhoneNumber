# TrackPhoneNumber
Es una herramienta para OSINT en numeros telefonicos, el cual funciona a nivel global, cuenta con enlaces/link para mayor descubrimiento de un usuario/victima.
 
# Algunos requerimientos para PERL Son los siguientes.

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

### Geolocaliza el numero

sub  PhoneNumberInformation {

  $url = "https://pastebin.com/raw/eimxvUhK"; ←←←←←←←←←  En este apartado se cargo una api de la pagina http://apilayer.net en https://numverify.com   
  
      $request = $ua->get($url);
      $api2 = $request->content;
               $url = "http://apilayer.net/api/validate?access_key=$api2&number=$PhoneNumber&country_code=&format=";
               $request = $ua->get($url);
               $response = $request->content;
               if($response =~/"valid":true/)
               {
Nota puedes utilizar la herramienta con la API cargada en pastebin o solo colocandola
$url = "http://apilayer.net/api/validate?access_key= CODIGO.........

Si la herramienta ya no Genera la busqueda en la SHELL, CONSOLA o TERMINAL tienes que cargar otra API de la pagina https://numverify.com ...


               
               
        
