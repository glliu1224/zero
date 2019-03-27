package com.arc.blog.zero.controller.data.system;


import com.arc.blog.model.domain.system.SysUser;
import com.arc.blog.model.vo.ResponseVo;
import com.arc.blog.zero.service.system.SysUserService;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * data 包下的 controller仅仅用作  返回json数据 ，禁止页面跳转使用，页面跳转使用的操作请移步web包
 * 用户相关的的接口by RESTful
 *
 * @author 叶超
 * @since  2018/12/25
 */
@Api
@Slf4j
@Controller
@RestController
@RequestMapping("/user")
public class SysUserController {

    @Resource
    private SysUserService userService;

    //增删改查


    /**
     * 新建用户
     * 注意
     * 1请求类型为Content-Type:application/json
     * 2方法： POST
     *
     * @param user SysUser
     * @return ResponseVo
     */
    @PostMapping(value = "/save")
    public ResponseVo save(@RequestBody SysUser user) {
        log.debug("新建用户，参数 user={}, ", user.toString());
        return ResponseVo.success(userService.save(user));
//        return ResponseVo.success(user);
    }


    /**
     * 删除
     * 表示删除id为1的数据
     * 方法： DELETE
     * http://lip:port/user/1
     @param id  Long id
     * @return ResponseVo
     */
//    @DeleteMapping(value = "/{id}")
    @GetMapping(value = "/delete/{id}")
    public ResponseVo delete(@PathVariable Long id) {
        log.debug("参数删除用户，参数id={}", id);
        return ResponseVo.success(userService.delete(id));

    }


    /**
     * 更新用户
     * 注意 1请求类型为Content-Type:application/json
     * 方法： PUT
     * 对于必要参数没有传则判断了一下会返回错误代码
     * http://ip:port/user/
     *
     * @return ResponseVo
     */
//    @PutMapping("/")
    @PostMapping("/update")
    public ResponseVo update(@RequestBody SysUser user) {
        log.debug("更新用户,参数user={}, ", user.toString());
        return ResponseVo.success(userService.update(user));
    }

    /**
     * 获取单个用户
     *
     * @param id Long
     * @return ResponseVo
     */
    @GetMapping(value = "/get/{id}")
    public ResponseVo get(@PathVariable Long id) {
        log.debug("获取单个用户,参数 id={}", id);
        return ResponseVo.success(userService.get(id));
    }

    /**
     * 获取用户列表
     *
     * @return ResponseVo
     */
    //@todo page 分页插件
    @GetMapping(value = "/page")
    public ResponseVo list() {
        log.debug("获取用户列表，无参数！");
        return ResponseVo.success(userService.list());
    }

    /**
     * 测试登陆 @todo 待删除
     *
     * @param username
     * @param password
     * @return
     */
    @GetMapping(value = "/login")
    public ResponseVo get(@RequestParam String username, @RequestParam String password) {
        log.debug("login,获取单个用户,参数 username={},password={}", username, password);
        return ResponseVo.success(userService.login(username, password));
    }
}

