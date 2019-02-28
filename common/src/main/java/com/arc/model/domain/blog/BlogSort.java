package com.arc.model.domain.blog;


import com.arc.model.domain.BaseModel;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 文章分类表
 *
 */
@Getter
@Setter
@ToString
public class BlogSort extends BaseModel {

	private static final long serialVersionUID = 1L;

	private Long id;// 文章自增ID
	private String name;// 分类名称
	private Integer weight;// 该分类排序的权重
}
