#Set up static content site
define nginx::static($site,$port,$root="/"){
    file{"${site}":
        require => Package["nginx"],
        path => "/etc/nginx/conf.d/${site}.conf",
        owner => 'root',
        group => 'root',
        mode => '0644',
        content => template("nginx/static.erb"),
        notify => Service["nginx"]
    }
    file{"/var/www/${site}/":
        ensure => directory,
        owner => 'nginx',
        group => 'nginx',
        mode => '0755'
    }
    file{"/var/www/${site}/index.html":
        ensure => present,
        require => File["${site}"],
        path => "/var/www/${site}/index.html",
        source => "/etc/puppet/modules/nginx/files/index.html",
        owner => "nginx",
        group => "nginx",
        mode => "0755"
    }
}
