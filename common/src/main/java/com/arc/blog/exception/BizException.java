package com.arc.blog.exception;

import com.arc.blog.enums.ProjectCode;

/**
 * 业务运行时异常
 *
 * @author 叶超
 * @since 2018/04/10
 */
public class BizException extends RuntimeException implements BaseException {

    private static final long serialVersionUID = 1L;

    private int code = ProjectCode.UNKNOWN.getCode();

    private String msg = ProjectCode.UNKNOWN.getMsg();

    public BizException() {
        super();
    }

    public BizException(ProjectCode projectCode) {
        super();
        this.code = projectCode.getCode();
        this.msg = projectCode.getMsg();
    }

    public BizException(String msg) {
        super();
        this.msg = msg;
    }

    @Override
    public Integer getCode() {
        return this.code;
    }

    @Override
    public String getMsg() {
        return this.msg;
    }
}
