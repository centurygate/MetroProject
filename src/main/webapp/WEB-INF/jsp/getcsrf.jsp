<%--
  Created by IntelliJ IDEA.
  User: free
  Date: 16-11-16
  Time: 下午2:33
  To change this template use File | Settings | File Templates.
--%>
<%@page language="java" contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <title>CSRF</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/doinnerchanuth" method="post">
    <%--<input type="text" id="username" name="username"/>--%>
    <%--<input type="text" id="delauth" name="delauth"/>--%>
    <%--<input type="text" id="addauth" name="addauth"/>--%>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
    <%--<input type="submit" value="Change">--%>
</form>
</body>
</html>