package com.arc.blog.zero.controller.test;

import com.arc.blog.enums.TypeEnum;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
