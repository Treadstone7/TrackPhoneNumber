# Esta basado en Th3inspecto 

# TrackPhoneNumber
Es una herramienta para OSINT en numeros telefonicos, el cual funciona a nivel global, cuenta con enlaces/link para mayor descubrimiento de un usuario/victima.
 
# Algunos requerimientos para PERL Son los siguientes.

#!/usr/bin/perl

if $^O eq "MSWin32", Win32::Console::ANSI          
Getopt::Long                                    
HTTP::Request                                    
LWP::UserAgent                                  
IO::Select                                    
HTTP::Headers                                 
IO::Socket                                     
HTTP::Response                                
Term::ANSIColor                                  
HTTP::Request::Common qw(POST)                     
HTTP::Request::Common qw(GET)                      
URI::URL                                   
IO::Socket::INET                                
Data::Dumper                                   
LWP::Simple                                      
JSON qw( decode_json encode_json )                    

### Geolocaliza el numero

sub  PhoneNumberInformation {

  $url = "https://pastebin.com/raw/eimxvUhK"; ←←←←←←←←←  En este apartado se cargo una API de la pagina http://apilayer.net en https://numverify.com   
  
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

git clone   https://github.com/Leviatan3301/TrackPhoneNumber  
cd TrackPhoneNumber                   
perl Track_Phone_Number.pl 
               
               
        
