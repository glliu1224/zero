package com.arc.blog.zero.service.blog;

import com.arc.blog.model.domain.blog.BlogArticle;
import com.arc.blog.model.query.blog.BlogArticleQuery;

import java.util.List;

/**
 * 博客信息相关服务
 *
 * @author 叶超
 * @since 2019/1/30 17:33
 */
public interface BlogArticleService {

    Long save(BlogArticle blogArticle);

    Integer delete(Long id);

    Integer update(BlogArticle blogArticle);

    BlogArticle get(Long id);

    List<BlogArticle> list();

    List<BlogArticle> listPage(BlogArticleQuery query);
}
