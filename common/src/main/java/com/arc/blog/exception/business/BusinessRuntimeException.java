package com.arc.blog.exception.business;

import com.arc.blog.enums.ErrorCode;
import com.arc.blog.exception.BaseRuntimeException;

/**
 * 业务运行时异常
 *
 * @author Rubin
 * 2018/10/22 11:49
 */
public class BusinessRuntimeException extends BaseRuntimeException {

    private static final long serialVersionUID = 1L;

    public BusinessRuntimeException(Throwable cause, ErrorCode errorCode) {
        super(cause, errorCode);
    }

    public BusinessRuntimeException(Throwable cause, ErrorCode errorCode, String extErrorMsg) {
        super(cause, errorCode, extErrorMsg);
    }

    public BusinessRuntimeException(ErrorCode errorCode) {
        super(errorCode);
    }

    public BusinessRuntimeException(ErrorCode errorCode, String extErrorMsg) {
        super(errorCode, extErrorMsg);
    }
}
