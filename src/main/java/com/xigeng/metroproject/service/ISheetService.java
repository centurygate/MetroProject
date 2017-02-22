package com.xigeng.metroproject.service;

import com.xigeng.metroproject.model.SheetItem;

import java.util.List;

/**
 * Created by Administrator on 2016/11/7.
 */
public interface ISheetService {

    int addSheetItem(SheetItem user);

    SheetItem getSheetById(Integer id);

    List<SheetItem> selectAllItemList();

    void updateItem(SheetItem item);

    void deleteItem(String sheetname);
}
