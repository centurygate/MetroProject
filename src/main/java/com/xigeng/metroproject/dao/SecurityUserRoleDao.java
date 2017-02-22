package com.xigeng.metroproject.dao;


import com.xigeng.metroproject.model.SecurityUserRoleEntity;



public interface SecurityUserRoleDao {
    int deleteByPrimaryKey(SecurityUserRoleEntity key);

    int insert(SecurityUserRoleEntity record);

    int insertSelective(SecurityUserRoleEntity record);

}