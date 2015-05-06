define nginx::proxy($proxy,$site,$port,$root="/"){
    file{"${site}":
        path => "/etc/nginx/conf.d/${site}.conf",
        owner => 'root',
        group => 'root',
        mode => '0644',
        content => template("nginx/static.erb"),
        notify => Service["nginx"]
    }
}
