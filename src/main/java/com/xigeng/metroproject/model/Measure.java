package com.xigeng.metroproject.model;

/**
 * Created by Administrator on 2016/12/16.
 */
public class Measure extends MeasureKey {

//    private String assetname;

    private Double value;

    private Double positionX;

    private Double positionY;


/*    public String getAssetname(){ return assetname; }

    public void setAssetname(String assetname){ this.assetname = assetname; }*/


    public Double getValue() {
        return value;
    }

    public void setValue(Double value) {
        this.value = value;
    }


    public Double getPositionX(){ return positionX; }

    public void setPositionX(Double positionX){ this.positionX = positionX; }


    public Double getPositionY(){ return positionY; }

    public void setPositionY(Double positionY){ this.positionY = positionY; }


    @Override
    public String toString()
    {
        return "Measure{" +
                "value=" + value +
                "} " + super.toString();
    }
}
