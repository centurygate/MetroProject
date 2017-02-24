package com.xigeng.metroproject.converter;

import org.springframework.http.MediaType;
import org.springframework.http.converter.StringHttpMessageConverter;

import java.nio.charset.Charset;

/**
 * Created by free on 2017/2/24.
 */
public class MyStringHttpMessageConverter extends StringHttpMessageConverter {
    private static final MediaType utf8 = new MediaType("text", "plain", Charset.forName("UTF-8"));

    @Override
    protected MediaType getDefaultContentType(String dumy) {
        System.out.println("===============================================");
        System.out.println("=====================protected MediaType getDefaultContentType(String dumy)==========================");
        System.out.println("===============================================");

        return utf8;
    }
}
