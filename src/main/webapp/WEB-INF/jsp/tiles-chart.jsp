<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/8
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="col-lg-10 col-lg-offset-2 main"  style="margin-top: 50px;">

    <div class="row" id="contentcrumb">
        <ol class="breadcrumb breadbottom">
            <li><a href="#">
                <svg class="glyph stroked line-graph">
                    <use xlink:href="#stroked-line-graph"></use>
                </svg>
            </a></li>
            <li class="active">实时曲线</li>
        </ol>
    </div><!--/.row-->
    <hr class="hrtop"/> <!--分割横线-->

    <div class="row">
        <div class="container">
            <!--2个比例的图表类型列表-->
            <div class="col-lg-2">
                <div class="sidebar-nav panel panel-default">
                    <div class="panel-heading">
                        <p class="panel-title">激光设备列表</p>
                    </div>
                    <div class="panel-body">

                        <!--测距仪->设备1-->
                        <div class="panel panel-warning">
                            <div class="panel-heading">太平南路</div>
                            <div class="panel-body">
                                <div class="lyrow" name="0">
                                    <span class="chart-name">测距仪1</span>
                                    <a href="#close" class="remove label label-danger"><i class="glyphicon-remove glyphicon"></i>删除</a>
                                    <span class="drag label label-default"><i class="glyphicon glyphicon-move"></i>拖动</span>
                                    <span class="transform label label-success"><i class="glyphicon glyphicon-retweet"></i>历史</span>
                                    <div class="view">
                                        <div class="col-md-12 column" name="realtime">
                                            <!--<div id="main"></div>-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--测距仪->设备2-->
                        <div class="panel panel-warning">
                            <div class="panel-heading">中山东路</div>
                            <div class="panel-body">
                                <div class="lyrow" name="1">
                                    <span class="chart-name">测距仪2</span>
                                    <a href="#close" class="remove label label-danger"><i class="glyphicon-remove glyphicon"></i>删除</a>
                                    <span class="drag label label-default"><i class="glyphicon glyphicon-move"></i>拖动</span>
                                    <span class="transform label label-success"><i class="glyphicon glyphicon-retweet"></i>历史</span>
                                    <div class="view">
                                        <div class="col-md-12 column" name="realtime">
                                            <!--<div id="main"></div>-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--测距仪->设备3-->
                        <div class="panel panel-warning">
                            <div class="panel-heading">长白街</div>
                            <div class="panel-body">
                                <div class="lyrow" name="2">
                                    <span class="chart-name">测距仪3</span>
                                    <a href="#close" class="remove label label-danger"><i class="glyphicon-remove glyphicon"></i>删除</a>
                                    <span class="drag label label-default"><i class="glyphicon glyphicon-move"></i>拖动</span>
                                    <span class="transform label label-success"><i class="glyphicon glyphicon-retweet"></i>历史</span>
                                    <div class="view">
                                        <div class="col-md-12 column" name="realtime">
                                            <!--<div id="main"></div>-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--测距仪->设备4-->
                        <div class="panel panel-warning">
                            <div class="panel-heading">利济巷</div>
                            <div class="panel-body">
                                <div class="lyrow" name="3">
                                    <span class="chart-name">测距仪4</span>
                                    <a href="#close" class="remove label label-danger"><i class="glyphicon-remove glyphicon"></i>删除</a>
                                    <span class="drag label label-default"><i class="glyphicon glyphicon-move"></i>拖动</span>
                                    <span class="transform label label-success"><i class="glyphicon glyphicon-retweet"></i>历史</span>
                                    <div class="view">
                                        <div class="col-md-12 column" name="realtime">
                                            <!--<div id="main"></div>-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--测距仪->设备5-->
                        <div class="panel panel-warning">
                            <div class="panel-heading">科巷</div>
                            <div class="panel-body">
                                <div class="lyrow" name="4">
                                    <span class="chart-name">测距仪5</span>
                                    <a href="#close" class="remove label label-danger"><i class="glyphicon-remove glyphicon"></i>删除</a>
                                    <span class="drag label label-default"><i class="glyphicon glyphicon-move"></i>拖动</span>
                                    <span class="transform label label-success"><i class="glyphicon glyphicon-retweet"></i>历史</span>
                                    <div class="view">
                                        <div class="col-md-12 column" name="realtime">
                                            <!--<div id="main"></div>-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <%--==============================================================================================--%>
                        <!--测距仪-设备1-->
                        <div class="panel panel-warning">
                            <div class="panel-heading">水巷</div>
                            <div class="panel-body">
                                <div class="lyrow" name="5">
                                    <span class="chart-name">测距仪6</span>
                                    <a href="#close" class="remove label label-danger"><i class="glyphicon-remove glyphicon"></i>删除</a>
                                    <span class="drag label label-default"><i class="glyphicon glyphicon-move"></i>拖动</span>
                                    <span class="transform label label-success"><i class="glyphicon glyphicon-retweet"></i>历史</span>
                                    <div class="view">
                                        <div class="col-md-12 column" name="realtime">
                                            <!--<div id="main"></div>-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--测距仪->设备2-->
                        <div class="panel panel-warning">
                            <div class="panel-heading">铜井巷</div>
                            <div class="panel-body">
                                <div class="lyrow" name="6">
                                    <span class="chart-name">测距仪7</span>
                                    <a href="#close" class="remove label label-danger"><i class="glyphicon-remove glyphicon"></i>删除</a>
                                    <span class="drag label label-default"><i class="glyphicon glyphicon-move"></i>拖动</span>
                                    <span class="transform label label-success"><i class="glyphicon glyphicon-retweet"></i>历史</span>
                                    <div class="view">
                                        <div class="col-md-12 column" name="realtime">
                                            <!--<div id="main"></div>-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--测距仪->设备3-->
                        <div class="panel panel-warning">
                            <div class="panel-heading">文昌巷</div>
                            <div class="panel-body">
                                <div class="lyrow" name="7">
                                    <span class="chart-name">测距仪8</span>
                                    <a href="#close" class="remove label label-danger"><i class="glyphicon-remove glyphicon"></i>删除</a>
                                    <span class="drag label label-default"><i class="glyphicon glyphicon-move"></i>拖动</span>
                                    <span class="transform label label-success"><i class="glyphicon glyphicon-retweet"></i>历史</span>
                                    <div class="view">
                                        <div class="col-md-12 column" name="realtime">
                                            <!--<div id="main"></div>-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--测距仪->设备4-->
                        <div class="panel panel-warning">
                            <div class="panel-heading">常府街</div>
                            <div class="panel-body">
                                <div class="lyrow" name="8">
                                    <span class="chart-name">测距仪9</span>
                                    <a href="#close" class="remove label label-danger"><i class="glyphicon-remove glyphicon"></i>删除</a>
                                    <span class="drag label label-default"><i class="glyphicon glyphicon-move"></i>拖动</span>
                                    <span class="transform label label-success"><i class="glyphicon glyphicon-retweet"></i>历史</span>
                                    <div class="view">
                                        <div class="col-md-12 column" name="realtime">
                                            <!--<div id="main"></div>-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--测距仪->设备5-->
                        <div class="panel panel-warning">
                            <div class="panel-heading">淮海路</div>
                            <div class="panel-body">
                                <div class="lyrow" name="9">
                                    <span class="chart-name">测距仪10</span>
                                    <a href="#close" class="remove label label-danger"><i class="glyphicon-remove glyphicon"></i>删除</a>
                                    <span class="drag label label-default"><i class="glyphicon glyphicon-move"></i>拖动</span>
                                    <span class="transform label label-success"><i class="glyphicon glyphicon-retweet"></i>历史</span>
                                    <div class="view">
                                        <div class="col-md-12 column" name="realtime">
                                            <!--<div id="main"></div>-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <%--==============================================================================================--%>
                        <!--测距仪->设备1-->
                        <div class="panel panel-warning">
                            <div class="panel-heading">户部街</div>
                            <div class="panel-body">
                                <div class="lyrow" name="10">
                                    <span class="chart-name">测距仪11</span>
                                    <a href="#close" class="remove label label-danger"><i class="glyphicon-remove glyphicon"></i>删除</a>
                                    <span class="drag label label-default"><i class="glyphicon glyphicon-move"></i>拖动</span>
                                    <span class="transform label label-success"><i class="glyphicon glyphicon-retweet"></i>历史</span>
                                    <div class="view">
                                        <div class="col-md-12 column" name="realtime">
                                            <!--<div id="main"></div>-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--测距仪->设备2-->
                        <div class="panel panel-warning">
                            <div class="panel-heading">太平巷</div>
                            <div class="panel-body">
                                <div class="lyrow" name="11">
                                    <span class="chart-name">测距仪12</span>
                                    <a href="#close" class="remove label label-danger"><i class="glyphicon-remove glyphicon"></i>删除</a>
                                    <span class="drag label label-default"><i class="glyphicon glyphicon-move"></i>拖动</span>
                                    <span class="transform label label-success"><i class="glyphicon glyphicon-retweet"></i>历史</span>
                                    <div class="view">
                                        <div class="col-md-12 column" name="realtime">
                                            <!--<div id="main"></div>-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--测距仪->设备3-->
                        <div class="panel panel-warning">
                            <div class="panel-heading">白下路</div>
                            <div class="panel-body">
                                <div class="lyrow" name="12">
                                    <span class="chart-name">测距仪13</span>
                                    <a href="#close" class="remove label label-danger"><i class="glyphicon-remove glyphicon"></i>删除</a>
                                    <span class="drag label label-default"><i class="glyphicon glyphicon-move"></i>拖动</span>
                                    <span class="transform label label-success"><i class="glyphicon glyphicon-retweet"></i>历史</span>
                                    <div class="view">
                                        <div class="col-md-12 column" name="realtime">
                                            <!--<div id="main"></div>-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--测距仪->设备4-->
                        <div class="panel panel-warning">
                            <div class="panel-heading">大光路</div>
                            <div class="panel-body">
                                <div class="lyrow" name="13">
                                    <span class="chart-name">测距仪14</span>
                                    <a href="#close" class="remove label label-danger"><i class="glyphicon-remove glyphicon"></i>删除</a>
                                    <span class="drag label label-default"><i class="glyphicon glyphicon-move"></i>拖动</span>
                                    <span class="transform label label-success"><i class="glyphicon glyphicon-retweet"></i>历史</span>
                                    <div class="view">
                                        <div class="col-md-12 column" name="realtime">
                                            <!--<div id="main"></div>-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!--测距仪->设备5-->
                        <div class="panel panel-warning">
                            <div class="panel-heading">珠江路</div>
                            <div class="panel-body">
                                <div class="lyrow" name="14">
                                    <span class="chart-name">测距仪15</span>
                                    <a href="#close" class="remove label label-danger"><i class="glyphicon-remove glyphicon"></i>删除</a>
                                    <span class="drag label label-default"><i class="glyphicon glyphicon-move"></i>拖动</span>
                                    <span class="transform label label-success"><i class="glyphicon glyphicon-retweet"></i>历史</span>
                                    <div class="view">
                                        <div class="col-md-12 column" name="realtime">
                                            <!--<div id="main"></div>-->
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>


            <!--10个比例的图表显示区-->
            <div class="col-lg-10">
                <div class="demo">
                    <%--固定存在的曲线对话框1--%>
                    <div class="lyrow ui-draggable" name="0" style="display: block;">
                        <span class="chart-name">测距仪1</span>
                        <a href="#close" class="remove label label-danger"><i class="glyphicon-remove glyphicon"></i>删除</a>
                        <span class="drag label label-default"><i class="glyphicon glyphicon-move"></i>拖动</span>
                        <span class="transform label label-success"><i class="glyphicon glyphicon-retweet"></i>历史</span>
                        <div class="view">
                            <div class="col-md-12 column added" id="const-1" name="realtime">
                                <!--<div id="main"></div>-->
                            </div>
                        </div>
                    </div>


                    <div style="clear: both; "></div>
                </div>
            </div>
        </div>

    </div>

</div>



<%--javascript--%>
<script src="${pageContext.request.contextPath}/static/js/jquery-1.11.1.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>

<!--Icons图标-->
<script src="${pageContext.request.contextPath}/static/js/lumino.glyphs.js"></script>

<%--全局自定义js文件--%>
<script src="${pageContext.request.contextPath}/static/js/global-define.js"></script>

<%--websocket脚本--%>
<script src="${pageContext.request.contextPath}/static/js/sockjs.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/stomp.min.js"></script>

<script src="${pageContext.request.contextPath}/static/js/echarts.min.js"></script>
<script src="${pageContext.request.contextPath}/static/js/scripts.min.js"></script>