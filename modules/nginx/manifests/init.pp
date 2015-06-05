class nginx{
    #Sets up YUM repo since CentOS doesn't package it (yet)
    case $operatingsystem{
        'CentOS': {
            yumrepo{"nginx":
                baseurl => 'http://nginx.org/packages/centos/$releasever/$basearch/',
                descr => "nginx repo",
                gpgcheck => 0,
                enabled => 1,
                before => Package["nginx"],
            }
            package{"nginx":
                ensure => "installed",
                require => Yumrepo["nginx"],
            }
        }
        #Requires EPEL package repo
        'Fedora':{
            package{"nginx":
                ensure => "installed",
            }
        }
        'Debian':{
           package{"nginx":
               ensure => "installed",
           }
        }
    }
    group{"nginx group":
        ensure => "present",
        name => "nginx",
        before => User["nginx user"],
    }
    user{"nginx user":
        ensure => "present",
        name => "nginx",
        groups => "nginx",
    }
    file{"/etc/nginx/nginx.conf":
        ensure => "present",
        owner => "root",
        group => "root",
        source => "/etc/puppet/modules/nginx/files/nginx.conf",
        require => Package["nginx"],
    }
    file{"/var/www/":
       ensure => "directory",
       owner => "root",
       group => "root",
       mode => "755",
    }
    #Sets up service object so I can notify after config updates
    service{"nginx":
        ensure => "running",
    }
}
