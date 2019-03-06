package com.arc.blog.zero.service.blog.impl;

import com.arc.blog.model.domain.blog.BlogSort;
import com.arc.blog.zero.mapper.blog.BlogSortMapper;
import com.arc.blog.zero.service.blog.BlogSortService;
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
public class BlogSortServiceImpl implements BlogSortService {

    @Resource
    private BlogSortMapper sortMapper;

    @Override
    public Long save(BlogSort sort) {
        return sortMapper.save(sort) == 1 ? sort.getId() : null;
    }

    @Override
    public int delete(Long id) {
        return sortMapper.delete(id);
    }

    @Override
    public int update(BlogSort sort) {
        return sortMapper.update(sort);
    }

    @Override
    public BlogSort get(Long id) {
        return sortMapper.get(id);
    }

    @Override
    public List<BlogSort> list() {
        return sortMapper.list();
    }
}
