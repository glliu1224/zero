package com.arc.zero.controller.data.blog;

import com.arc.model.domain.blog.BlogArticle;
import com.arc.model.vo.ResponseVo;
import com.arc.zero.service.blog.BlogArticleService;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * 博客信息主出口
 *
 * @author: 叶超
 * @since: 2019/1/30 15:17
 */
@Api
@Slf4j
@RestController
@RequestMapping("/blog")
public class BlogArticleController {

    @Resource
    private BlogArticleService blogArticleService;

    /**
     * 获取文章
     *
     * @param id
     * @return
     */
    @GetMapping("/{id}")
    public ResponseVo get(@PathVariable("id") Long id) {
        log.debug("参数id={}", id);
        return ResponseVo.success(blogArticleService.get(id));
    }

    /**
     * 保存，新建文章
     *
     * @param blog
     * @return 有效信息为数据的id
     */
    @PostMapping("/save")
    public ResponseVo create(@RequestBody BlogArticle blog) {
        log.debug("结果={}", blog);
        return ResponseVo.success(blogArticleService.save(blog));
    }

    /**
     * 更新，编辑，发布
     *
     * @param blog
     * @return
     */
    @PostMapping("/update")
    public ResponseVo modify(@RequestBody BlogArticle blog) {
        return ResponseVo.success(blogArticleService.update(blog));
    }

    @GetMapping("/test/v1")
    public ResponseVo v1() {
        return ResponseVo.success(blogArticleService.list());
    }


}
