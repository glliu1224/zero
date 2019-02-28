package com.arc.zero.service.system.impl;

import com.arc.model.domain.system.SysLog;
import com.arc.zero.mapper.system.SysLogMapper;
import com.arc.zero.service.system.SysLogService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author: yechao
 * @date: 2018/11/10 19:01
 * @description:
 */
@Slf4j
@Service("sysLogServiceImpl2")
public class SysLogServiceImpl2 implements SysLogService {
    @Resource
    private SysLogMapper logMapper;

    @Override
    public Long save(SysLog sysLog) {
        return logMapper.save(sysLog) == 1 ? sysLog.getId() : null;
    }

    @Override
    public Integer delete(Long id) {
        return logMapper.delete(id);
    }

    @Override
    public Integer update(SysLog sysLog) {
        return logMapper.update(sysLog);
    }

    @Override
    @Cacheable(cacheNames = "get#{id}")
    public SysLog get(Long id) {
        long start = System.currentTimeMillis();
        log.info("get {}", start);
        SysLog sysLog = logMapper.get(id);
        log.info("/////////////////////////////");
        log.info("get  from db use {} ms ", System.currentTimeMillis() - start);
        return sysLog;
    }

    @Override
    @Cacheable(cacheNames = "list")
    public List<SysLog> page() {
        return logMapper.list();
    }


//    @EnableCaching    启用缓存配置 在配置类上有效
//    @Cacheable 指定某个方法的返回值是可以缓存的。在注解属性中指定缓存规则。
//    @Cacheput 将方法的返回值缓存到指定的key中
//    @CacheEvict 删除指定的缓存数据
//    注意
//    @Cacheable和@Cacheput都会将方法的执行结果按指定的key放到缓存中，@Cacheable在执行时，会先检测缓存中是否有数据存在，如果有，直接从缓存中读取。如果没有，执行方法，将返回值放入缓存，而@Cacheput会先执行方法，然后再将执行结果写入缓存。使用@Cacheput的方法一定会执行

}
