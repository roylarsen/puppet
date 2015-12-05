class website::deploy(
  $sitename = $website::params::sitename,
  $provider = $website::params::provider,
  $webroot = $website::params::webroot,
  $revision = $website::params::revision,
  $source = $website::params::source
)inherits website::params{
  vcsrepo{"${webroot}/${sitename}":
    ensure   => latest,
    provider => $provider,
    source   => $source,
    revision => $revision,
  }
}
