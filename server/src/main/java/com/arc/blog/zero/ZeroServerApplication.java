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

//轻量级的、面向bean、松耦合、万能胶、设计模式
//动态代理
// AOP
//声明式编程

//控制反转（DI 依赖注入 Dependency Injection） 依赖查找DL dependency  lookup
//基本概念：不创建对象，但是描述创建他们的方式  IOC

//注入的方式
//setter
//构造
//强制赋值
//https://www.jianshu.com/p/9170a7a65dd4
