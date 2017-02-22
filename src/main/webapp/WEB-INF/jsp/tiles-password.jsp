<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/8
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="col-lg-10 col-lg-offset-2 main">

    <div class="row" id="contentcrumb">
        <ol class="breadcrumb breadbottom">
            <li><a href="#">
                <svg class="glyph stroked lock">
                    <use xlink:href="#stroked-lock"/>
                </svg>
            </a></li>
            <li class="active">密码修改</li>
        </ol>
    </div><!--/.row-->
    <hr class="hrtop"/> <!--分割横线-->

    <div class="row"> <!--/.row 居中放置欢迎图片-->
        <div class="col-lg-4 col-lg-offset-4">
            <form action="${pageContext.request.contextPath}/changepasswordaction" method="post">
                <div class="input-group input-sm">
                    <label class="input-group-addon" for="originPassword">原始密码： <i class="fa fa-lock"></i></label>
                    <input type="password" class="form-control" id="originPassword" name="originPassword"
                           placeholder="原始密码" required>
                </div>

                <div class="input-group input-sm">
                    <label class="input-group-addon" for="newPassword">新  密 码&nbsp;： <i class="fa fa-lock"></i></label>
                    <input type="password" class="form-control" id="newPassword" name="newPassword"
                           placeholder="新密码" required>
                </div>

                <div class="input-group input-sm">
                    <label class="input-group-addon" for="confirmPassword">确认密码： <i class="fa fa-lock"></i></label>
                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword"
                           placeholder="确认新密码" required>
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>

                <div class="form-actions">
                    <input type="submit" class="btn btn-block btn-primary btn-default" value="修改密码">
                </div>
            </form>
        </div>
    </div>

</div>


<script src="${pageContext.request.contextPath}/static/js/jquery-1.11.1.min.js"></script>
<%--<script src="${pageContext.request.contextPath}/static/js/jquery-ui.min.js"></script>--%>

<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>

<!--Icons图标-->
<script src="${pageContext.request.contextPath}/static/js/lumino.glyphs.js"></script>

<%--全局自定义js文件--%>
<script src="${pageContext.request.contextPath}/static/js/global-define.js"></script>

<%--模块自己的js文件--%>
<script src="${pageContext.request.contextPath}/static/js/module-password.js"></script>