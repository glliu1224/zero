package com.arc.blog.zero.controller.test.deepcopy2;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;

/**
 * @author 叶超
 * @since 2019/3/14 11:22
 */
@Setter
@Getter
@ToString
class Person implements Serializable {
    /**
     *
     */
    private static final long serialVersionUID = 1L;

    private String name;

    private int age;

    Person(String name, int age) {
        this.name = name;
        this.age = age;
    }


}
