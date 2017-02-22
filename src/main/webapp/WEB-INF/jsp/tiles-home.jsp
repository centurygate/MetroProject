<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/8
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="col-lg-10 col-lg-offset-2 main"  style="margin-top: 50px;">
    <div class="row" id="contentcrumb">
        <ol class="breadcrumb breadbottom">
            <li><a href="#">
                <svg class="glyph stroked home">
                    <use xlink:href="#stroked-home"></use>
                </svg>
            </a></li>
            <li class="active">首页</li>
        </ol>
    </div><!--/.row-->
    <hr class="hrtop"/> <!--分割横线-->

    <div class="row"> <!--/.row 居中放置欢迎图片-->
        <div class="center-block">
            <img src="${pageContext.request.contextPath}/static/image/backgnd.png">
        </div>
    </div>
</div><!--/.main-->


<%--script脚本--%>
<script src="${pageContext.request.contextPath}/static/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>

<!--Icons图标-->
<script src="${pageContext.request.contextPath}/static/js/lumino.glyphs.js"></script>

<%--全局自定义js文件--%>
<script src="${pageContext.request.contextPath}/static/js/global-define.js"></script>

<%--当前模块自己的js文件--%>
<script src="${pageContext.request.contextPath}/static/js/module-home.js"></script>