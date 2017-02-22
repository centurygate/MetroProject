package com.xigeng.metroproject.model;

/**
 * Created by Administrator on 2016/11/7.
 */
public class SheetItem {

    private Integer id;

    private String item;

    private String department;

    private String facility;

    private String time;

    private String state;


    public SheetItem(){}

    public SheetItem(String item, String department, String facility, String time, String state){
        this.item = item;
        this.department = department;
        this.facility = facility;
        this.time = time;
        this.state = state;
    }


    @Override
    public String toString() {
        return "SheetItem{" +
                "id=" + id +
                ", item='" + item + "\'" +
                ", department='" + department + "\'" +
                ", facility='" + facility + "\'" +
                ", time='" + time + "\'" +
                ", state='" + state + "\'" +
                '}';
    }


    public Integer getid(){
        return id;
    }
    public void setid(Integer id){
        this.id = id;
    }


    public String getItem(){
        return item;
    }
    public void setItem(String item){
        this.item = item;
    }


    public String getDepartment(){ return department; }
    public void setDepartment(String department){
        this.department = department;
    }


    public String getFacility(){ return facility; }
    public void setFacility(String facility){
        this.facility = facility;
    }


    public String getTime(){ return time; }
    public void setTime(String time){
        this.time = time;
    }


    public String getState(){ return state; }
    public void setState(String state){
        this.state = state;
    }

}
