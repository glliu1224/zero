package com.arc.blog.model.domain.system;

import com.arc.blog.model.domain.BaseModel;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

/**
 * 日志表
 *
 */
@Getter
@Setter
@ToString
public class SysLog extends BaseModel {

	private static final long serialVersionUID = 1L;

    private Long id;// 日志主键
    private Date createDate;// 记录创建时间
    private String fromAddress;// 操作者的地址
	private Integer insertQuantity;// 插入数量
	private String method;// 方法/动作
	private String name;// 操作名称
	private String note;// 操作备注
	private Long operatorId;// 操作者id
	private String operatorName;// 操作者名称
	private String parameter;// 参数
	private Integer success;// 状态码成功与否
	private Integer successQuantity;// 成功数量  successQuantity=updateQuantity+saveQuantity
	private String targetAddress;// 操作资源的目标地址
	private Integer updateQuantity;// 更新数量
}
