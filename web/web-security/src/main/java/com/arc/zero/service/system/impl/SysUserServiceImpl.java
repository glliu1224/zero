package com.arc.zero.service.system.impl;

import com.arc.model.domain.system.SysUser;
import com.arc.zero.mapper.system.SysUserMapper;
import com.arc.zero.service.system.SysUserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author 叶超
 * @since 2018/12/26 11:28
 */
@Slf4j
@Transactional
@Service
public class SysUserServiceImpl implements SysUserService {

    @Resource
    private SysUserMapper sysUserMapper;


    @Override

    public Long save(SysUser user) {
        return sysUserMapper.save(user) == 1 ? user.getId() : null;
    }

    @Override
    public int delete(Long id) {
        return sysUserMapper.delete(id);
    }

    @Override
    public int update(SysUser user) {
//        return sysUserMapper.update(user);
        Integer update = sysUserMapper.update(user);
        log.debug("#############################");
        log.debug("结果={}", update);
        log.debug("结果={}", update);
        log.debug("#############################");
        return update;
    }


    @Override
    public SysUser get(Long id) {
        return sysUserMapper.get(id);
    }


    @Override
    public List<SysUser> list() {
        return sysUserMapper.list();
    }


    /**
     * 特殊方法
     * t_sys_user_auth left join  t_sys_user
     *
     * @param identifier 身份标记
     * @return SysUSer with auth
     */
    @Override
    public SysUser getByIdentifierAndIdentityType(String identifier, Integer identityType) {
        //约定，在sql中完成嘛?? 登陆时候默认用第一种种类型校验 identityType=1，即username、password
        if (identityType == null) {
            identityType = 1;
        }
//        return sysUserMapper.getByIdentifier(identifier, identityType);
        SysUser user = sysUserMapper.getByIdentifierAndIdentityType(identifier, identityType);
        log.debug("结果={}", user);
        return user;
    }

    @Override
    public Boolean login(String username, String password) {
        Boolean result = false;
//        SysUser dbUser = getByUsername(username);
//        //@todo MD5或者其他加密手段
//        if (dbUser != null && dbUser.getPassword() != null && dbUser.getPassword().equals(password)) {
//            result = true;
//        }
        return result;
    }

}
