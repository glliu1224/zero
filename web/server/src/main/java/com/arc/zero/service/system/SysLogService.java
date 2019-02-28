package com.arc.zero.service.system;

import com.arc.model.domain.system.SysLog;

import java.util.List;

/**
 * @author: 叶超
 * @since: 2019/2/2 11:37
 */
public interface SysLogService {

    Long save(SysLog sysLog);

    Integer delete(Long id);

    Integer update(SysLog sysLog);

    SysLog get(Long id);

    List<SysLog> page();


}
