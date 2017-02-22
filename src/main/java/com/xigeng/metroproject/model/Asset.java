package com.xigeng.metroproject.model;

/**
 * Created by Administrator on 2016/11/9.
 */
public class Asset {

    private Integer id;

    private String name;

    private Integer type;

    private Double positionx;

    private Double positiony;


    @Override
    public String toString() {
        return "Monitor{" +
                "id=" + id +
                ", name='" + name + "\'" +
                ", type=" + type +
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

    public Integer getType(){ return type; }
    public void setType(Integer type){
        this.type = type;
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
