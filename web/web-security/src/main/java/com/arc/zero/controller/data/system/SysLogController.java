package com.arc.zero.controller.data.system;


import com.arc.model.domain.system.SysLog;
import com.arc.model.vo.ResponseVo;
import com.arc.zero.service.system.SysLogService;
import com.arc.zero.service.system.SysLogService;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * data 包下的 controller仅仅用作  返回json数据 ，禁止页面跳转使用，页面跳转使用的操作请移步web包
 *
 * @author 叶超
 * 用户相关的的接口by RESTful
 * @date 2018/12/25
 */
@Api
@Slf4j
@Controller
@RestController
@RequestMapping("/sys/log")
public class SysLogController {

    @Resource
    private SysLogService logService;

    //增删改查


    /**
     * 新建用户
     * 注意
     * 1请求类型为Content-Type:application/json
     * 2方法： POST
     *
     * @param sysLog
     * @return
     */
    @PostMapping(value = "/save")
    public ResponseVo save(@RequestBody SysLog sysLog) {
        log.debug("新建用户，参数 sysLog={}, ", sysLog.toString());
        return ResponseVo.success(logService.save(sysLog));
    }


    /**
     * 删除
     * 表示删除id为1的数据
     * 方法： DELETE
     * http://lip:port/sysLog/1
     *
     * @return
     */
//    @DeleteMapping(value = "/{id}")
    @GetMapping(value = "/delete/{id}")
    public ResponseVo delete(@PathVariable Long id) {
        log.debug("参数删除用户，参数id={}", id);
        return ResponseVo.success(logService.delete(id));

    }


    /**
     * 更新用户
     * 注意 1请求类型为Content-Type:application/json
     * 方法： PUT
     * 对于必要参数没有传则判断了一下会返回错误代码
     * http://ip:port/sysLog/
     *
     * @return
     */
//    @PutMapping("/")
    @PostMapping("/update")
    public ResponseVo update(@RequestBody SysLog sysLog) {
        log.debug("更新用户,参数sysLog={}, ", sysLog.toString());
        return ResponseVo.success(logService.update(sysLog));
    }

    /**
     * 获取单个用户
     *
     * @param id
     * @return
     */
    @GetMapping(value = "/get/{id}")
    public ResponseVo get(@PathVariable Long id) {
        log.debug("获取单个用户,参数 id={}", id);
        return ResponseVo.success(logService.get(id));
    }

    /**
     * 获取用户列表
     *
     * @return
     */
    //@todo page 分页插件
    @GetMapping(value = "/page")
    public ResponseVo list() {
        log.debug("获取用户列表，无参数！");
        return ResponseVo.success(logService.page());
    }


}

