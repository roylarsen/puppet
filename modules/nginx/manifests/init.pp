#TODO: Support for OSes that don't use YUM

class nginx{
    #Sets up YUM repo since CentOS doesn't package it (yet)
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
    #Sets up service object so I can notify after config updates
    service{"nginx":
        ensure => "running",
    }
}
