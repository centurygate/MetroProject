package com.xigeng.metroproject.springsecurity;

import com.xigeng.metroproject.log.SystemLog;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by free on 16-11-17.
 */
public class CustomLoginHandler extends
		SavedRequestAwareAuthenticationSuccessHandler
{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request,
	                                    HttpServletResponse response, Authentication authentication)
			throws ServletException, IOException
	{
		super.onAuthenticationSuccess(request, response, authentication);

		//这里可以追加开发人员自己的额外处理
		SystemLog.log("CustomLoginHandler.onAuthenticationSuccess() is called!");
	}

}