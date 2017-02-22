package com.xigeng.metroproject.service;

import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.xigeng.metroproject.log.SystemLog;
import com.xigeng.metroproject.model.User;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by free on 2016/11/21.
 */

@Service
public class BusinessServiceImp implements IBusinessService {

    public List<User> getUser(String userinfo) {
        List<User> userList = null;
        ObjectMapper mapper = new ObjectMapper();
        JavaType javaType = mapper.getTypeFactory().constructParametricType(ArrayList.class, User.class);
        try
        {
            userList =mapper.readValue(userinfo,javaType);
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
        return userList;
    }

    public double getValue(String val){

        return Double.parseDouble(val);
    }

    public void SecurityMethodTest() {
        SystemLog.log("Enter SecurityMethodTest");
    }
}
