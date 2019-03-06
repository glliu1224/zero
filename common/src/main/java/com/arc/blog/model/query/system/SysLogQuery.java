package com.arc.blog.model.query.system;

import com.arc.blog.model.query.BaseQuery;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
   * 查询条件 For SysLog
 * @author: yechao
 * @date: 2019/02/02 11:09
 * @description:
 */
@Setter
@Getter
@ToString
public class SysLogQuery extends BaseQuery {

    private Long id;// 日志主键
    private Boolean success;// 状态码成功与否
    private String name;// 操作名称
    private String operator;// 操作者名称

    public SysLogQuery(String name) {
        this.name = name;
    }
}
