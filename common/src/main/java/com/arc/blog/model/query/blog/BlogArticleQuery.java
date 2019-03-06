package com.arc.blog.model.query.blog;

import com.arc.blog.model.query.BaseQuery;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

/**
 * 查询条件 For blog
 *
 * @author 叶超
 * @since 2019/3/6 14:54
 */
@Setter
@Getter
@ToString
@NoArgsConstructor
public class BlogArticleQuery extends BaseQuery {

    private Date createDate;// 创建时间(创建未发表)
    private Date updateDate;// 更新时间
}
