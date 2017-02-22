package com.xigeng.metroproject.service;

import com.xigeng.metroproject.dao.ISheetDao;
import com.xigeng.metroproject.model.SheetItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2016/11/7.
 */
@Service("sheetService")
public class SheetServiceImp implements ISheetService {

    @Autowired
    private ISheetDao sheetDao;


    public int addSheetItem(SheetItem item){
        return this.sheetDao.insert(item);
    }


    public SheetItem getSheetById(Integer id){
        return this.sheetDao.selectByPrimaryKey(id);
    }


    public List<SheetItem> selectAllItemList(){ return this.sheetDao.selectAllItemList(); }


    public void updateItem(SheetItem item){
        this.sheetDao.updateItem(item);
    }


    public void deleteItem(String sheetname){
        this.sheetDao.dropItem(sheetname);
    }
}
