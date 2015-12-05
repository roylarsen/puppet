class website::params{
  # Website information
  $sitename    = 'nginxsite'
  $webroot     = '/var/www'
  $listen      = '80'
  $location    = "/blog"
  $proxy       = "http://localhost:2368"
  #WEbsite deployment information
  $provider = 'git'
  $revision = 'master'
  $source   = 'nothing'
}
