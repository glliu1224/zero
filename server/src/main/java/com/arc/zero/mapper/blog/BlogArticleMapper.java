package com.arc.zero.mapper.blog;

import com.arc.model.domain.blog.BlogArticle;

import java.util.List;

/**
 * @author: 叶超
 * @since: 2019/1/30 15:05
 */
public interface BlogArticleMapper {

    int save(BlogArticle blogArticle);

    int delete(Long id);

    int update(BlogArticle blogArticle);

    BlogArticle get(Long id);

    List<BlogArticle> list();

}
