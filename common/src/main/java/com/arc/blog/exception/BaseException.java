package com.arc.blog.exception;

import com.arc.blog.enums.ErrorCode;
import lombok.Getter;

/**
 * 基础异常
 *
 * @author Rubin
 * 2018/10/22 12:20
 */
@Getter
public class BaseException extends Exception {

    private static final long serialVersionUID = 8907646687879647382L;

    /**
     * 异常码
     */
    protected String code;
    /**
     * 异常信息
     */
    protected String msg;

    public BaseException(Throwable cause, ErrorCode code) {
        super(code.getCode() + ":" + code.getMsg(), cause);
        this.code = code.getCode();
        this.msg = code.getMsg();
    }

    public BaseException(ErrorCode code, String extMsg) {
        super(code.getCode() + ":" + code.getMsg());
        this.code = code.getCode();
        this.msg = extMsg;
    }

    public BaseException(ErrorCode code) {
        super(code.getCode() + ":" + code.getMsg());
        this.code = code.getCode();
        this.msg = code.getMsg();
    }

}
