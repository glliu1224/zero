package com.arc.model.domain.system;

import com.arc.model.domain.BaseModel;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

/**
 * 用户授权信息表
 */
@Getter
@Setter
@ToString
public class SysUserAuth extends BaseModel {

    private static final long serialVersionUID = 1L;

    private Long id;//
    private Long userId;//


    private String identifier;// 标识（手机号 邮箱 用户名或第三方应用的唯一标识）         private String username;// 账号
    private String credential;// 密码凭证（站内的保存密码，站外的不保存或保存token）private String password;// 密码

    private Integer identityType;// 登录类型（1用户名 2手机号3 邮箱 4微信 5微博等）
    private Integer status;// 状态(逻辑删除/停用)
    private Integer verified;// 验证与否
    private Date createDate;// 创建时间
    private Date updateDate;// 更新时间


}
