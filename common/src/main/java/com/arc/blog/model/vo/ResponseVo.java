package com.arc.blog.model.vo;

import com.arc.blog.enums.ProjectCode;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 向前段统一返回数据，该类对结果做了统一封装
 *
 * @param <T>
 */
@Getter
@Setter
@ToString
public class ResponseVo<T> extends BaseVo {

    private static final long serialVersionUID = 1L;

    /**
     * 状态信息 code 用String或者数字类型（long/int？）。私以为：类型是数字类型 可能高效一些，
     */
    private int code;

    /**
     * 状态信息
     */
    private String msg;


    /**
     * 有效数据
     */
    private T data;

    //构造器
    public ResponseVo() {
    }

    public ResponseVo(int code, String msg, T data) {
        this.code = code;
        this.msg = msg;
        this.data = data;
    }

    public ResponseVo(T data) {
        this.data = data;
    }

    //success方法
    public static <T> ResponseVo<T> success() {
        return new ResponseVo<T>(ProjectCode.SUCCESS.getCode(), ProjectCode.SUCCESS.getMsg(),  null);
    }

    public static <T> ResponseVo<T> success(T data) {
        return new ResponseVo<T>(ProjectCode.SUCCESS.getCode(), ProjectCode.SUCCESS.getMsg(),  data);
    }

    public static <T> ResponseVo<T> success(ProjectCode enumCode) {
        return new ResponseVo<T>(enumCode.getCode(), enumCode.getMsg(),  null);
    }

    public static <T> ResponseVo<T> success(ProjectCode enumCode, T data) {
        return new ResponseVo<T>(enumCode.getCode(), enumCode.getMsg(),  data);
    }

    //失败
    public static <T> ResponseVo<T> failure() {
        return new ResponseVo<T>(ProjectCode.FAILURE.getCode(), ProjectCode.FAILURE.getMsg(), null);
    }

    public static <T> ResponseVo<T> failure(ProjectCode enumCode) {
        return new ResponseVo<T>(enumCode.getCode(), enumCode.getMsg(), null);
    }

    public static <T> ResponseVo<T> failure(T data) {
        return new ResponseVo<T>(ProjectCode.FAILURE.getCode(), ProjectCode.FAILURE.getMsg(), data);
    }

    public static <T> ResponseVo<T> failure(ProjectCode enumCode, T data) {
        return new ResponseVo<T>(enumCode.getCode(), enumCode.getMsg(), data);
    }

// @todo     下次再改！！！
//    /**
//     * 处理微服务的返回结果
//     *
//     * @param response
//     * @param <T>
//     * @return
//     */
//    public static <T> ResponseVo<T> buildResponse(MicroServiceResponse<T> response) {
//        if (response == null) {
//            throw new BizException(ProjectCode.NULL_RESPONSE);
//        }
//        return StringUtils.equals(response.getCode(), ProjectCode.SUCCESS.getCode()) ? ResponseVo.success(response.getData()) : ResponseVo.failure(ProjectCode.buildFailure(response.getCode(), response.getMsg()));
//    }
//
//    /**
//     * 处理微服务的返回结果（类型转换）
//     *
//     * @param response
//     * @param <T>
//     * @return
//     */
//    public static <T> ResponseVo<T> convertResponse(MicroServiceResponse<?> response, Class<T> target) {
//        if (response == null || target == null) {
//            throw new BizException(ProjectCode.NULL_RESPONSE);
//        }
//        T instance = BeanCopierUtil.copyBean(response.getData(), target);
//        return StringUtils.equals(response.getCode(), ProjectCode.SUCCESS.getCode()) ? ResponseVo.success(instance) : ResponseVo.failure(ProjectCode.buildFailure(response.getCode(), response.getMsg()));
//    }
//
//    /**
//     * 处理微服务的返回结果（分页类型转换）
//     *
//     * @param response
//     * @param <T>
//     * @return
//     */
//    public static <T> ResponseVo<PageResponse<T>> convertPageResponse(MicroServiceResponse<? extends PageResponse> response, Class<T> target) {
//        if (response == null || target == null) {
//            throw new BizException(ProjectCode.NULL_RESPONSE);
//        }
//        if (response.getData() == null) {
//            throw new BizException(ProjectCode.PAGE_NULL_RESPONSE);
//        }
//        List<T> list = BeanCopierUtil.copyList(response.getData().getData(), target);
//        PageResponse<T> instance = new PageResponse<>();
//        instance.setData(list);
//        instance.setTotalPages(response.getData().getTotalPages());
//        instance.setTotalElements(response.getData().getTotalElements());
//        return StringUtils.equals(response.getCode(), ProjectCode.SUCCESS.getCode()) ? ResponseVo.success(instance) : ResponseVo.failure(ProjectCode.buildFailure(response.getCode(), response.getMsg()));
//    }
//
//    /**
//     * 处理微服务的返回结果（列表类型转换）
//     *
//     * @param response
//     * @param <T>
//     * @return
//     */
//    public static <T> ResponseVo<List<T>> convertListResponse(MicroServiceResponse<? extends List> response, Class<T> target) {
//        if (response == null || target == null) {
//            throw new BizException(ProjectCode.NULL_RESPONSE);
//        }
//        List<T> instance = BeanCopierUtil.copyList(response.getData(), target);
//        return StringUtils.equals(response.getCode(), ProjectCode.SUCCESS.getCode()) ? ResponseVo.success(instance) : ResponseVo.failure(ProjectCode.buildFailure(response.getCode(), response.getMsg()));
//    }
//
//    /**
//     * 处理微服务的返回结果（含参数名映射列表类型转换）
//     *
//     * @param response
//     * @param <T>
//     * @return
//     */
//    public static <T> ResponseVo<List<T>> convertListResponse(MicroServiceResponse<? extends List> response, Class<T> target, Map<String, String> relation) {
//        if (response == null || target == null) {
//            throw new BizException(ProjectCode.NULL_RESPONSE);
//        }
//        List<T> instance = BeanCopierUtil.copyList(response.getData(), target, relation);
//        return StringUtils.equals(response.getCode(), ProjectCode.SUCCESS.getCode()) ? ResponseVo.success(instance) : ResponseVo.failure(ProjectCode.buildFailure(response.getCode(), response.getMsg()));
//    }

}
