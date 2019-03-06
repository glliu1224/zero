package com.arc.blog.zero.controller.data.test;

import com.arc.blog.enums.TypeEnum;
import com.arc.blog.model.vo.ResponseVo;
import com.arc.blog.zero.service.system.SysUserAuthService;
import com.arc.blog.zero.service.system.SysUserService;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * 测试跳转以及数据返回用
 *
 * @author 叶超
 * @since 2018/12/26 11:28
 */
@Api
@Slf4j
@Controller
@RequestMapping("/test")
public class TestController {

    @Resource
    private SysUserService userService;

    //@Api：用在类上，说明该类的作用
    //@ApiOperation：用在方法上，说明方法的作用
    //@ApiImplicitParams：用在方法上包含一组参数说明
    //@ApiImplicitParam：用在 @ApiImplicitParams 注解中，指定一个请求参数的各个方面
    //        paramType：参数放在哪个地方
    //        · header --> 请求参数的获取：@RequestHeader
    //        · query -->请求参数的获取：@RequestParam
    //        · path（用于restful接口）--> 请求参数的获取：@PathVariable
    //        · body（不常用）
    //                · form（不常用）
    //                name：参数名
    //                dataType：参数类型
    //                required：参数是否必须传
    //                value：参数的意思
    //                defaultValue：参数的默认值
    //@ApiResponses：用于表示一组响应
    //@ResponseResult：用在@ApiResponses中，一般用于表达一个错误的响应信息
    //        code：数字，例如400
    //        message：信息，例如"请求参数没填好"
    //        response：抛出异常的类
    //@ApiModel：描述一个Model的信息（这种一般用在post创建的时候，使用@RequestBody这样的场景，请求参数无法使用@ApiImplicitParam注解进行描述的时候）
    //@ApiModelProperty：描述一个model的属性

    @Resource
    private SysUserAuthService authService;

    @RequestMapping(value = "/success", method = {RequestMethod.GET, RequestMethod.POST})
    public String success() {
        return "success1111";
    }

    @RequestMapping(value = "/v1", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public Object v1() {
        return "111111test/v1";
    }

    @RequestMapping(value = "/v2", method = {RequestMethod.GET, RequestMethod.POST})
    public String v2() {
        return "/test/v2";
    }


    @GetMapping(value = "/v3")
    @ResponseBody
    public Object v3(@RequestParam String username) {
        return ResponseVo.success(userService.getByIdentifierAndIdentityType(username, null));
    }

    @GetMapping(value = "/v4")
    @ResponseBody
    public Object v4(@RequestParam String username) {
        return ResponseVo.success(authService.getByUsername(username));
    }

    @GetMapping(value = "/v5")
    @ResponseBody
    public Object v5(@RequestParam Long id) {
        return ResponseVo.success(userService.get(id));
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


    ////////////////////////////////////////
    public static void main(String[] args) {
        fun2();
    }

    public static void fun1(String[] args) {
        System.out.println((double) (15 / 21));//0.0
        System.out.println((double) (15f / 21f));//0.7142857313156128
        System.out.println((15d / 21d));//0.7142857142857143
        System.out.println((12000 * 0.8d * (15f / 21d)));
        System.out.println(12000 * 0.8d * (0.70d));
    }

    public static void fun2() {
        short[] arr = {0, 1, 2, 3, 4, 5};
        for (short num : arr) {
            Integer integer1 = 1;
            Integer integer5 = 5;
            System.out.println(integer1.equals(arr[4]));
            System.out.println(integer5.equals(arr[4]));
            System.out.println(arr[4]);
            System.out.println(arr[5]);
            boolean b = integer1.equals(arr[5]) | integer5.equals(arr[5]);
            boolean c = integer1.equals((int) arr[5]) | integer5.equals((int) arr[5]);
            System.out.println(b);
            System.out.println(b);
            System.out.println(b);
            System.out.println(b);
            System.out.println();


            System.out.println(c);
            System.out.println(c);
            System.out.println(c);

            if (!(TypeEnum.E.getNumber().equals((int) num) | TypeEnum.D.getNumber().equals((int) num))) {
                System.out.println("范围外4,5");
                System.out.println(TypeEnum.E.getNumber().equals((int) num) + "-------------" + num);
            }
        }
    }
}
