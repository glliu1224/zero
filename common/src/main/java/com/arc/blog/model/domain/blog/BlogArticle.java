package com.arc.blog.model.domain.blog;

import com.arc.blog.model.domain.BaseModel;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

/**
 * 文章表
 *
 * @author 叶超
 * @since: 2019/1/30 15:09
 */
@Getter
@Setter
@ToString
public class BlogArticle extends BaseModel {

    private static final long serialVersionUID = 1L;

    private Long id;// 日志自增ID号
    private Long authorId;// 作者，所属用户ID[多作者请在描述中填充第二作者信息]
    private Long tagId;// 栏目ID
    private Long sortId;// 所属分类
    private Integer status;// 文章的模式:0为私有，1为公开，2为仅好友查看
    private String title;// 文章名称-64
    private String description;// 文章描述-128
    private String content;// 文章内容[text]
    private Date publishDate;// 发布时间
    private Date createDate;// 创建时间(创建未发表)
    private Date updateDate;// 更新时间
}
