<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/8
  Time: 16:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="col-lg-10 col-lg-offset-2 main">
    <div class="row" id="contentcrumb">
        <ol class="breadcrumb breadbottom">
            <li><a href="#">
                <svg class="glyph stroked table">
                    <use xlink:href="#stroked-table"></use>
                </svg>
            </a></li>
            <li class="active">统计分析</li>
        </ol>
    </div><!--/.row-->
    <hr class="hrtop"/> <!--分割横线-->


    <div class="row">
        <div class="col-lg-12">

            <iframe id="reportFrame" src="http://192.168.1.105:1234/WebReport/ReportServer?reportlet=SegmentInfo.cpt&__bypagesize__=false" frameborder="0" style="width: 100%; height: 850px;"></iframe>
        </div>
    </div>
</div>


<!--javascript 脚本-->
<script src="${pageContext.request.contextPath}/static/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>

<!--Icons图标-->
<script src="${pageContext.request.contextPath}/static/js/lumino.glyphs.js"></script>

<%--全局自定义js文件--%>
<script src="${pageContext.request.contextPath}/static/js/global-define.js"></script>

<%--模块自己的js文件--%>
<script src="${pageContext.request.contextPath}/static/js/module-analysis.js"></script>