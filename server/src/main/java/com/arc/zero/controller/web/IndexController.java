package com.arc.zero.controller.web;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * web 包下的 controller仅仅用作页面跳转使用，禁止返回json数据， 返回json数据的操作请移步data包
 *
 * @author: 叶超
 * @date: 2019/1/2 23:24
 */
@Slf4j
@Controller
public class IndexController {


    @RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST})
    public String test() {
        log.debug("#########################");
        log.debug("登录成功！");
        log.debug("/");
        log.debug("走的是默认路径");
        log.debug("#########################");
        return "index";
    }

    @RequestMapping(value = "/index", method = {RequestMethod.GET, RequestMethod.POST})
    public String index() {
        log.debug("#########################");
        log.debug("登录成功！");
        log.debug("#########################");
        return "index";
    }

    /**
     * 测试
     *
     * @return
     */
    @GetMapping("/success-to-index")
    public String testConfigJumpHere() {
        log.debug("-------------------------------------------");
        log.debug("登录成功！");
        log.debug("/success-to-index");
        log.debug("走的是配置默认路径");
        log.debug("-------------------------------------------");
        return "/success/index";
    }

    @RequestMapping(value = "/login", method = {RequestMethod.GET, RequestMethod.POST})
    public String login() {
        return "login";
    }


}
