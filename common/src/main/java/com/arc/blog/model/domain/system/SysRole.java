package com.arc.blog.model.domain.system;

import com.arc.blog.model.domain.BaseModel;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

/**
 * 系统角色表
 */
@Getter
@Setter
public class SysRole extends BaseModel {

    private static final long serialVersionUID = 1L;

    private String id;// 自增id
    private String roleName;// 角色名称
    private Integer rootAdmin;// 是否系统管理员
    private Integer state;// 状态
    private String note;// 备注 描述
    private Date createDate;// 创建时间
    private Date updateDate;// 更新时间
}
