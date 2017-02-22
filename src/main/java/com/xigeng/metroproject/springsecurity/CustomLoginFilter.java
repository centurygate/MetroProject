package com.xigeng.metroproject.springsecurity;

import com.xigeng.metroproject.log.SystemLog;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by free on 16-11-17.
 */
public class CustomLoginFilter extends UsernamePasswordAuthenticationFilter
{

	public Authentication attemptAuthentication(HttpServletRequest request,
	                                            HttpServletResponse response) throws AuthenticationException
	{

		 if (!request.getMethod().equals("POST")) {
			 SystemLog.log("Post Method!");
		 throw new AuthenticationServiceException(
		 "Authentication method not supported: "
		 + request.getMethod());
		 }
		SystemLog.log("GGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGGG");
		String username = obtainUsername(request).toUpperCase().trim();
		String password = obtainPassword(request);
		if(StringUtils.isEmpty(username))
		{
			SystemLog.log("username is empty");
		}
		else
		{
			SystemLog.log("In CustomLoginFilter: name = "+username);
		}
		if(StringUtils.isEmpty(password))
		{
			SystemLog.log("password is empty");
		}
		else
		{
			SystemLog.log("In CustomLoginFilter: password = "+password);
		}

		UsernamePasswordAuthenticationToken authRequest = new UsernamePasswordAuthenticationToken(
				username, password);

		setDetails(request, authRequest);
		return this.getAuthenticationManager().authenticate(authRequest);
	}

}
