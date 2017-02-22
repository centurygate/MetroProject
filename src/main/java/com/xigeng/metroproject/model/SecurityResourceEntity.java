package com.xigeng.metroproject.model;

public class SecurityResourceEntity {
    private Long id;

    private String name;

    private String resType;

    private String resString;

    private Integer priority;

    private String desc;

    private Boolean bsinglerole;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getResType() {
        return resType;
    }

    public void setResType(String resType) {
        this.resType = resType == null ? null : resType.trim();
    }

    public String getResString() {
        return resString;
    }

    public void setResString(String resString) {
        this.resString = resString == null ? null : resString.trim();
    }

    public Integer getPriority() {
        return priority;
    }

    public void setPriority(Integer priority) {
        this.priority = priority;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc == null ? null : desc.trim();
    }

    public Boolean getBsinglerole() {
        return bsinglerole;
    }

    public void setBsinglerole(Boolean bsinglerole) {
        this.bsinglerole = bsinglerole;
    }
}