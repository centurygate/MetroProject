package com.xigeng.metroproject.model;

/**
 * Created by free on 2016/11/28.
 */
public  class Resource {
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    private Long id;
    private String res;
    private String restype;

    public Resource(Long id,String url, String role) {
        this.id = id;
        this.res = url;
        this.restype = role;
    }

    public String getRes() {
        return res;
    }

    public String getRestype() {
        return restype;
    }

    @Override
    public String toString() {
        return "Resource{" +
                "id=" + id +
                ", res='" + res + '\'' +
                ", restype='" + restype + '\'' +
                '}';
    }

//
    @Override
    public int hashCode() {
        return this.id.intValue();
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == this)
        {
            return true;
        }
        if(obj.getClass() == this.getClass())
        {
            Resource tmpres = (Resource)obj;
            return this.id.equals(tmpres.getId());
        }
        return false;
    }
}