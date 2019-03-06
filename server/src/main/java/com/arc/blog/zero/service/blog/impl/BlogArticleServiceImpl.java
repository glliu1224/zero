package com.arc.blog.zero.service.blog.impl;

import com.arc.blog.model.domain.blog.BlogArticle;
import com.arc.blog.model.query.blog.BlogArticleQuery;
import com.arc.blog.zero.mapper.blog.BlogArticleMapper;
import com.arc.blog.zero.service.blog.BlogArticleService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 叶超
 * @since 2019/1/30 17:33
 */
@Slf4j
@Service
@Transactional
public class BlogArticleServiceImpl implements BlogArticleService {

    @Resource
    private BlogArticleMapper blogArticleMapper;

    @Override
    public Long save(BlogArticle blogArticle) {
        return blogArticleMapper.save(blogArticle) == 1 ? blogArticle.getId() : null;
    }

    @Override
    public Integer delete(Long id) {
        return blogArticleMapper.delete(id);
    }

    @Override
    public Integer update(BlogArticle blogArticle) {
        return blogArticleMapper.update(blogArticle);
    }

    @Override
    public BlogArticle get(Long id) {
        return blogArticleMapper.get(id);
    }

    @Override
    public List<BlogArticle> list() {
        return blogArticleMapper.list();
    }

    //todo 分页
    @Override
    public List<BlogArticle> listPage(BlogArticleQuery query) {
        return blogArticleMapper.list();
    }
}
