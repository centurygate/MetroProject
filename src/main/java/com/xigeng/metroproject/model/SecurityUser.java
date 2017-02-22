package com.xigeng.metroproject.model;

import org.springframework.security.core.GrantedAuthority;

import java.util.Collection;

/**
 * Created by free on 2016/11/22.
 */
public class SecurityUser extends  org.springframework.security.core.userdetails.User {
    public SecurityUser(String username, String password, Collection<? extends GrantedAuthority> authorities, String email, String phone, String address) {
        super(username, password, authorities);
        this.email = email;
        this.phone = phone;
        this.address = address;
    }

    public SecurityUser(String username, String password, boolean enabled, boolean accountNonExpired, boolean credentialsNonExpired, boolean accountNonLocked, Collection<? extends GrantedAuthority> authorities, String email, String phone, String address) {
        super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
        this.email = email;
        this.phone = phone;
        this.address = address;
    }

    private  String email;
    private  String phone;
    private  String address;

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

//    public boolean equals(Object rhs) {
//        if (!(rhs instanceof SecurityUser) || (rhs == null)) {
//            return false;
//        }
//
//
//        if (super.equals(rhs)) {
//            SecurityUser user = (SecurityUser) rhs;
//
//            // We rely on constructor to guarantee any User has non-null and >0
//            // authorities
//            if (user.getAuthorities().size() != this.getAuthorities().size()) {
//                return false;
//            }
//            while (this.getAuthorities().iterator().hasNext()) {
//                if (!this.getAuthorities().iterator().next().equals(user.getAuthorities().iterator().next())) {
//                    return false;
//                }
//            }
//
//            // We rely on constructor to guarantee non-null username and password
//            return (this.getPassword().equals(user.getPassword())
//                    && this.getUsername().equals(user.getUsername())
//                    && (this.isAccountNonExpired() == user.isAccountNonExpired())
//                    && (this.isAccountNonLocked() == user.isAccountNonLocked())
//                    && (this.isCredentialsNonExpired() == user.isCredentialsNonExpired())
//                    && (this.isEnabled() == user.isEnabled())
//                    && (this.email.equals(user.getEmail()))
//                    && (this.phone.equals(user.getPhone()))
//                    && (this.address.equals(user.getAddress()))
//                    );
//        }
//        return  false;
//    }
//    public int hashCode() {
//        int code = 9792;
//
//        while (this.getAuthorities().iterator().hasNext())
//        {
//            code = code*(this.getAuthorities().iterator().next().hashCode()%7);
//        }
//        if (this.getPassword() != null) {
//            code = code * (this.getPassword().hashCode() % 7);
//        }
//
//        if (this.getUsername() != null) {
//            code = code * (this.getUsername().hashCode() % 7);
//        }
//
//        if (this.isAccountNonExpired()) {
//            code = code * -2;
//        }
//
//        if (this.isAccountNonLocked()) {
//            code = code * -3;
//        }
//
//        if (this.isCredentialsNonExpired()) {
//            code = code * -5;
//        }
//
//        if (this.isEnabled()) {
//            code = code * -7;
//        }
//        if (this.email != null) {
//            code *= -11;
//        }
//        return code;
//    }

    @Override
    public String toString() {
        return "SecurityUser{" +super.toString()+
                "email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}
