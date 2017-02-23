<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>地铁监测系统</title>

    <!--Bootstrap系统-->
    <link href="${pageContext.request.contextPath}/static/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap-theme.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap-select.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/css/BootSideMenu.css" rel="stylesheet"/>

    <link href="${pageContext.request.contextPath}/static/css/jquery-confirm.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/static/css/lobibox.min.css" rel="stylesheet">

    <link href="${pageContext.request.contextPath}/static/css/styles.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/css/font-awesome.css" rel="stylesheet"/>

    <link href="${pageContext.request.contextPath}/static/css/project-main.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/css/3dimension.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/css/asset-main.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/css/realtimecharts.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/css/UpDownBootSideMenu.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/static/css/tiles-sheet.css" rel="stylesheet">

</head>

<body>

<%--规范样式-修改时连同个模块一起修改--%>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">

    <tiles:insertAttribute name="header" />

</nav>


<%--规范样式-修改时连同个模块一起修改--%>
<div class="col-lg-2 sidebar">

    <tiles:insertAttribute name="menu" />

</div><!--/.sidebar-->


<%--模块内容区域--%>
<tiles:insertAttribute name="body" />


</body>

</html>
