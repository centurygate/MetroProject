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


<div class="col-lg-10 col-lg-offset-2 main" style="margin-top: 50px;">
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
    <div class="pull-right" style="margin-right: 20px;">
        <button type="button" class="btn btn-info" onclick="window.location.href='${pageContext.request.contextPath}/goanalysis.action'">导出Excel报表</button>
    </div>


    <!--图表1：左线人工水平收敛==============================================================================-->
    <div class="row" style="padding: 30px; padding-bottom: 40px;">
        <table class="table table-striped table-bordered" style="margin-bottom: 0;">
            <caption style="font-weight:bold; margin-bottom: 1em; font-size: 1.5em;">左线-人工水平收敛</caption>
            <tbody>
            <tr>
                <td style="text-align:center;">阶段变化最大点</td>
                <td style="text-align:center;">阶段最大值</td>
                <td style="text-align:center;">阶段速率(mm/d)</td>
                <td style="text-align:center;">累计变化最大点</td>
                <td style="text-align:center;">累计最大值(mm)</td>
                <td style="text-align:center;">近百日速率(mm/hd)</td>
            </tr>
            <tr>
                <td style="text-align:center;">706</td>
                <td style="text-align:center;">-0.58</td>
                <td style="text-align:center;">-0.028</td>
                <td style="text-align:center;">662</td>
                <td style="text-align:center;">-77.2</td>
                <td style="text-align:center;">-0.722</td>
            </tr>
            </tbody>
        </table>

        <!--假的图表1-->
        <div id="null0" style="width: 100%;height:320px; display: none;"></div>

        <!--真的图表1-->
        <div id="left-manualshoulian" style="width: 100%;height:320px; margin-top: 20px;"></div>

    </div>
    <hr/>

    <!--图表2：右线人工水平收敛==============================================================================-->
    <div class="row" style="padding: 30px; padding-bottom: 40px;">
        <table class="table table-striped table-bordered" style="margin-bottom: 0;">
            <caption style="font-weight:bold; margin-bottom: 1em; font-size: 1.5em;">右线-人工水平收敛</caption>
            <tbody>
            <tr>
                <td style="text-align:center;">阶段变化最大点</td>
                <td style="text-align:center;">阶段最大值</td>
                <td style="text-align:center;">阶段速率(mm/d)</td>
                <td style="text-align:center;">累计变化最大点</td>
                <td style="text-align:center;">累计最大值(mm)</td>
                <td style="text-align:center;">近百日速率(mm/hd)</td>
            </tr>
            <tr>
                <td style="text-align:center;">712</td>
                <td style="text-align:center;">-0.55</td>
                <td style="text-align:center;">-0.025</td>
                <td style="text-align:center;">618</td>
                <td style="text-align:center;">-78.8</td>
                <td style="text-align:center;">-0.768</td>
            </tr>
            </tbody>
        </table>

        <!--这里测试添加折线图表-->
        <div id="right-manualshoulian" style="width: 100%;height:320px; margin-top: 20px;"></div>

    </div>
    <hr/>

    <!--图表3：左线-道床沉降==============================================================================-->
    <div class="row" style="padding: 30px; padding-bottom: 40px;">
        <table class="table table-striped table-bordered" style="margin-bottom: 0;">
            <caption style="font-weight:bold; margin-bottom: 1em; font-size: 1.5em;">左线-道床沉降</caption>
            <tbody>
            <tr>
                <td style="text-align:center;">阶段变化最大点</td>
                <td style="text-align:center;">阶段最大值</td>
                <td style="text-align:center;">阶段速率(mm/d)</td>
                <td style="text-align:center;">累计变化最大点</td>
                <td style="text-align:center;">累计最大值(mm)</td>
                <td style="text-align:center;">近百日速率(mm/hd)</td>
            </tr>
            <tr>
                <td style="text-align:center;">708</td>
                <td style="text-align:center;">-0.60</td>
                <td style="text-align:center;">-0.029</td>
                <td style="text-align:center;">624</td>
                <td style="text-align:center;">-79.2</td>
                <td style="text-align:center;">-0.791</td>
            </tr>
            </tbody>
        </table>

        <!--这里测试添加折线图表-->
        <div id="left-daochuangchenjiang" style="width: 100%;height:320px; margin-top: 20px;"></div>

    </div>
    <hr/>

    <!--图表4：右线-道床沉降==============================================================================-->
    <div class="row" style="padding: 30px; padding-bottom: 40px;">
        <table class="table table-striped table-bordered" style="margin-bottom: 0;">
            <caption style="font-weight:bold; margin-bottom: 1em; font-size: 1.5em;">右线-道床沉降</caption>
            <tbody>
            <tr>
                <td style="text-align:center;">阶段变化最大点</td>
                <td style="text-align:center;">阶段最大值</td>
                <td style="text-align:center;">阶段速率(mm/d)</td>
                <td style="text-align:center;">累计变化最大点</td>
                <td style="text-align:center;">累计最大值(mm)</td>
                <td style="text-align:center;">近百日速率(mm/hd)</td>
            </tr>
            <tr>
                <td style="text-align:center;">435</td>
                <td style="text-align:center;">-1.30</td>
                <td style="text-align:center;">-0.062</td>
                <td style="text-align:center;">617</td>
                <td style="text-align:center;">-103.2</td>
                <td style="text-align:center;">-1.025</td>
            </tr>
            </tbody>
        </table>

        <!--这里测试添加折线图表-->
        <div id="right-daochuangchenjiang" style="width: 100%;height:320px; margin-top: 20px;"></div>

    </div>
    <hr/>

    <!--图表5：左线-水平位移==============================================================================-->
    <div class="row" style="padding: 30px; padding-bottom: 40px;">
        <table class="table table-striped table-bordered" style="margin-bottom: 0;">
            <caption style="font-weight:bold; margin-bottom: 1em; font-size: 1.5em;">左线-水平位移</caption>
            <tbody>
            <tr>
                <td style="text-align:center;">阶段变化最大点</td>
                <td style="text-align:center;">阶段最大值</td>
                <td style="text-align:center;">阶段速率(mm/d)</td>
                <td style="text-align:center;">累计变化最大点</td>
                <td style="text-align:center;">累计最大值(mm)</td>
                <td style="text-align:center;">近百日速率(mm/hd)</td>
            </tr>
            <tr>
                <td style="text-align:center;">592</td>
                <td style="text-align:center;">-0.90</td>
                <td style="text-align:center;">-0.043</td>
                <td style="text-align:center;">565</td>
                <td style="text-align:center;">19.3</td>
                <td style="text-align:center;">0.005</td>
            </tr>
            </tbody>
        </table>

        <!--这里测试添加折线图表-->
        <div id="left-horizonshift" style="width: 100%;height:320px; margin-top: 20px;"></div>

    </div>
    <hr/>

    <!--图表6：右线-水平位移==============================================================================-->
    <div class="row" style="padding: 30px; padding-bottom: 40px;">
        <table class="table table-striped table-bordered" style="margin-bottom: 0;">
            <caption style="font-weight:bold; margin-bottom: 1em; font-size: 1.5em;">右线-水平位移</caption>
            <tbody>
            <tr>
                <td style="text-align:center;">阶段变化最大点</td>
                <td style="text-align:center;">阶段最大值</td>
                <td style="text-align:center;">阶段速率(mm/d)</td>
                <td style="text-align:center;">累计变化最大点</td>
                <td style="text-align:center;">累计最大值(mm)</td>
                <td style="text-align:center;">近百日速率(mm/hd)</td>
            </tr>
            <tr>
                <td style="text-align:center;">654</td>
                <td style="text-align:center;">-1.20</td>
                <td style="text-align:center;">-0.057</td>
                <td style="text-align:center;">545</td>
                <td style="text-align:center;">34.8</td>
                <td style="text-align:center;">0.007</td>
            </tr>
            </tbody>
        </table>

        <!--这里测试添加折线图表-->
        <div id="right-horizonshift" style="width: 100%;height:320px; margin-top: 20px;"></div>

    </div>
    <hr/>

    <!--图表7：左线-水平收敛==============================================================================-->
    <div class="row" style="padding: 30px; padding-bottom: 40px;">
        <table class="table table-striped table-bordered" style="margin-bottom: 0;">
            <caption style="font-weight:bold; margin-bottom: 1em; font-size: 1.5em;">左线-水平收敛</caption>
            <tbody>
            <tr>
                <td style="text-align:center;">阶段变化最大点</td>
                <td style="text-align:center;">阶段最大值</td>
                <td style="text-align:center;">阶段速率(mm/d)</td>
                <td style="text-align:center;">累计变化最大点</td>
                <td style="text-align:center;">累计最大值(mm)</td>
                <td style="text-align:center;">近百日速率(mm/hd)</td>
            </tr>
            <tr>
                <td style="text-align:center;">821</td>
                <td style="text-align:center;">-0.69</td>
                <td style="text-align:center;">-0.033</td>
                <td style="text-align:center;">617</td>
                <td style="text-align:center;">-78.0</td>
                <td style="text-align:center;">-0.685</td>
            </tr>
            </tbody>
        </table>

        <!--这里测试添加折线图表-->
        <div id="left-horizonconvergence" style="width: 100%;height:320px; margin-top: 20px;"></div>

    </div>
    <hr/>

    <!--图表8：右线-水平位移==============================================================================-->
    <div class="row" style="padding: 30px; padding-bottom: 40px;">
        <table class="table table-striped table-bordered" style="margin-bottom: 0;">
            <caption style="font-weight:bold; margin-bottom: 1em; font-size: 1.5em;">右线-水平收敛</caption>
            <tbody>
            <tr>
                <td style="text-align:center;">阶段变化最大点</td>
                <td style="text-align:center;">阶段最大值</td>
                <td style="text-align:center;">阶段速率(mm/d)</td>
                <td style="text-align:center;">累计变化最大点</td>
                <td style="text-align:center;">累计最大值(mm)</td>
                <td style="text-align:center;">近百日速率(mm/hd)</td>
            </tr>
            <tr>
                <td style="text-align:center;">688</td>
                <td style="text-align:center;">-0.51</td>
                <td style="text-align:center;">-0.017</td>
                <td style="text-align:center;">667</td>
                <td style="text-align:center;">-68.7</td>
                <td style="text-align:center;">-0.741</td>
            </tr>
            </tbody>
        </table>

        <!--这里测试添加折线图表-->
        <div id="right-horizonconvergence" style="width: 100%;height:320px; margin-top: 20px;"></div>

    </div>
    <hr/>

    <!--图表9：左线-人工道床沉降==============================================================================-->
    <div class="row" style="padding: 30px; padding-bottom: 40px;">
        <table class="table table-striped table-bordered" style="margin-bottom: 0;">
            <caption style="font-weight:bold; margin-bottom: 1em; font-size: 1.5em;">左线-人工道床沉降</caption>
            <tbody>
            <tr>
                <td style="text-align:center;">阶段变化最大点</td>
                <td style="text-align:center;">阶段最大值</td>
                <td style="text-align:center;">阶段速率(mm/d)</td>
                <td style="text-align:center;">累计变化最大点</td>
                <td style="text-align:center;">累计最大值(mm)</td>
                <td style="text-align:center;">近百日速率(mm/hd)</td>
            </tr>
            <tr>
                <td style="text-align:center;">700</td>
                <td style="text-align:center;">-0.45</td>
                <td style="text-align:center;">-0.02</td>
                <td style="text-align:center;">766</td>
                <td style="text-align:center;">-60.8</td>
                <td style="text-align:center;">-0.774</td>
            </tr>
            </tbody>
        </table>

        <!--这里测试添加折线图表-->
        <div id="left-manualsettle" style="width: 100%;height:320px; margin-top: 20px;"></div>

    </div>
    <hr/>

    <!--图表10：右线-人工道床沉降==============================================================================-->
    <div class="row" style="padding: 30px; padding-bottom: 40px;">
        <table class="table table-striped table-bordered" style="margin-bottom: 0;">
            <caption style="font-weight:bold; margin-bottom: 1em; font-size: 1.5em;">右线-人工道床沉降</caption>
            <tbody>
            <tr>
                <td style="text-align:center;">阶段变化最大点</td>
                <td style="text-align:center;">阶段最大值</td>
                <td style="text-align:center;">阶段速率(mm/d)</td>
                <td style="text-align:center;">累计变化最大点</td>
                <td style="text-align:center;">累计最大值(mm)</td>
                <td style="text-align:center;">近百日速率(mm/hd)</td>
            </tr>
            <tr>
                <td style="text-align:center;">698</td>
                <td style="text-align:center;">-0.55</td>
                <td style="text-align:center;">-0.034</td>
                <td style="text-align:center;">559</td>
                <td style="text-align:center;">-68.6</td>
                <td style="text-align:center;">-0.771</td>
            </tr>
            </tbody>
        </table>

        <!--这里测试添加折线图表-->
        <div id="right-manualsettle" style="width: 100%;height:320px; margin-top: 20px;"></div>

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