package com.xigeng.metroproject.service;

import com.xigeng.metroproject.dao.IAlarmDao;
import com.xigeng.metroproject.model.AlarmItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2016/12/1.
 */
@Service("alarmService")
public class AlarmServiceImp implements IAlarmService {

    @Autowired
    IAlarmDao alarmDao;


    public int addAlarmItem(AlarmItem item){ return alarmDao.insert(item); }

    public List<AlarmItem> selectAllItemList(){ return alarmDao.selectAllItemList(); }

    public void deleteItem(String alarmname){ this.alarmDao.dropItem(alarmname);}
}
