package com.arc.zero.service.blog;

import com.arc.model.domain.blog.BlogArticle;

import java.util.List;

/**
 * 博客信息相关服务
 *
 * @author: 叶超
 * @since: 2019/1/30 15:09
 */
public interface BlogArticleService {

    Long save(BlogArticle blogArticle);

    Integer delete(Long id);

    Integer update(BlogArticle blogArticle);

    BlogArticle get(Long id);

    List<BlogArticle> list();

}
