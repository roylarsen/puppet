node 'nginx.xhousebreakx.org'{
    include nginx
    nginx::static{'test':
        site => "test",
        port => "8080",
        root => "/test",
    }
    nginx::proxy{'test-proxy':
        site => "test-proxy",
        port => "80",
        proxy => "http://localhost:8080/test/",
    }
}
