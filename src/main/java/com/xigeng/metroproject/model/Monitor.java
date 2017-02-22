package com.xigeng.metroproject.model;

/**
 * Created by Administrator on 2016/11/8.
 */
public class Monitor {

    private Integer id;

    private String name;

    private Integer state;

    private Double positionx;

    private Double positiony;


    @Override
    public String toString() {
        return "Monitor{" +
                "id=" + id +
                ", name='" + name + "\'" +
                ", state=" + state +
                ", positionx=" + positionx +
                ", positiony=" + positiony +
                '}';
    }

    public Integer getId(){ return id; }
    public void setId(Integer id){
        this.id = id;
    }

    public String getName(){ return name; }
    public void setName(String name){
        this.name = name;
    }

    public Integer getState(){ return state; }
    public void setState(Integer state){
        this.state = state;
    }

    public Double getPositionx(){ return positionx; }
    public void setPositionx(Double positionx){
        this.positionx = positionx;
    }

    public Double getPositiony(){ return positiony; }
    public void setPositiony(Double positiony){
        this.positiony = positiony;
    }
}
