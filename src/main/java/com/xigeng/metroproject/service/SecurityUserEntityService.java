package com.xigeng.metroproject.service;



import com.xigeng.metroproject.model.SecurityUserEntity;

import java.util.Date;
import java.util.List;

/**
 * Created by free on 11/26/16.
 */
public interface SecurityUserEntityService {
    SecurityUserEntity selectByPrimaryKey(Long id);
    SecurityUserEntity selectByUserName(String username);
    int insertSecurityUserEntity(SecurityUserEntity securityUserEntity);
    int updateByPrimaryKey(SecurityUserEntity record);
    List<SecurityUserEntity>  selectAllSecurityUserEntity();
    List<SecurityUserEntity> selectSecurityUserEntityByPageAndLimitAndCondition(String username, Date startDate, Date endDate, Integer offset, Integer limit);
    int selectSecurityUserEntityByCondition(String username, Date startDate, Date endDate);
}
