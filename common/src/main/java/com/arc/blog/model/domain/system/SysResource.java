package com.arc.blog.model.domain.system;

import java.util.Date;


import com.arc.blog.model.domain.BaseModel;
import lombok.Getter;
import lombok.Setter;

/**
 *
 *
 */
@Getter
@Setter
public class SysResource extends BaseModel {

	private static final long serialVersionUID = 1L;

	private Date createDate;// 创建时间
	private String id;// 主键
	private String method;// 请求方法（GET，POST，ALL）
	private String note;// 备注
	private String parentId;// 上级节点ID
	private String path;// 资源路径
	private Integer priority;// 优先级
	private String resourceName;// 资源名
	private String type;// 资源类型（PART，LINK，ACTION）
	private Date updateDate;// 修改时间
}
