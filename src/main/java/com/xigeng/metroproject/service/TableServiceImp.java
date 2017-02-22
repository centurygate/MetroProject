package com.xigeng.metroproject.service;

import com.xigeng.metroproject.dao.ITableDao;
import com.xigeng.metroproject.model.Table;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/2/18.
 */
@Service("tableService")
public class TableServiceImp implements ITableService {

    @Autowired
    private ITableDao tableDao;

    public List<Table> selectTable1(){ return tableDao.selectTable1();}

    public List<Table> selectTable2(){ return tableDao.selectTable2();}

    public List<Table> selectTable3(){ return tableDao.selectTable3();}

    public List<Table> selectTable4(){ return tableDao.selectTable4();}

    public List<Table> selectTable5(){ return tableDao.selectTable5();}

    public List<Table> selectTable6(){ return tableDao.selectTable6();}

    public List<Table> selectTable7(){ return tableDao.selectTable7();}

    public List<Table> selectTable8(){ return tableDao.selectTable8();}

    public List<Table> selectTable9(){ return tableDao.selectTable9();}

    public List<Table> selectTable10(){ return tableDao.selectTable10();}
}
