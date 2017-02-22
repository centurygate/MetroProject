package com.xigeng.metroproject.model;

public class SecurityUserRoleEntity {
    private Long userId;

    public SecurityUserRoleEntity() {
    }

    public SecurityUserRoleEntity(Long userId, Long roleId) {
        this.userId = userId;
        this.roleId = roleId;
    }

    private Long roleId;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }
}