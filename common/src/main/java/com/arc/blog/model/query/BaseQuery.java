package com.arc.blog.model.query;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.io.Serializable;

/**
 * 查询条件 泛型话抽取
 *
 * @author yechao
 * @date 2019/03/06 14:59
 */
@Setter
@Getter
@ToString
@NoArgsConstructor
public class BaseQuery implements Serializable {

    private Long id;// 主键
}
