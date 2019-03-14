package com.arc.blog.zero.controller.test;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.*;

/**
 * @author 叶超
 * @since 2019/3/14 11:22
 */
@Setter
@Getter
@ToString
class Student implements Serializable {
    /**
     *
     */
    private static final long serialVersionUID = 1L;


    /**
     * 常量对象/
     */
    private String name;

    /**
     * 基本数据类型
     */
    private int age;

    /**
     * 非常量数据类型
     */
    private  Person person;// 学生1和学生2的引用值都是一样的。

    Student(String name, int age, Person person) {
        this.name = name;
        this.age = age;
        this.person = person;
    }

    public Object deepClone() throws IOException, ClassNotFoundException {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        ObjectOutputStream oo = new ObjectOutputStream(byteArrayOutputStream);
        // 将对象写到输出流中流里
        oo.writeObject(this);

        // 从包含数据的流里读出对象
        ByteArrayInputStream byteArrayInputStream = new ByteArrayInputStream(byteArrayOutputStream.toByteArray());
        ObjectInputStream oi = new ObjectInputStream(byteArrayInputStream);
        return (oi.readObject());
    }

}
