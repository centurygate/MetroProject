package com.xigeng.metroproject.springsecurity;

import org.springframework.security.web.authentication.logout.LogoutFilter;
import org.springframework.security.web.authentication.logout.LogoutHandler;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

/**
 * Created by free on 16-11-17.
 */
public class CustomLogoutFilter extends LogoutFilter
{
	public CustomLogoutFilter(String logoutSuccessUrl, LogoutHandler... handlers)
	{
		super(logoutSuccessUrl, handlers);
	}
	public CustomLogoutFilter(LogoutSuccessHandler logoutSuccessHandler, LogoutHandler... handlers)
	{
		super(logoutSuccessHandler, handlers);
	}
}
