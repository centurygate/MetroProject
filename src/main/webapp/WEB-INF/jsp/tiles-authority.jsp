<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/8
  Time: 16:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="col-lg-10 col-lg-offset-2 main">
    <div class="row" id="contentcrumb">
        <ol class="breadcrumb breadbottom">
            <li><a href="#">
                <svg class="glyph stroked male user">
                    <use xlink:href="#stroked-male-user"></use>
                </svg>
            </a></li>
            <li class="active">用户管理</li>
        </ol>
    </div><!--/.row-->
    <hr class="hrtop"/> <!--分割横线-->
    <div class="row">
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <ul class="nav nav-tabs">
                        <li id="authchg-li" class="active"><a href="#authchg-tab" id="authchg-href">用户权限更改&nbsp;&nbsp;<i
                                class="ace-icon fa fa-key"></i></a></li>
                        <li id="reguser-li"><a href="#reguser-tab" id="reguser-href">用户申请列表&nbsp;&nbsp;<i
                                class="ace-icon fa fa-users"></i></a>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <div class="tab-content" id="authchg-reguser-tab">
                        <div class="tab-pane active" id="authchg-tab">
                            <br>
                            <div class="col-lg-10 col-lg-offset-2 main">
                                <div>
                                    <label for="sel"> 用户:&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                    <select id="sel" class="selectpicker" data-live-search="true" title="-请选择用户-">
                                        <c:forEach items="${securityUserEntityList}" var="securityUser">
                                            <option value="${securityUser.id}">${securityUser.username}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <br>
                                <br>
                                <label for="authlist"> 权限列表:&nbsp;&nbsp;&nbsp;&nbsp;</label>
                                <div id="authlist">
                                    <div class="row">
                                        <c:forEach items="${securityResourceEntityList}" var="securityResource">
                                        <p class="col-lg-6"><input type="checkbox" name="userauthorities"
                                                                   value="${securityResource.id}"/>&nbsp;&nbsp;${securityResource.desc}
                                        <p>
                                            </c:forEach>
                                    </div>
                                </div>
                                <br/>
                                <div>
                                    <input type="button" value="提交更改" id="changeauthority" class="btn btn-primary"/>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="reguser-tab">
                            <br>

                            <%--<div class="col-lg-10 col-lg-offset-2 main">--%>
                            <form method="get" class="form-horizontal" role="form" id="queryform">
                                <fieldset>
                                    <%--<legend>查询</legend>--%>
                                    <%--<label for="startDate" class="col-md-2 control-label">起始时间</label>--%>
                                    <%--<div class="input-append date" id="startDate" data-date="1979-01-01 00:00:00" data-date-format="yyyy-mm-dd hh:ii:ss">--%>
                                        <%--<input class="span2" size="16" type="text" value="1979-01-01 00:00:00" placeholder="起始时间">--%>
                                        <%--<span class="add-on"><i class="glyphicon glyphicon-th"></i> </span>--%>
                                    <%--</div>--%>


                                    <%--<label for="endDate" class="col-md-2 control-label">起始时间</label>--%>
                                    <%--<div class="input-append date" id="endDate" data-date="1979-01-01 00:00:00" data-date-format="yyyy-mm-dd hh:ii:ss">--%>
                                        <%--<input class="span2" size="16" type="text" value="1979-01-01 23:59:59" placeholder="结束时间">--%>
                                        <%--<span class="add-on"><i class="glyphicon glyphicon-th"></i> </span>--%>
                                    <%--</div>--%>
                                    <label for="startDate" class="col-md-2 control-label">起始时间</label>
                                    <div class="input-group date form_datetime col-md-2"
                                         data-date="1979-01-01 00:00:00" data-date-format="yyyy-mm-dd hh:ii:ss">
                                        <input class="form-control" size="16" type="text" name="startDate" id="startDate" value="1979-01-01 00:00:00" placeholder="起始时间" readonly>
                                        <span class="input-group-addon"><span
                                                class="glyphicon glyphicon-remove"></span></span>
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                                    </div>
                                    <label for="endDate" class="col-md-2 control-label">结束时间</label>
                                    <div class="input-group date form_datetime col-md-2"
                                         data-date="1979-01-01 23:59:59" data-date-format="yyyy-mm-dd hh:ii:ss">
                                        <input class="form-control" size="16" type="text" name="endDate" id="endDate" value="1979-01-01 23:59:59" placeholder="结束时间" readonly>
                                        <span class="input-group-addon"><span
                                                class="glyphicon glyphicon-remove"></span></span>
                                        <span class="input-group-addon"><span class="glyphicon glyphicon-th"></span></span>
                                    </div>
                                    <input type="button" class="btn btn-default span1" id="eventquery" value="查询">
                                </fieldset>
                                <%--<input type="button" id="testbtn" value="TestBtn"/>--%>
                            </form>
                            <div>
                                <table id="eventTable"></table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>


<%--script脚本--%>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-confirm.min.js"></script>

<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap-select.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/bootstrap-checkbox.js"></script>

<!--Icons图标-->
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/lumino.glyphs.js"></script>

<%--全局自定义js文件--%>
<script src="${pageContext.request.contextPath}/static/js/global-define.js"></script>
<link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath}/static/css/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" type="text/css"
      href="${pageContext.request.contextPath}/static/css/lobibox.min.css">
<%--全局自定义js文件--%>
<script src="${pageContext.request.contextPath}/static/js/module-authority.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery.validate.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/localization/messages_zh.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap-datetimepicker.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap-datetimepicker-locales/bootstrap-datetimepicker.zh-CN.js"
        charset="UTF-8"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap-table/bootstrap-table.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap-table/locale/bootstrap-table-zh-CN.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/lobibox.min.js"></script>
<script type="text/javascript">
    var last_action_status = true;
    function changestatus(activestatus,userid)
    {
        if (!last_action_status)
        {
            last_action_status = true;
            return;
        }
        var oldactivestatus = activestatus;
        activestatus = (activestatus>0)?0:1;
        //console.log("====================================================");

        //console.log("id = "+id);
        //console.log("status = "+status);
        //console.log("====================================================");
        $.get("chguserstatus?id="+userid+"&status="+activestatus,
            function(responsedata,responsestatus) {
            if (responsestatus == 'success')
            {
                Lobibox.notify('success',{msg:'状态更改成功!',delay:1000,size:'mini',sound: true,soundPath:'static/sounds/'});
                $(('#status'+userid)).val(activestatus);
            }
            else
            {
                Lobibox.notify('error',{msg:'状态更改失败!',delay:3000,size:'mini',sound: true,soundPath:'static/sounds/'});
                $(('#status'+userid)).val(oldactivestatus);
                //失败后刷新表格数据 使得checkbox状态正确
                $('#eventTable').bootstrapTable(('refresh'));	// 很重要的一步，刷新url！
            }
            console.log("response data ="+responsedata+" response status ="+responsestatus );
        }).success(function () {
            console.log("chguserstatus success!");
        }).error(function () {
            last_action_status = false;
            console.log(("chguserstatus failed!"));
            Lobibox.notify('error',{msg:'状态更改失败!',delay:3000,size:'mini',sound: false});
            $(('#status'+userid)).val(oldactivestatus);
            $(('#status'+userid)).prop('checked',oldactivestatus);
        });
    }
    // 表格初始化
    function initTable() {
        $('#eventTable').bootstrapTable({
            method : 'get',	// 向服务器请求方式
//            contentType : "application/x-www-form-urlencoded",	// 如果是post必须定义
            url : '${pageContext.request.contextPath}/getregusers',	// 请求url
            cache : false, // 是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            striped : true, // 隔行变色
            dataType : "json",	// 数据类型
            pagination : true,	// 是否启用分页
            showPaginationSwitch : true, // 是否显示 数据条数选择框
            pageSize : 3, // 每页的记录行数（*）
            pageNumber : 1,		// table初始化时显示的页数
            search : true, // 不显示 搜索框
            sidePagination : 'server', // 服务端分页
            classes : 'table table-bordered', // Class样式

            // showRefresh : true, // 显示刷新按钮

            silent : true, // 必须设置刷新事件

//            toolbar : '#toolbar',		// 工具栏ID
//            toolbarAlign : 'right',		// 工具栏对齐方式

            queryParams : queryParams,	// 请求参数，这个关系到后续用到的异步刷新

            columns : [ {
                field : 'id',
                title : 'ID',
                align : 'center'
            }, {
                field : 'username',
                title : '用户名',
                align : 'center'
            },{
                field : 'password',
                title : '密码',
                align : 'center'
            }, {
                field : 'status',
                title : '状态',
                align : 'center',
                width : '280px',
                formatter : function(value, row, index) {
                    var html = '<input type="checkbox" id="status'+row.id+'" value="'+value+'"/>'+
                        '<script>' +
                            '$(\'#status'+row.id+'\').checkboxpicker();' +
                            '$(\'#status'+row.id+'\').prop("checked", '+(value==1?true:false)+');' +
                            '$(\'#status'+row.id+'\').change(function() {changestatus($(this).val(),'+row.id+');});' +
                        '<\/script>';
                   // console.log("formatter html="+html);
                    return html;
                }
            }, {
                field : 'descfield;',
                title : '描述',
                align : 'center'
            },{
                field : 'email',
                title : '邮件',
                align : 'center'
            }, {
                field : 'phone',
                title : '电话',
                align : 'center'
            },{
                field : 'address',
                title : '地址',
                align : 'center',
                width : '360px',
            }, {
                field : 'date',
                title : '注册日期',
                align : 'center',
                formatter : function(value, row, index) {
                    //console.log("value = "+value);
                    var date = new Date();
                    date.setTime(value);
                    //console.log(date);
                    return date.toLocaleDateString();

                }
            } ],
        });
    }

    /*
    * @param datetimestr: datetime string with format yyyy-mm-dd hh:mm:ss
    * */
    function str2date(datetimestr) {
        var d = new Date();
        d.setYear(parseInt(datetimestr.substring(0,4),10));
        d.setMonth(parseInt(datetimestr.substring(5,7)-1,10));
        d.setDate(parseInt(datetimestr.substring(8,10),10));
        d.setHours(parseInt(datetimestr.substring(11,13),10));
        d.setMinutes(parseInt(datetimestr.substring(14,16),10));
        d.setSeconds(parseInt(datetimestr.substring(17,19),10));
        return d.getTime();
    }
    // 分页查询参数，是以键值对的形式设置的
    function queryParams(params) {
        //console.log("Enter queryParams function");
        //console.log(params);
        console.log("startDate = "+$('#startDate').val());
        console.log("endDate = "+$('#endDate').val());
        return {
            startDate : str2date($('#startDate').val()),	// 请求时向服务端传递的参数
            endDate : str2date($('#endDate').val()),		// 请求时向服务端传递的参数
            limit : params.limit, // 每页显示数量
            offset : params.offset, // SQL语句偏移量
            search: ((params.search === undefined)||(params.search.length == 0)) ?"undefined":params.search,
        }
    }


    $(document).ready(
        function () {

            $("#eventTable  input[type=checkbox]").each(function () {
                //var chk = $(this).find("[checked]");
                if (this.checked) {
                    var authid = $(this).val();
                    //console.log("authid = " + authid);
                    curentAuthArray.push(authid);
                }
            });

            // 搜索按钮触发事件
            $(function() {
                $("#eventquery").click(function() {
                    //console.log("Query button clicked!");
                 $('#eventTable').bootstrapTable(('refresh'));	// 很重要的一步，刷新url！
                });

            });
            $('.form_datetime').datetimepicker({
                language: 'zh-CN',
                weekStart: 1,
                todayBtn: 1,
                autoclose: 1,
                todayHighlight: 1,
                startView: 2,
                forceParse: 0,
                showMeridian: 1,
                pickerPosition: "bottom-left",
                format: "yyyy-mm-dd hh:ii:ss"
            });
            $('#authchg-href').click(function () {
//            alert("click #authchg-tab");
                $('#reguser-li').removeClass('active');
                $('#reguser-tab').removeClass('active');
                $('#authchg-li').addClass('active');
                $('#authchg-tab').addClass('active');
            });
            $('#reguser-href').click(function () {
//                alert("click #reguser-tab");
                $('#authchg-li').removeClass('active');
                $('#authchg-tab').removeClass('active');
                $('#reguser-li').addClass('active');
                $('#reguser-tab').addClass('active');
            });
            //endDate 初始化为当天的时间
            var today = new Date();
            var month = today.getMonth();
            var day = today.getDate();
            var hour = today.getHours();
            var min = today.getMinutes();
            var sec = today.getSeconds();
            timestr = ""+today.getFullYear()+"-"+(month < 9?("0"+(month+1)):(month+1))+"-"+(day < 9?("0"+day):(day))+" "+
                (hour < 10?("0"+hour):(hour))+":"+(min < 10?("0"+min):(min))+":"+(sec < 10?("0"+sec):(sec))
            console.log(timestr);
            $('#endDate').val(timestr);
            // 初始化表格
            initTable();
        }
    );
</script>