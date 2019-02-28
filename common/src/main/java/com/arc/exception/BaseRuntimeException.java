package com.arc.exception;

import com.arc.enums.ErrorCode;
import lombok.Getter;

/**
 * 基础 不必捕获异常--运行时异常
 *
 * @author Rubin
 * 2018/10/22 11:27
 */
@Getter
public class BaseRuntimeException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    /**
     * 异常码
     */
    protected String code;
    /**
     * 异常信息
     */
    protected String msg;


    public BaseRuntimeException(Throwable cause, ErrorCode code, String extErrorMsg) {
        super(extErrorMsg + " " + code.getCode() + ":" + code.getMsg(), cause);
        this.code = code.getCode();
        this.msg = code.getMsg();
    }

    public BaseRuntimeException(Throwable cause, ErrorCode code) {
        super(code.getCode() + ":" + code.getMsg(), cause);
        this.code = code.getCode();
        this.msg = code.getMsg();
    }

    public BaseRuntimeException(ErrorCode code, String extErrorMsg) {
        super(code.getCode() + ":" + code.getMsg());
        this.code = code.getCode();
        this.msg = extErrorMsg;
    }

    public BaseRuntimeException(ErrorCode code) {
        super(code.getCode() + ":" + code.getMsg());
        this.code = code.getCode();
        this.msg = code.getMsg();
    }

}
