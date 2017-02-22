<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<ul class="nav menu">
    <li id="menu-home">
        <a href="${pageContext.request.contextPath}/goindex.action"><svg class="glyph stroked home"><use xlink:href="#stroked-home"></use></svg>首页</a>
    </li>
    <li id="menu-3dimension">
        <a href="${pageContext.request.contextPath}/godimension.action"><svg class="glyph stroked desktop"><use xlink:href="#stroked-desktop"/></svg>三维展示</a>
    </li>
    <li  id="menu-monitor">
        <a href="${pageContext.request.contextPath}/gomonitor.action"><svg class="glyph stroked calendar"><use xlink:href="#stroked-calendar"></use></svg>监测区间</a>
    </li>
    <li  id="menu-chart">
        <a href="${pageContext.request.contextPath}/gochart.action"><svg class="glyph stroked line-graph"><use xlink:href="#stroked-line-graph"></use></svg>实时曲线</a>
    </li>
    <li  id="menu-sheet">
        <a href="${pageContext.request.contextPath}/gosheet.action"><svg class="glyph stroked table"><use xlink:href="#stroked-table"></use></svg>总览报表</a>
    </li>
<%--    <li  id="menu-analysis">
        <a href="${pageContext.request.contextPath}/goanalysis.action"><svg class="glyph stroked table"><use xlink:href="#stroked-table"></use></svg>统计分析</a>
    </li>--%>
    <li  id="menu-password">
        <a href="${pageContext.request.contextPath}/gopassword.action"><svg class="glyph stroked lock"><use xlink:href="#stroked-lock"/></svg>密码更改</a>
    </li>
    <sec:authorize access="hasAnyAuthority('ROLE_ADMIN')">
        <li  id="menu-authority">
            <a href="${pageContext.request.contextPath}/goauthority.action"><svg class="glyph stroked male user "><use xlink:href="#stroked-male-user"/></svg>用户管理</a>
        </li>
    </sec:authorize>
</ul>