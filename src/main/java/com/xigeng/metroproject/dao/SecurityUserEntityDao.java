package com.xigeng.metroproject.dao;



import com.xigeng.metroproject.model.SecurityUserEntity;

import java.util.Date;
import java.util.List;

public interface SecurityUserEntityDao {
    int deleteByPrimaryKey(Long id);

    int insert(SecurityUserEntity record);

    int insertSelective(SecurityUserEntity record);

    SecurityUserEntity selectByPrimaryKey(Long id);

    SecurityUserEntity selectByUserName(String username);

    List<SecurityUserEntity> selectSecurityUserEntityByPageAndLimitAndCondition(String username, Date startDate, Date endDate, Integer offset, Integer limit);
    int selectSecurityUserEntityByCondition(String username, Date startDate, Date endDate);
    List<SecurityUserEntity> selectAllSecurityUserEntity();

    int updateByPrimaryKeySelective(SecurityUserEntity record);

    int updateByPrimaryKey(SecurityUserEntity record);

//    int updatePasswordByPrimaryKey(Long id);
}