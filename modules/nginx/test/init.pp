include nginx

nginx::static{'test':
    site => "test",
    port => "8080",
}
nginx::proxy{'test':
   proxy => "http://localhost:8080/test/",
   site => "test-proxy",
   port => "80"
}
