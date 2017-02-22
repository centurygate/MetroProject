package com.xigeng.metroproject.service;


import com.xigeng.metroproject.dao.SecurityUserEntityDao;
import com.xigeng.metroproject.model.SecurityUserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * Created by free on 11/26/16.
 */

@Service("securityUserEntityService")
public class SecurityUserEntityServiceImp implements SecurityUserEntityService {

    @Autowired
    private SecurityUserEntityDao securityUserEntityMapper;

    public SecurityUserEntity selectByPrimaryKey(Long id) {
        return securityUserEntityMapper.selectByPrimaryKey(id);
    }

    public int updateByPrimaryKey(SecurityUserEntity record) {
        return securityUserEntityMapper.updateByPrimaryKey(record);
    }

    public List<SecurityUserEntity> selectAllSecurityUserEntity() {
        return securityUserEntityMapper.selectAllSecurityUserEntity();
    }

    public SecurityUserEntity selectByUserName(String username) {
        return securityUserEntityMapper.selectByUserName(username);
    }

    public int insertSecurityUserEntity(SecurityUserEntity securityUserEntity) {
        return securityUserEntityMapper.insert(securityUserEntity);
    }

    public List<SecurityUserEntity> selectSecurityUserEntityByPageAndLimitAndCondition(String username, Date startDate, Date endDate, Integer offset, Integer limit) {
        return securityUserEntityMapper.selectSecurityUserEntityByPageAndLimitAndCondition(username,startDate,endDate,offset,limit);
    }

    public int selectSecurityUserEntityByCondition(String username, Date startDate, Date endDate) {
        return securityUserEntityMapper.selectSecurityUserEntityByCondition(username,startDate,endDate);
    }
}
