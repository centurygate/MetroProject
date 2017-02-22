package com.xigeng.metroproject.springsecurity;

import com.xigeng.metroproject.log.SystemLog;
import com.xigeng.metroproject.model.SecurityUser;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.core.userdetails.jdbc.JdbcDaoImpl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by free on 2016/11/22.
 */
public class MyJdbcDaoImpl extends JdbcDaoImpl {

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        List<SecurityUser> users = customloadUsersByUsername(username);
        SystemLog.log(users);
        if (users.size() == 0) {
            logger.debug("Query returned no results for user '" + username + "'");

            throw new UsernameNotFoundException(messages.getMessage(
                    "JdbcDaoImpl.notFound", new Object[] { username },
                    "Username {0} not found"));
        }

        SecurityUser user = users.get(0); // contains no GrantedAuthority[]

        Set<GrantedAuthority> dbAuthsSet = new HashSet<GrantedAuthority>();

        if (getEnableAuthorities()) {
            SystemLog.log("Execute getEnableAuthorities");
            dbAuthsSet.addAll(loadUserAuthorities(user.getUsername()));
        }

        if (getEnableGroups()) {
            SystemLog.log("Execute getEnableAuthorities");
            dbAuthsSet.addAll(loadGroupAuthorities(user.getUsername()));
        }

        List<GrantedAuthority> dbAuths = new ArrayList<GrantedAuthority>(dbAuthsSet);

        addCustomAuthorities(user.getUsername(), dbAuths);

        if (dbAuths.size() == 0) {
            logger.debug("User '" + username
                    + "' has no authorities and will be treated as 'not found'");

            throw new UsernameNotFoundException(messages.getMessage(
                    "JdbcDaoImpl.noAuthority", new Object[] { username },
                    "User {0} has no GrantedAuthority"));
        }

        return createUserDetails(username, user, dbAuths);
    }


    protected UserDetails createUserDetails(String username, SecurityUser userFromUserQuery, List<GrantedAuthority> combinedAuthorities) {
        String returnUsername = userFromUserQuery.getUsername();

        if (!isUsernameBasedPrimaryKey()) {
            returnUsername = username;
        }
//        Collection<GrantedAuthority> authorities = userFromUserQuery.getAuthorities();
//        for (GrantedAuthority authority: combinedAuthorities)
//        {
//            authorities.add(authority);
//        }
        SystemLog.log("==========================================");
        SystemLog.log(combinedAuthorities);
        return new SecurityUser(returnUsername, userFromUserQuery.getPassword(),
                userFromUserQuery.isEnabled(), true, true, true, combinedAuthorities,userFromUserQuery.getEmail(),userFromUserQuery.getPhone(),
                userFromUserQuery.getAddress());

    }


    private List<SecurityUser> customloadUsersByUsername(String username) {
        return getJdbcTemplate().query(getUsersByUsernameQuery(), new String[] { username },
                new RowMapper<SecurityUser>() {
                    public SecurityUser mapRow(ResultSet rs, int rowNum)
                            throws SQLException {
                        String username = rs.getString(1);
                        String password = rs.getString(2);
                        boolean enabled = rs.getBoolean(3);
                        String email = rs.getString(4);
                        String phone = rs.getString(5);
                        String address = rs.getString(6);
                        return new SecurityUser(username, password, enabled, true, true, true,
                                AuthorityUtils.NO_AUTHORITIES,email,phone,address);
                    }
                });
    }
}
