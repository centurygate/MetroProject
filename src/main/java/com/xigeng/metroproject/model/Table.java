package com.xigeng.metroproject.model;

/**
 * Created by Administrator on 2017/2/18.
 */
public class Table {

    private Integer index;

    private Double value;

    @Override
    public String toString() {
        return "Table{" +
                "idx=" + index +
                ", value='" + value +
                '}';
    }

    public Integer getIndex(){ return index; }
    public void setIndex(Integer index){
        this.index = index;
    }

    public Double getValue(){ return value; }
    public void setValue(Double value){
        this.value = value;
    }
}
