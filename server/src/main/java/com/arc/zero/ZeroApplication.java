package com.arc.zero;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * 主启动类
 */
@RestController
@EnableTransactionManagement
@MapperScan("com.arc.zero.mapper")
@SpringBootApplication
public class ZeroApplication {

    public static void main(String[] args) {
        SpringApplication.run(ZeroApplication.class, args);
    }

    @RequestMapping("/info")
    public String hello() {
        return "HELLO";
    }
}

