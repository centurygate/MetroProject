package com.xigeng.metroproject.model;

import java.util.Date;

/**
 * Created by Administrator on 2016/12/16.
 */
public class MeasureKey {

    private Date recordtime;

    private String devaddr;

    public Date getRecordtime() {
        return recordtime;
    }

    public void setRecordtime(Date recordtime) {
        this.recordtime = recordtime;
    }

    public String getDevaddr() {
        return devaddr;
    }

    public void setDevaddr(String devaddr) {
        this.devaddr = devaddr == null ? null : devaddr.trim();
    }

    @Override
    public String toString() {
        return "MeasureKey{" +
                "recordtime=" + recordtime +
                ", devaddr='" + devaddr + '\'' +
                '}';
    }
}
