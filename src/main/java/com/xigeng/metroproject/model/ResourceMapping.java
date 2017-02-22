package com.xigeng.metroproject.model;

import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.object.MappingSqlQuery;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

/**
 * Created by free on 2016/11/28.
 */
public class ResourceMapping extends MappingSqlQuery {
    public ResourceMapping(DataSource dataSource,
                              String resourceQuery) {
        super(dataSource, resourceQuery);
        this.declareParameter(new SqlParameter(Types.INTEGER)); //sql中注入一个参数
        compile();
    }

    protected Object mapRow(ResultSet rs, int rownum)
            throws SQLException {

        Long id = rs.getLong(1);
        String url = rs.getString(2);
        String role = rs.getString(3);
        Resource resource = new Resource(id,url, role);
        return resource;
    }
}