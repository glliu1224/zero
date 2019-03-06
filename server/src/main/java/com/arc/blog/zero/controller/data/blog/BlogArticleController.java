package com.arc.blog.zero.controller.data.blog;

import com.arc.blog.model.domain.blog.BlogArticle;
import com.arc.blog.model.query.blog.BlogArticleQuery;
import com.arc.blog.model.vo.ResponseVo;
import com.arc.blog.zero.service.blog.BlogArticleService;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * 博客信息主出口
 *文章相关的业务场景：
 * 1单条数据相关-
 * 1.1、查看一篇文章/修改时候的回显
 * 1.2、修改一篇、删除
 * 2批量相关
 * 2.1、批量审核文章--update/delete
 * 2.2、批量查看？  todo 测试中临时使用，建议及时删除
 * @author 叶超
 * @since 2019/1/30 15:17
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


    @GetMapping("/page")
    public ResponseVo page() {
        BlogArticleQuery query = new BlogArticleQuery();
        return ResponseVo.success(blogArticleService.listPage(query));
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
