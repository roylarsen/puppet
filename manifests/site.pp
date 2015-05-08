node 'nginx.xhousebreakx.org'{
    #creates basic nginx node (installs nginx)
    include nginx
    #sets up a basic static site
    nginx::static{'test':
        site => "test",
        port => "8080",
        root => "/test",
    }
    #sets up a proxy
    nginx::proxy{'test-proxy':
        site => "test-proxy",
        port => "80",
        proxy => "http://www.google.com",
    }
}
