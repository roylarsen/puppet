#Define a website
#Options:
# $name = W
# $webroot = location of websites
# $listen = port to listen on
class website (
  $sitename = $website::params::sitename,
  $webroot  = $website::params::webroot,
  $listen   = $website::params::listen,
  $location = $website::params::location,
  $proxy    = $website::params::proxy
) inherits website::params{
    nginx::resource::vhost{$sitename:
      www_root    => "${webroot}/${sitename}",
      listen_port => $listen,
      notify      => Service['nginx'],
    }
    nginx::resource::location{$location:
      proxy => $proxy,
      vhost => $sitename,
   }
}
