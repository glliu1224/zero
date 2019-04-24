package com.arc.blog.zero.controller.data.test;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

/**
 * @author 叶超
 * @since 2019/4/16 23:22
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Card {

    private static final long serialVersionUID = 1L;

    private Long id;

    private Long parentId;

    private Long projectId;

    private String name;

    private String parentName;

    private Integer level;

    private List<Card> children = new ArrayList<>();
}
