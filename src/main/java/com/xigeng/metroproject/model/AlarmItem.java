package com.xigeng.metroproject.model;

/**
 * Created by Administrator on 2016/12/1.
 */
public class AlarmItem {

    private Integer id;

    private String itemid;

    private String device;

    private Double value;

    private String time;

    private String cause;



    public AlarmItem(){}

    public AlarmItem(Integer id, String itemid, String device, Double value, String time, String cause){
        this.id = id;
        this.itemid = itemid;
        this.device = device;
        this.value = value;
        this.time = time;
        this.cause = cause;
    }


    @Override
    public String toString(){
        return "alarm{" +
                "id =" + id +
                ", itemid ='" + itemid + "\'" +
                ", device ='" + device + "\'" +
                ", value =" + value +
                ", time ='" + time + "\'" +
                ", cause ='" + cause + "\'" +
                "}";
    }


    public Integer getId(){ return id; }
    public void setId(Integer id){
        this.id = id;
    }


    public String getItemid(){ return itemid; }
    public void setItemid(String itemid){
        this.itemid = itemid;
    }


    public String getDevice(){ return device; }
    public void setDevice(String device){
        this.device = device;
    }


    public Double getValue(){ return value; }
    public void setValue(Double value){
        this.value = value;
    }


    public String getTime(){ return time; }
    public void setTime(String time){
        this.time = time;
    }


    public String getCause(){ return cause; }
    public void setCause(String cause){
        this.cause = cause;
    }
}
