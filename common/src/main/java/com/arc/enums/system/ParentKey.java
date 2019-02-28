package com.arc.enums.system;

/**
 * 资源父级标记 parentMark 判断的时候靠 这个标记区分根节点 并依靠 type 确定是第二级（ACTION）还是第三级别（ACTION）
 */
public enum ParentKey {

    /**
     * 三级资源
     */
    ACTION_REALM,

    // ==========================
    // 一级 资源 既根节点
    // ==========================
    /**
     * 系统管理的节点
     */
    SYSTEM_REALM,

    /**
     * 合作方管理的节点
     */
    PARTNER_REALM,

    /**
     * 客户管理节点
     */
    MEMBER_REALM,

    /**
     * 套餐管理节点
     */
    PACK_REALM,

    /**
     * 订单管理节点
     */
    ORDER_REALM,

    /**
     * 坐席管理节点
     */
    AGENT_REALM,

    /**
     * 服务管理节点
     */
    SERVICE_REALM,

    /**
     * 短信管理节点
     */
    SMS_REALM,

    /**
     * 活动管理节点
     */
    ACTIVITY_REALM,

    // ==========================
    // 二级 资源
    // ==========================

    /**
     * 用户管理
     */
    SYSTEM_USER_ACTION_REALM,

    /**
     * 角色管理
     */
    SYSTEM_ROLE_ACTION_REALM,

    /**
     * 资源（权限）管理
     */
    SYSTEM_REALM_ACTION_REALM,

    /**
     * 合作方管理
     */
    PARTNER_ACTION_REALM,

    /**
     * 合作方服务内容管理
     */
    PARTNER_CONTENT_ACTION_REALM,

    /**
     * 会员管理
     */
    MEMBER_ACTION_REALM,

    /**
     * 套餐管理
     */
    PACK_ACTION_REALM,

    /**
     * 订单管理
     */
    ORDER_ACTION_REALM,

    /**
     * 坐席管理
     */
    AGENT_ACTION_REALM,

    /**
     * 服务管理
     */
    SERVICE_ACTION_REALM,

    /**
     * 短信管理
     */
    SMS_ACTION_REALM,

    /**
     * 黑白名单管理
     */
    WHITE_BLACK_REALM,

    /**
     * 渠道管理
     */
    CHANNEL_ACTION_REALM,

    /**
     * 活动管理
     */
    ACTIVITY_ACTION_REALM,

}
