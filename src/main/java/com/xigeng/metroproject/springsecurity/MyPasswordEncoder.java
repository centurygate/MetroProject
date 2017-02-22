package com.xigeng.metroproject.springsecurity;


import com.xigeng.metroproject.log.SystemLog;
import org.springframework.security.authentication.encoding.PasswordEncoder;
import org.springframework.stereotype.Component;


/**
 * Created by free on 2016/11/19.
 */
@Component("passwordEncoder")
public class MyPasswordEncoder implements PasswordEncoder
{
    public MyPasswordEncoder() {
        super();
    }

    public String encodePassword(String rawPass, Object salt) {
        SystemLog.log("++++++++++++++++++++++++++++++++++++++++++++++++++++");
        SystemLog.log("rawPass ="+rawPass+" salt = "+salt);
        SystemLog.log("++++++++++++++++++++++++++++++++++++++++++++++++++++");
//        String mergestr = "admin"+rawPass;
        String mergestr = salt+rawPass;
        return MyMd5.stringMD5(mergestr);
    }

    public boolean isPasswordValid(String encPass, String rawPass, Object salt) {
        String pass1 = "" + encPass;
        String pass2 = this.encodePassword(rawPass, salt);
        return MyPasswordEncoderUtils.equals(pass1, pass2);
    }
}