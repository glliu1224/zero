package com.arc.blog.zero.service.blog;

import com.arc.blog.model.domain.blog.BlogSort;

import java.util.List;

/**
 * 博客分类相关服务
 *
 * @author 叶超
 * @since 2019/1/30 17:33
 */
public interface BlogSortService {

    Long save(BlogSort sort);

    int delete(Long id);

    int update(BlogSort sort);

    BlogSort get(Long id);

    List<BlogSort> list();


}
