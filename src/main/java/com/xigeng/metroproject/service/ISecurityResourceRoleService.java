package com.xigeng.metroproject.service;

import com.xigeng.metroproject.model.SecurityResourceRoleEntity;

import java.util.List;

/**
 * Created by free on 11/30/16.
 */
public interface ISecurityResourceRoleService {
    List<SecurityResourceRoleEntity> selectAllRoleIdbyResId(Long rescId);
}
