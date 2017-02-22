package com.xigeng.metroproject.model;

/**
 * Created by free on 2016/11/21.
 */

public class Result
{
    Integer status;
    String desc;

    public Result(Integer status, String desc)
    {
        this.status = status;
        this.desc = desc;
    }

    public Integer getStatus()
    {
        return status;
    }

    public void setStatus(Integer status)
    {
        this.status = status;
    }

    public String getDesc()
    {
        return desc;
    }

    public void setDesc(String desc)
    {
        this.desc = desc;
    }
}