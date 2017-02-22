package com.xigeng.metroproject.dao;

import com.xigeng.metroproject.model.SecurityResourceRoleEntity;

import java.util.List;

public interface SecurityResourceRoleDao {
    int deleteByPrimaryKey(SecurityResourceRoleEntity key);

    int insert(SecurityResourceRoleEntity record);

    int insertSelective(SecurityResourceRoleEntity record);

    List<SecurityResourceRoleEntity> selectAllRoleIdbyResId(Long rescId);
}