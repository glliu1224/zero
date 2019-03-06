package com.arc.blog.zero.service.system.impl;

import com.arc.blog.model.domain.system.SysFile;
import com.arc.blog.zero.service.system.SysFileService;
import com.arc.blog.zero.mapper.system.SysFileMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author yechao
 * @since 2019/1/13 19:41
 */
@Service
public class SysFileServiceImpl implements SysFileService {

    @Resource
    private SysFileMapper sysFileMapper;


    @Override
    public Long save(SysFile sysFile) {
        return sysFileMapper.save(sysFile) == 0 ? null : sysFile.getId();
    }

    @Override
    public int delete(Long id) {
        return sysFileMapper.delete(id);
    }

    @Override
    public int update(SysFile sysFile) {
        return sysFileMapper.update(sysFile);
    }

    @Override
    public SysFile get(Long id) {
        return sysFileMapper.get(id);
    }

    @Override
    public List<SysFile> list() {
        return sysFileMapper.list();
    }
}
