package com.arc.blog.model.domain.blog;


import com.arc.blog.model.domain.BaseModel;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * 文章标签表，多对多
 */
@Getter
@Setter
@ToString
public class BlogTag extends BaseModel {

    private static final long serialVersionUID = 1L;

    private Long id;// 文章自增ID
    private String tagName;// 标签名称
}
