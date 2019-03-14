package com.arc.blog.zero.controller.test.deepcopy2;

import java.io.IOException;

/**
 * @author 叶超
 * @since 2019/3/14 11:23
 */
public class DeepCopy2 {

    /**
     * @param args
     */
    public static void main(String[] args) throws IOException, ClassNotFoundException {
        long t1 = System.currentTimeMillis();
        Student sourceStu = new Student("学生", 18, new Person("一个对象", 20));
        Student copyStu = (Student) sourceStu.deepClone();

        copyStu.getPerson().setName("操作副本的引用");

        copyStu.setAge(33);
        System.out.println(sourceStu);
        System.out.println(copyStu);
        System.out.println("对于副本中的数据做修改，源数据不受影响");
        System.out.println("----------------------");
        System.out.println("系统耗时单位ms" + (System.currentTimeMillis() - t1));
    }

}
//要想序列化对象，必须先创建一个OutputStream，然后把它嵌入ObjectOutputStream。这时就能用writeObject()方法把对象写入OutputStream。读的时候需要把InputStream嵌到ObjectInputStream中，然后再调用readObject()方法。不过这样读出来的只是一个Object的reference，因此，在用之前，还要下转型。
//
//对象序列化不仅能保存对象的副本，而且会跟着对象中的reference把它所引用的对象也保存起来，然后再继续跟踪那些对象的reference，以此类推。这种情形常被称作”单个对象所联结的‘对象网’ “。
//
//但是串行化却很耗时，在一些框架中，我们便可以感受到，它们往往将对象进行串行化后进行传递，耗时较多。

//----------------
//Java中的深拷贝(深复制)和浅拷贝(浅复制)
//深拷贝(深复制)和浅拷贝(浅复制)是两个比较通用的概念，尤其在C++语言中，若不弄懂，则会在delete的时候出问题，但是我们在这幸好用的是Java。虽然java自动管理对象的回收，但对于深拷贝(深复制)和浅拷贝(浅复制)，我们还是要给予足够的重视，因为有时这两个概念往往会给我们带来不小的困惑。
//
//浅拷贝是指拷贝对象时仅仅拷贝对象本身（包括对象中的基本变量），而不拷贝对象包含的引用指向的对象。深拷贝不仅拷贝对象本身，而且拷贝对象包含的引用指向的所有对象。举例来说更加清楚：对象A1中包含对B1的引用，B1中包含对C1的引用。浅拷贝A1得到A2，A2 中依然包含对B1的引用，B1中依然包含对C1的引用。深拷贝则是对浅拷贝的递归，深拷贝A1得到A2，A2中包含对B2（B1的copy）的引用，B2 中包含对C2（C1的copy）的引用。
//
//若不对clone()方法进行改写，则调用此方法得到的对象即为浅拷贝，下面我们着重谈一下深拷贝。
//
//运行下面的程序，看一看浅拷贝：
