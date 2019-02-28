package com.arc.enums;


/**
 * 内部错误码
 */
public enum TypeEnum {
    //=====================================================
    //  两个特殊状态
    //=====================================================
    /**
     * 失败
     */
    FAILURE(0, "失败"),

    /**
     * 请求成功
     */
    SUCCESS(1, "成功"),
    B(2, "成功"),
    C(3, "成功"),
    D(4, "成功"),
    E(5, "成功"),
    ;


    //=====================================================
    //=====================================================

    /**
     * 错误码
     */
    private Integer number;
    /**
     * 错误信息
     */
    private String description;


    TypeEnum(Integer number, String description) {
        this.number = number;
        this.description = description;
    }

    public Integer getNumber() {
        return number;
    }

    public String getDescription() {
        return description;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public void setDescription(String description) {
        this.description = description;
    }}
