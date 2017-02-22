package com.xigeng.metroproject.service;

import com.xigeng.metroproject.model.AlarmItem;

import java.util.List;

/**
 * Created by Administrator on 2016/12/1.
 */
public interface IAlarmService {

    int addAlarmItem(AlarmItem item);

    List<AlarmItem> selectAllItemList();

    void deleteItem(String alarmname);
}
