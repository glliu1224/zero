package com.arc.blog.enums.common;


/**
 * 只有可用不可用两种状态的枚举类
 *
 * @author lamymay@outlook.com
 */
public enum EnableDisable implements IntegerStatusEnums {

    /**
     * 可用
     */
    ENABLE(1, "可用"),

    /**
     * 不可用
     */
    DISABLE(0, "不可用"),
    ;

    /**
     * 字段私有化
     */
    private int number;
    private String msg;

    private EnableDisable(int number) {
        this.number = number;
    }

    private EnableDisable(int number, String msg) {
        this.number = number;
        this.msg = msg;
    }


//    public static EnableDisable by(int code) {
//        for (EnableDisable e : EnableDisable.values()) {
//            if (code == e.getCode()) return e;
//        }
//        return null;
//    }


    @Override
    public int getNumber() {
        return number;
    }

    public String getMsg() {
        return msg;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }}
