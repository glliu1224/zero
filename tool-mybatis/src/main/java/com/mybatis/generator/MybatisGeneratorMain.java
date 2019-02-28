package com.mybatis.generator;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import com.mybatis.generator.config.SpringConfig;

/**
 * 生成mapper.xml  model 的主方法
 * 注意：
 * 1配置数据连接，以及生产何表的定义在resources包中
 * 2生成文件在target包中的output中，
 */
public class MybatisGeneratorMain {

    @SuppressWarnings("resource")
    public static void main(String[] args) throws Exception {
        ApplicationContext ac = new AnnotationConfigApplicationContext(SpringConfig.class);
        ac.getBean(BootStrap.class).start();
    }

}
