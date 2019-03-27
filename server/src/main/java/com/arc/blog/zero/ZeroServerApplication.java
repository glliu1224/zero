package com.arc.blog.zero;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@MapperScan("com.arc.blog.zero.mapper")
@SpringBootApplication
public class ZeroServerApplication {

    public static void main(String[] args) {
        SpringApplication.run(ZeroServerApplication.class, args);
    }

}

