<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/8
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="baidu-fullscreen">

    <div class="row" id="contentcrumb">
        <ol class="breadcrumb breadbottom">
            <li><a href="#">
                <svg class="glyph stroked home">
                    <use xlink:href="#stroked-desktop"></use>
                </svg>
            </a></li>
            <li class="active">三维展示</li>

            <%--右侧功能菜单--地下模式--%>
            <div class="menu-item" id="menu-underground">
                <a href="#">地下模式</a>
            </div>

            <%--右侧功能菜单--区域定位--%>
            <div class="menu-item" id="menu-position">
                <a href="#">区域定位</a>
            </div>
        </ol>
    </div><!--/.row-->
    <hr class="hrtop"/> <!--分割横线-->


    <%--三维Skyline展示窗口--%>
    <div id="skylinewindow" style="width: 100%; height: 95%; position: absolute; bottom: 0; right: 0; left: 0;">
        <object id="TE3DWindow" classid="clsid:3a4f9192-65a8-11d5-85c1-0001023952c1" style="width: 100%;height: 100%;"></object>
        <object id="sgworld" classid="CLSID:3a4f9199-65a8-11d5-85c1-0001023952c1" style="visibility: hidden;height: 0;"></object>
    </div>

</div>


<%--引入脚本文件--%>
<%--script脚本--%>
<script src="${pageContext.request.contextPath}/static/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>

<!--Icons图标-->
<script src="${pageContext.request.contextPath}/static/js/lumino.glyphs.js"></script>

<%--全局自定义js文件--%>
<script src="${pageContext.request.contextPath}/static/js/global-define.js"></script>

<%--websocket脚本--%>
<script src="${pageContext.request.contextPath}/static/js/sockjs.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/stomp.min.js"></script>

<%--模块自己的js文件--%>
<script src="${pageContext.request.contextPath}/static/js/module-3dimension.js"></script>