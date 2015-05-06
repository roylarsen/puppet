class nginx{
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
    service{"nginx":
        ensure => "running",
    }
}
