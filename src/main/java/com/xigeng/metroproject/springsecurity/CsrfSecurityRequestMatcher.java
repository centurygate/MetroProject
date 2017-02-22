package com.xigeng.metroproject.springsecurity;

/**
 * Created by free on 16-11-17.
 */


import com.xigeng.metroproject.log.SystemLog;
import org.springframework.security.web.util.matcher.RequestMatcher;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.regex.Pattern;

public class CsrfSecurityRequestMatcher implements RequestMatcher
{
	private Pattern allowedMethods = Pattern
			.compile("^(GET|HEAD|TRACE|OPTIONS)$");

	public boolean matches(HttpServletRequest request)
	{
//		SystemLog.log("This request:"+request.getServletPath());
		if (execludeUrls != null && execludeUrls.size() > 0)
		{
			String servletPath = request.getServletPath();
			for (String url : execludeUrls)
			{
				if (servletPath.contains(url))
				{
					SystemLog.log("##################################################");
					SystemLog.log("Allow this request:"+servletPath);
					return false;
				}
			}
		}
		return !allowedMethods.matcher(request.getMethod()).matches();
	}

	/**
	 * 需要排除的url列表
	 */
	private List<String> execludeUrls;

	public List<String> getExecludeUrls()
	{
		return execludeUrls;
	}

	public void setExecludeUrls(List<String> execludeUrls)
	{
		this.execludeUrls = execludeUrls;
	}
}