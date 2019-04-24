package com.arc.blog.zero.controller.data.test;

import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.io.*;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 叶超
 * @since 2019/4/16 20:39
 */
@Slf4j
@RestController
@RequestMapping("/card")
public class CardTestController {



    @GetMapping("/ser")
    public Object ser() {
        List<Card> nodes = getList();
        try {
            URL resource1 = this.getClass().getClassLoader().getResource("");
            URL resource2 = this.getClass().getClassLoader().getResource("/");
            URL resource3 = Thread.currentThread().getContextClassLoader().getResource("");
            URL resource4 = Thread.currentThread().getContextClassLoader().getResource("/");
            String s = System.getenv().get("/");
            String classpath = System.getenv().get("classpath");
            String os = System.getenv().get("os");

            System.out.println(resource1);
            System.out.println(resource2);
            System.out.println(resource3);
            System.out.println(resource4);

            System.out.println(s);
            System.out.println(classpath);
            System.out.println(os);

            ObjectOutputStream oos = new ObjectOutputStream(new FileOutputStream("C:\\Users\\Z\\Desktop\\Za\\ser.txt"));
            oos.writeObject(nodes);
            oos.flush();
            oos.close();
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return true;

    }

    @GetMapping("/re")
    public Object re() {
        List<Card> nodes = null;
        try {
            FileInputStream inputStream = new FileInputStream("C:\\Users\\Z\\Desktop\\Za\\ser.txt");
            ObjectInputStream oi = new ObjectInputStream(inputStream);
            nodes = (List<Card>) oi.readObject();
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return nodes;

    }


    private List< Card> getList() {
        return null;
    }


}
