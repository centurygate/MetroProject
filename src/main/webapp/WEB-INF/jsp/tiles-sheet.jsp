<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/15
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!--javascript 脚本-->
<script src="${pageContext.request.contextPath}/static/js/jquery-1.11.1.min.js"></script>

<%--Echart图表引入--%>
<script src="${pageContext.request.contextPath}/static/js/echarts.min.js"></script>


<div class="col-lg-10 col-lg-offset-2 main">
    <div class="row" id="contentcrumb">
        <ol class="breadcrumb breadbottom">
            <li><a href="#">
                <svg class="glyph stroked table">
                    <use xlink:href="#stroked-table"></use>
                </svg>
            </a></li>
            <li class="active">总评报表</li>
        </ol>
    </div><!--/.row-->
    <hr class="hrtop"/> <!--分割横线-->


    <%--右侧的导出Excel功能按钮--%>
    <div class="pull-right">
        <button type="button" class="btn btn-info" onclick="window.location.href='${pageContext.request.contextPath}/goanalysis.action'">导出Excel报表</button>
    </div>


    <!--图表1：左线人工水平收敛==============================================================================-->
    <div class="row tablestyle">
        <table class="table table-striped table-bordered">
            <caption>左线-人工水平收敛</caption>
            <tbody>
            <tr>
                <td>阶段变化最大点</td>
                <td>阶段最大值</td>
                <td>阶段速率(mm/d)</td>
                <td>累计变化最大点</td>
                <td>累计最大值(mm)</td>
                <td>近百日速率(mm/hd)</td>
            </tr>
            <tr>
                <td>706</td>
                <td>-0.58</td>
                <td>-0.028</td>
                <td>662</td>
                <td>-77.2</td>
                <td>-0.722</td>
            </tr>
            </tbody>
        </table>

        <!--假的图表1-->
        <div id="null0"></div>

        <!--真的图表1-->
        <div class="general-sheet" id="left-manualshoulian"></div>

    </div>
    <hr/>

    <!--图表2：右线人工水平收敛==============================================================================-->
    <div class="row tablestyle">
        <table class="table table-striped table-bordered">
            <caption>右线-人工水平收敛</caption>
            <tbody>
            <tr>
                <td>阶段变化最大点</td>
                <td>阶段最大值</td>
                <td>阶段速率(mm/d)</td>
                <td>累计变化最大点</td>
                <td>累计最大值(mm)</td>
                <td>近百日速率(mm/hd)</td>
            </tr>
            <tr>
                <td>712</td>
                <td>-0.55</td>
                <td>-0.025</td>
                <td>618</td>
                <td>-78.8</td>
                <td>-0.768</td>
            </tr>
            </tbody>
        </table>

        <!--这里测试添加折线图表-->
        <div class="general-sheet" id="right-manualshoulian"></div>

    </div>
    <hr/>

    <!--图表3：左线-道床沉降==============================================================================-->
    <div class="row tablestyle">
        <table class="table table-striped table-bordered">
            <caption>左线-道床沉降</caption>
            <tbody>
            <tr>
                <td>阶段变化最大点</td>
                <td>阶段最大值</td>
                <td>阶段速率(mm/d)</td>
                <td>累计变化最大点</td>
                <td>累计最大值(mm)</td>
                <td>近百日速率(mm/hd)</td>
            </tr>
            <tr>
                <td>708</td>
                <td>-0.60</td>
                <td>-0.029</td>
                <td>624</td>
                <td>-79.2</td>
                <td>-0.791</td>
            </tr>
            </tbody>
        </table>

        <!--这里测试添加折线图表-->
        <div class="general-sheet" id="left-daochuangchenjiang"></div>

    </div>
    <hr/>

    <!--图表4：右线-道床沉降==============================================================================-->
    <div class="row tablestyle">
        <table class="table table-striped table-bordered">
            <caption>右线-道床沉降</caption>
            <tbody>
            <tr>
                <td>阶段变化最大点</td>
                <td>阶段最大值</td>
                <td>阶段速率(mm/d)</td>
                <td>累计变化最大点</td>
                <td>累计最大值(mm)</td>
                <td>近百日速率(mm/hd)</td>
            </tr>
            <tr>
                <td>435</td>
                <td>-1.30</td>
                <td>-0.062</td>
                <td>617</td>
                <td>-103.2</td>
                <td>-1.025</td>
            </tr>
            </tbody>
        </table>

        <!--这里测试添加折线图表-->
        <div class="general-sheet" id="right-daochuangchenjiang"></div>

    </div>
    <hr/>

    <!--图表5：左线-水平位移==============================================================================-->
    <div class="row tablestyle">
        <table class="table table-striped table-bordered">
            <caption>左线-水平位移</caption>
            <tbody>
            <tr>
                <td>阶段变化最大点</td>
                <td>阶段最大值</td>
                <td>阶段速率(mm/d)</td>
                <td>累计变化最大点</td>
                <td>累计最大值(mm)</td>
                <td>近百日速率(mm/hd)</td>
            </tr>
            <tr>
                <td>592</td>
                <td>-0.90</td>
                <td>-0.043</td>
                <td>565</td>
                <td>19.3</td>
                <td>0.005</td>
            </tr>
            </tbody>
        </table>

        <!--这里测试添加折线图表-->
        <div class="general-sheet" id="left-horizonshift"></div>

    </div>
    <hr/>

    <!--图表6：右线-水平位移==============================================================================-->
    <div class="row tablestyle">
        <table class="table table-striped table-bordered">
            <caption>右线-水平位移</caption>
            <tbody>
            <tr>
                <td>阶段变化最大点</td>
                <td>阶段最大值</td>
                <td>阶段速率(mm/d)</td>
                <td>累计变化最大点</td>
                <td>累计最大值(mm)</td>
                <td>近百日速率(mm/hd)</td>
            </tr>
            <tr>
                <td>654</td>
                <td>-1.20</td>
                <td>-0.057</td>
                <td>545</td>
                <td>34.8</td>
                <td>0.007</td>
            </tr>
            </tbody>
        </table>

        <!--这里测试添加折线图表-->
        <div class="general-sheet" id="right-horizonshift"></div>

    </div>
    <hr/>

    <!--图表7：左线-水平收敛==============================================================================-->
    <div class="row tablestyle">
        <table class="table table-striped table-bordered">
            <caption>左线-水平收敛</caption>
            <tbody>
            <tr>
                <td>阶段变化最大点</td>
                <td>阶段最大值</td>
                <td>阶段速率(mm/d)</td>
                <td>累计变化最大点</td>
                <td>累计最大值(mm)</td>
                <td>近百日速率(mm/hd)</td>
            </tr>
            <tr>
                <td>821</td>
                <td>-0.69</td>
                <td>-0.033</td>
                <td>617</td>
                <td>-78.0</td>
                <td>-0.685</td>
            </tr>
            </tbody>
        </table>

        <!--这里测试添加折线图表-->
        <div class="general-sheet" id="left-horizonconvergence"></div>

    </div>
    <hr/>

    <!--图表8：右线-水平位移==============================================================================-->
    <div class="row tablestyle">
        <table class="table table-striped table-bordered">
            <caption>右线-水平收敛</caption>
            <tbody>
            <tr>
                <td>阶段变化最大点</td>
                <td>阶段最大值</td>
                <td>阶段速率(mm/d)</td>
                <td>累计变化最大点</td>
                <td>累计最大值(mm)</td>
                <td>近百日速率(mm/hd)</td>
            </tr>
            <tr>
                <td>688</td>
                <td>-0.51</td>
                <td>-0.017</td>
                <td>667</td>
                <td>-68.7</td>
                <td>-0.741</td>
            </tr>
            </tbody>
        </table>

        <!--这里测试添加折线图表-->
        <div class="general-sheet" id="right-horizonconvergence"></div>

    </div>
    <hr/>

    <!--图表9：左线-人工道床沉降==============================================================================-->
    <div class="row tablestyle">
        <table class="table table-striped table-bordered">
            <caption>左线-人工道床沉降</caption>
            <tbody>
            <tr>
                <td>阶段变化最大点</td>
                <td>阶段最大值</td>
                <td>阶段速率(mm/d)</td>
                <td>累计变化最大点</td>
                <td>累计最大值(mm)</td>
                <td>近百日速率(mm/hd)</td>
            </tr>
            <tr>
                <td>700</td>
                <td>-0.45</td>
                <td>-0.02</td>
                <td>766</td>
                <td>-60.8</td>
                <td>-0.774</td>
            </tr>
            </tbody>
        </table>

        <!--这里测试添加折线图表-->
        <div class="general-sheet" id="left-manualsettle"></div>

    </div>
    <hr/>

    <!--图表10：右线-人工道床沉降==============================================================================-->
    <div class="row tablestyle">
        <table class="table table-striped table-bordered">
            <caption>右线-人工道床沉降</caption>
            <tbody>
            <tr>
                <td>阶段变化最大点</td>
                <td>阶段最大值</td>
                <td>阶段速率(mm/d)</td>
                <td>累计变化最大点</td>
                <td>累计最大值(mm)</td>
                <td>近百日速率(mm/hd)</td>
            </tr>
            <tr>
                <td>698</td>
                <td>-0.55</td>
                <td>-0.034</td>
                <td>559</td>
                <td>-68.6</td>
                <td>-0.771</td>
            </tr>
            </tbody>
        </table>

        <!--这里测试添加折线图表-->
        <div class="general-sheet" id="right-manualsettle"></div>

    </div>


</div>


<%--脚本--%>
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>

<!--Icons图标-->
<script src="${pageContext.request.contextPath}/static/js/lumino.glyphs.js"></script>

<%--全局自定义js文件--%>
<script src="${pageContext.request.contextPath}/static/js/global-define.js"></script>

<%--模块自己的js文件--%>
<script src="${pageContext.request.contextPath}/static/js/module-sheet.js"></script>