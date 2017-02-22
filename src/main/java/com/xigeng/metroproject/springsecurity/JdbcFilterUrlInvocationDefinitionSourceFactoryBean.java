package com.xigeng.metroproject.springsecurity;



import com.xigeng.metroproject.log.SystemLog;
import org.springframework.beans.factory.FactoryBean;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.jdbc.object.MappingSqlQuery;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.access.intercept.DefaultFilterInvocationSecurityMetadataSource;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.security.web.util.matcher.RequestMatcher;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by free on 2016/11/18.
 */
public class JdbcFilterUrlInvocationDefinitionSourceFactoryBean
        extends JdbcDaoSupport implements FactoryBean {
    private String resourceQuery;

    public boolean isSingleton() {
        return true;
    }

    public Class getObjectType() {
        return FilterInvocationSecurityMetadataSource.class;
    }

    public Object getObject() {
        return new DefaultFilterInvocationSecurityMetadataSource(this.buildRequestMap());
    }

    protected Map<String, String> findResources() {
        ResourceMapping resourceMapping = new ResourceMapping(getDataSource(), resourceQuery);

        Map<String, String> resourceMap = new LinkedHashMap<String, String>();

        for (Resource resource : (List<Resource>) resourceMapping.execute()) {
            String url = resource.getUrl();
            String role = resource.getRole();

            if (resourceMap.containsKey(url)) {
                String value = resourceMap.get(url);
                resourceMap.put(url, value + "," + role);
            } else {
                resourceMap.put(url, role);
            }
        }
        SystemLog.log(resourceMap);
        return resourceMap;
    }

    protected LinkedHashMap<RequestMatcher, Collection<ConfigAttribute>> buildRequestMap() {
        LinkedHashMap<RequestMatcher, Collection<ConfigAttribute>> requestMap =
                null;
        requestMap = new LinkedHashMap<RequestMatcher, Collection<ConfigAttribute>>();


        Map<String, String> resourceMap = this.findResources();

        for (Map.Entry<String, String> entry : resourceMap.entrySet()) {
            String key = entry.getKey();
            requestMap.put(new AntPathRequestMatcher(key), SecurityConfig.createListFromCommaDelimitedString(entry.getValue()));
        }

        return requestMap;
    }

    public void setResourceQuery(String resourceQuery) {
        this.resourceQuery = resourceQuery;
    }

    private class Resource {
        private String url;
        private String role;

        public Resource(String url, String role) {
            this.url = url;
            this.role = role;
        }

        public String getUrl() {
            return url;
        }

        public String getRole() {
            return role;
        }
    }

    private class ResourceMapping extends MappingSqlQuery {
        protected ResourceMapping(DataSource dataSource,
                                  String resourceQuery) {
            super(dataSource, resourceQuery);
            compile();
        }

        protected Object mapRow(ResultSet rs, int rownum)
                throws SQLException {
            String url = rs.getString(1);
            String role = rs.getString(2);
            Resource resource = new Resource(url, role);

            return resource;
        }
    }
}