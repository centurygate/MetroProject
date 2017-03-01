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
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta charset="utf-8"/>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8">
    <meta name="description" content="User login page"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0"/>
    <title>登录/注册</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/font-awesome.css"/>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/jquery-confirm.min.css"/>
    <link rel="icon" href="${pageContext.request.contextPath}/static/image/metro.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/static/image/metro.ico" type="image/x-icon" />
    <link rel="bookmark" href="${pageContext.request.contextPath}/static/image/metro.ico" type="image/x-icon" />
    <script src="${pageContext.request.contextPath}/static/js/jquery-1.11.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/localization/messages_zh.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/js/jquery-confirm.min.js"></script>
</head>
<script type="text/javascript">
    $(document).ready(
        function () {
            $.validator.addMethod("checkMobile", function (value, element) {
                return (/^1[34578]\d{9}$/.test(value)) || (/^0\d{2,3}-?\d{7,8}$/.test(value));
            }, "请正确填写正确的手机号码或固定电话");
            $.validator.addMethod("english", function (value, element) {
                return this.optional(element) || (/^([a-zA-Z]+)$/.test(value));
            }, "只能输入英文字符");
            //check the validity of form
            $("#signupform").validate({
                    rules: {
                        phone: {checkMobile: true},
                        signupusername: {
                            english: true,
                            remote: {
                                type: "GET",
                                url: "checkUser",
                                data: {
                                    signupusername: function () {
                                        return $("#signupusername").val();
                                    }
                                }
                            }
                        },
                    },
                    messages: {
                        signupusername: {remote: $.validator.format("该用户名已被注册")},
                    },
                    errorPlacement: function (error, element) {
                        // console.log(element);
                        // console.log(error);
                        error.insertAfter(element.parent());
                    }
                }
            );
            $("#signinform").validate({
                rules: {
                    username: {english: true, minlength: 4, maxlength: 32},
                },
                errorPlacement: function (error, element) {
                    // console.log(element);
                    // console.log(error);
                    error.insertAfter(element.parent());
                }
            });
            $('#signin-href').click(function () {
                // alert("click #signin-tab");
                $('#signup-li').removeClass('active');
                $('#signup-tab').removeClass('active');
                $('#signin-li').addClass('active');
                $('#signin-tab').addClass('active');
            });
            $('#signup-href').click(function () {
                // alert("click #signup-tab");
                $('#signin-li').removeClass('active');
                $('#signin-tab').removeClass('active');
                $('#signup-li').addClass('active');
                $('#signup-tab').addClass('active');
            });
            $('#signupbtn').click(function () {
                console.log("params: " + $('#signupform').serialize());
                $.get("registerUser?" + $('#signupform').serialize(),
                    function (responsedata, responsestatus) {
                        console.log("responsedata: " + responsedata);
                        console.log("responsestatus: " + responsestatus);
                        var jsonObj = JSON.parse(responsedata);
                        console.log(jsonObj);
                        if (jsonObj['status'] == 1) {
                            $.alert({
                                title: '提示',
                                icon: 'glyphicon glyphicon-ok-sign',
                                animation: 'zoom',
                                closeAnimation: 'scale',
                                content: jsonObj['desc'],
                                autoClose: 'close|6000',
                                buttons: {
                                    close: {
                                        text: '六秒钟后切换到登录页面',
                                        btnClass: 'btn-success',
                                        action: function () {
                                            location.replace(location.pathname + location.search);
                                        }
                                    }
                                }
                            });
                        }
                        else if (jsonObj['status'] == 0) {
                            $.alert({
                                title: '注册失败',
                                icon: 'glyphicon glyphicon-remove-sign',
                                animation: 'zoom',
                                closeAnimation: 'scale',
                                content: jsonObj['desc'],
//                                autoClose: 'close|6000',
                                buttons: {
                                    close: {
                                        btnClass: 'btn-danger',
                                        action: function () {
                                        }
                                    }
                                }
                            });
                        }
                        else {
                            $.alert({
                                title: '异常错误',
                                icon: 'glyphicon glyphicon-warning-sign',
                                animation: 'zoom',
                                closeAnimation: 'scale',
                                content: jsonObj['desc'],
//                                autoClose: 'close|6000',
                                buttons: {

                                    close: {
                                        btnClass: 'btn-danger',
                                        action: function () {
                                        }
                                    }
                                }
                            });
                        }
                    }).error(function (xhr, errorText, errorType) {
                    $.alert({
                        title: '异常错误',
                        icon: 'glyphicon glyphicon-warning-sign',
                        animation: 'zoom',
                        closeAnimation: 'scale',
                        content: errorText + ':' + '请检查网络是否正常',
//                                autoClose: 'close|6000',
                        buttons: {

                            close: {
                                btnClass: 'btn-danger',
                                action: function () {
                                }
                            }
                        }
                    })
                });
            });
        });

</script>
<style>
    .error {
        color: red;
    }
</style>
</head>

<body>
<div class="container">
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <ul class="nav nav-tabs">
                <li id="signin-li" class="active"><a href="#signin-tab" id="signin-href">登录&nbsp;&nbsp;<i
                        class="ace-icon fa fa-key"></i></a></li>
                <li id="signup-li"><a href="#signup-tab" id="signup-href">注册&nbsp;&nbsp;<i
                        class="ace-icon fa fa-users"></i></a>
                </li>
            </ul>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
            <div>
                <div class="tab-content" id="signin-signup-tab">
                    <div class="tab-pane" id="signup-tab" style="padding-top: 5%;">
                        <br>
                        <form class="form col-xs-offset-1 col-xs-10 col-sm-6 col-sm-offset-3 col-md-offset-4 col-md-4 col-lg-offset-4 col-lg-4"
                              id="signupform">
                            <div class="input-group input-sm">
                                <label class="input-group-addon" for="signupusername"><i
                                        class="glyphicon glyphicon-user"></i></label>
                                <!-- <i class="glyphicon glyphicon-user"></i> -->
                                <input type="text" class="form-control" id="signupusername" name="signupusername"
                                       placeholder="用户名"
                                       minlength="4" maxlength="32" required/>
                            </div>
                            <div class="input-group input-sm">
                                <label class="input-group-addon" for="signuppassword"><i
                                        class="glyphicon glyphicon-lock"></i></label>
                                <input type="password" class="form-control" id="signuppassword" name="signuppassword"
                                       placeholder="密码" minlength="4" maxlength="32" required/>
                            </div>
                            <div class="input-group input-sm">
                                <label class="input-group-addon" for="confirmpassword"><i
                                        class="glyphicon glyphicon-lock"></i></label>
                                <input type="password" class="form-control" id="confirmpassword" name="confirmpassword"
                                       placeholder="确认密码" minlength="4" maxlength="32" equalTo="#signuppassword"
                                       required/>
                            </div>
                            <div class="input-group input-sm">
                                <label class="input-group-addon" for="phone"><i
                                        class="glyphicon glyphicon-earphone"></i></label>
                                <input type="text" class="form-control" id="phone" name="phone"
                                       placeholder="电话" required/>
                            </div>
                            <div class="input-group input-sm">
                                <label class="input-group-addon" for="email"><i
                                        class="glyphicon glyphicon-envelope"></i></label>
                                <input type="email" class="form-control" id="email" name="email"
                                       placeholder="邮件地址" required/>
                            </div>
                            <div class="input-group input-sm">
                                <label class="input-group-addon" for="address"><i
                                        class="glyphicon glyphicon-home"></i></label>
                                <input type="text" class="form-control" id="address" name="address" minlength="4"
                                       maxlength="64"
                                       placeholder="联系地址" required/>
                            </div>
                            <div class="form-group">
                                <button type="button" class="btn btn-success btn-block"
                                        style="height: 2.5em; margin-top: 0.5em;" id="signupbtn">注册
                                </button>
                            </div>
                        </form>
                    </div>


                    <div class="tab-pane active" id="signin-tab" style="padding-top: 5%;">
                        <br>
                        <form action="${pageContext.request.contextPath}/login" method="post"
                              class="form col-xs-offset-1 col-xs-10 col-sm-6 col-sm-offset-3 col-md-offset-4 col-md-4 col-lg-offset-4 col-lg-4"
                              id="signinform">
                            <c:if test="${param.error != null}">
                                <div class="alert alert-danger">
                                    <p style="font-size: 12px;">${param.error}</p>
                                </div>
                            </c:if>
                            <c:if test="${param.state != null}">
                                <div class="alert alert-danger">
                                    <p style="font-size: 12px;">${param.state}</p>
                                        <%--<p style="font-size: 16px;">${SPRING_SECURITY_LAST_EXCEPTION.message}</p>--%>
                                    <c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION }">
                                        <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>
                                    </c:if>
                                </div>
                            </c:if>
                            <c:if test="${param.changepwd != null}">
                                <div class="alert alert-danger">
                                    <p style="font-size: 12px;">${param.changepwd}</p>
                                        <%--<p style="font-size: 16px;">${SPRING_SECURITY_LAST_EXCEPTION.message}</p>--%>
                                    <c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION }">
                                        <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>
                                    </c:if>
                                </div>
                            </c:if>
                            <c:if test="${param.logout != null}">
                                <div class="alert alert-success">
                                    <p>You have been logged out successfully.</p>
                                </div>
                            </c:if>
                            <div class="input-group input-sm">
                                <label class="input-group-addon" for="username"><i class="glyphicon glyphicon-user"></i></label>
                                <input type="text" class="form-control" id="username" name="username"
                                       placeholder="用户名" minlength="4" maxlength="32" required/>
                            </div>
                            <div class="input-group input-sm">
                                <label class="input-group-addon" for="password"><i class="glyphicon glyphicon-lock"></i></label>
                                <input type="password" class="form-control" id="password" name="password"
                                       placeholder="密码" required/>
                            </div>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <div class="form-group">
                                <button type="submit" class="btn btn-success btn-block"
                                        style="height: 2.5em; margin-top: 0.5em;">登录&nbsp;&nbsp;
                                    <i class="glyphicon glyphicon-log-in"></i></button>
                                <%--<span><a href="newforgot.html">忘记密码</a></span>--%>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>