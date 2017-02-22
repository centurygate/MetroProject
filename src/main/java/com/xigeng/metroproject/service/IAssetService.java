package com.xigeng.metroproject.service;

import com.xigeng.metroproject.model.Asset;

import java.util.List;

/**
 * Created by Administrator on 2016/11/9.
 */
public interface IAssetService {

    List<Asset> selectAllAssetList();

    List<Asset> selectAssetByType(Integer type);
}
