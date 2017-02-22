package com.xigeng.metroproject.service;



import com.xigeng.metroproject.model.SecurityResourceEntity;

import java.util.List;

/**
 * Created by free on 2016/11/27.
 */
public interface SecurityResourceService {
    List<SecurityResourceEntity> selectAllSecurityResource();
}
