package com.arc.blog.zero.controller.data.test.node;

import com.arc.model.vo.ResponseVo;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @author 叶超
 * @since 2019/4/18 11:42
 */
@RequestMapping("/rest")
@RestController
public class TestController {

    @GetMapping("/upload")
    public String u1() {
        return "str";
    }

    @GetMapping("/upload2")
    public Integer u2() {
        return 222;
    }

    @GetMapping("/upload3")
    public Object u3() {
        return "str";
    }

    @GetMapping("/upload4")
    public ResponseVo u4() {
        return ResponseVo.success(123);
    }

}
//ClassLoader提供了两个方法用于从装载的类路径中取得资源：
//
//        public URL getResource(String name);
//        public InputStream getResourceAsStream(String name);
//
//       这里name是资源的类路径，它是相对与“/”根路径下的位置。getResource得到的是一个URL对象来定位资源，而getResourceAsStream取得该资源输入流的引用保证程序可以从正确的位置抽取数据。
//       但 是真正使用的不是ClassLoader的这两个方法，而是Class的 getResource和getResourceAsStream方法，因为 Class对象可以从你的类得到（如YourClass.class或 YourClass.getClass()），而ClassLoader则需要再 调用一次YourClass.getClassLoader()方法，不过根据JDK文档的说法，Class对象的这两个方法其实是“委托” （delegate）给装载它的ClassLoader来做的，所以只需要使用 Class对象的这两个方法就可以了。
//
//       因此，直接调用 this.getClass().getResourceAsStream(String name);获取流，静态化方法中则使用ClassLoader.getSystemResourceAsStream(String name); 。
//
//      下面是一些得到classpath和当前类的绝对路径的一些方法。你可能需要使用其中的一些方法来得到你需要的资源的绝对路径。
//
//1.this.getClass().getResource（""）
//得到的是当前类class文件的URI目录。不包括自己！
//如：file：/D：/workspace/jbpmtest3/bin/com/test/
//
//2.this.getClass().getResource（"/"）
//得到的是当前的classpath的绝对URI路径。
//如：file：/D：/workspace/jbpmtest3/bin/
//
//3.this.getClass().getClassLoader().getResource（""）
//得到的也是当前ClassPath的绝对URI路径。
//如：file：/D：/workspace/jbpmtest3/bin/
//
//4.ClassLoader.getSystemResource（""）
//得到的也是当前ClassPath的绝对URI路径。
//如：file：/D：/workspace/jbpmtest3/bin/
//
//5.Thread.currentThread().getContextClassLoader().getResource（""）
//得到的也是当前ClassPath的绝对URI路径。
//如：file：/D：/workspace/jbpmtest3/bin/

// /**
//
//    * 使用文件通道的方式复制文件
//
//    * 
//
//    * @param s
//
//    *            源文件
//
//    * @param t
//
//    *            复制到的新文件
//
//    */
//
//    public void fileChannelCopy(File s, File t) {
//
//        FileInputStream fi = null;
//
//        FileOutputStream fo = null;
//
//        FileChannel in = null;
//
//        FileChannel out = null;
//
//        try {
//
//            fi = new FileInputStream(s);
//
//            fo = new FileOutputStream(t);
//
//            in = fi.getChannel();//得到对应的文件通道
//
//            out = fo.getChannel();//得到对应的文件通道
//
//            in.transferTo(0, in.size(), out);//连接两个通道，并且从in通道读取，然后写入out通道
//
//        } catch (IOException e) {
//
//            e.printStackTrace();
//
//        } finally {
//
//            try {
//
//                fi.close();
//
//                in.close();
//
//                fo.close();
//
//                out.close();
//
//            } catch (IOException e) {
//
//                e.printStackTrace();
//
//            }
//
//        }
//
//    }
//---------------------
//作者：丿灬安之若死
//来源：CSDN
//原文：https://blog.csdn.net/mp624183768/article/details/79516191
//版权声明：本文为博主原创文章，转载请附上博文链接！
