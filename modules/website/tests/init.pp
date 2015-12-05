class{'webserver':}

class {'website':
  sitename => 'roylarsen.xyz',
  listen => '80',
  location => '/blog',
  proxy => 'http://localhost:2368',
}
