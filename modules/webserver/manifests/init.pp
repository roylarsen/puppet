#This class is defining the webserver roll
class webserver{
  class{'nginx':}
  file{'/var/www':
    ensure => 'directory',
  }
}
