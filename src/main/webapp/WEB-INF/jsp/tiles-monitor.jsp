<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2017/2/8
  Time: 15:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%--jquery引用--%>
<script src="${pageContext.request.contextPath}/static/js/jquery-1.11.1.min.js"></script>

<%--百度地图应用--%>
<script src="http://api.map.baidu.com/api?v=2.0&ak=U8GZ1pAUaHnQaoOvYAedyszjQHmIWAYD"></script>

<!-- 引入 ECharts 文件 -->
<script src="${pageContext.request.contextPath}/static/js/echarts.min.js"></script>


<div class="baidu-fullscreen">

    <div class="row" id="contentcrumb">
        <ol class="breadcrumb baidu-breadcrumb">
            <li><a href="#">
                &nbsp;&nbsp;&nbsp;&nbsp;<svg class="glyph stroked calendar">
                    <use xlink:href="#stroked-calendar"></use>
                </svg>
            </a></li>
            <li class="active">监测区间</li>

        </ol>
    </div>
    <hr style="margin: 0;"/>

    <%--百度地图应用--%>
    <div class="baidu-asset" id="assetmap"></div>
    <script type="text/javascript">
        // 百度地图API功能
        var map = new BMap.Map("assetmap",{enableMapClick:false});    // 创建Map实例
        map.centerAndZoom(new BMap.Point(118.802673,32.046303), 19);  // 初始化地图,设置中心点坐标和地图级别
        map.addControl(new BMap.MapTypeControl({mapTypes: [BMAP_NORMAL_MAP,BMAP_SATELLITE_MAP ]}));
        map.setCurrentCity("南京");          // 设置地图显示的城市 此项是必须设置的
    </script>


    <!--collapase panel in the bottom-->
    <div id = "downsidebar">

            <!--这里测试添加折线图表-->
            <div id="main" style="width: 100%;height:320px;"></div>
            <script type="text/javascript">
                // 基于准备好的dom，初始化echarts实例
                var myChart = echarts.init(document.getElementById('main'));

                // 指定图表的配置项和数据
                var moveTimer= null;
                var option = {
                    title: {
                        text: '道床沉降-右线',
                        x: 'center',
                        padding: 10
                    },
                    tooltip: {
                        trigger: 'axis',
                        //formatter: '环号：{b0} <br/> 累计变化量：{c0}(mm)'
                        formatter: function (params)
                        {
                            //百度地图的跟随运动，将当前编号的环片运动至屏幕中心
                            if(moveTimer){
                                clearTimeout(moveTimer);
                            }
                            moveTimer = setTimeout(function () {
                                movingMap(params);
                            },100);

                            return '环号：'+params[0].name + '<br/>' + '累计变化量：' + params[0].value;
                        }
                    },
                    legend: {
                        data:['2016-10-1'],
                        y:  'bottom',
                        padding: 5
                    },
                    grid: {
                        left: '3%',
                        right: '4%',
                        top: 40,
                        bottom: 20,
                        containLabel: true
                    },
                    xAxis: {
                        type: 'category',
                        boundaryGap: false,
                        nameLocation: 'end',
                        name: '(环号)',
                        nameTextStyle:{
                            fontSize: 12,
                            fontWeight: 'bold'
                        },
                        position: 'bottom',
                        gridIndex: 0,
                        scale: true,
                        data: ['0','3','6','9','12','15','18','21','24','27','30','33','36','39',
                            '42','45','48','51','54','57','60','63','66','69','72','75','78','81',
                            '84','87','90','93','96','99','102','105','108','111','114','117',
                            '120','123','126','129','132','135','138','141','144','147','150'],
                        splitLine:{
                            show:true
                        },
                        axisLine:{
                            onZero: false
                        },
                        axisLabel:{
                            interval: 1
                        },
                        axisTick:{
                            show: true,
                            interval: 1
                        }
                    },
                    yAxis: {
                        type: 'value',
                        nameLocation: 'middle',
                        nameGap: 40,
                        name: '测量值(mm)',
                        nameTextStyle:{
                            fontSize: 12,
                            fontWeight: 'bold'
                        },
                        min: -120,
                        max: 20,
                        splitNumber: 20
                    },
                    series: [
                        {
                            name:'2016-10-1',
                            type:'line',
                            stack: '总量',
                            symbol:'circle',
                            symbolSize: 5,
                            lineStyle:{
                                normal:{
                                    color: '#20B2AA'
                                }
                            },
                            itemStyle:{
                                normal:{
                                    color: '#20B2AA'
                                }
                            },
                            data:[0, -3, -5, -6, -10, -10, -10, -10, -10, -9, -8, -8, -8, -9,
                                -9, -11, -13, -16, -17, -19, -21, -23, -24, -25, -25, -25, -27, -28,
                                -30, -35, -50, -60, -75, -78, -80,  -90, -100, -100, -88, -60,
                                -38, -32, -25, -16, -15, -11, -6, -8, -5, -4, 0]
                        }
                    ]
                };

                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);

                //利用ajax从数据库取出坐标点的集合，存放到临时数组
                var index = new Array();
                var coorArrayx = new Array();
                var coorArrayy = new Array();
                $.ajax({
                    url: location.protocol+"//"+location.host+"/MetroProject"+"/asset",
                    type: "GET",
                    async: false,
                    success: function (data) {

                        var ajaxobj = JSON.parse(data);
                        for(var i=0;i<ajaxobj.length;i++)
                        {
                            index[i] = ajaxobj[i].id;
                            coorArrayx[i] = ajaxobj[i].positionx;
                            coorArrayy[i] = ajaxobj[i].positiony;
                        }
                    }
                });

                //百度地图跟随运动
                function movingMap(params){

                    //如果存在原有的黄色圆环，首先清除掉
                    var allOverlay = map.getOverlays();
                    for (var i = 0; i < allOverlay.length; i++){
                        var str = allOverlay[i].toString();
                        if(str == '[object Marker]'){
                            map.removeOverlay(allOverlay[i]);
                        }
                    }

                    var x = coorArrayx[params[0].name/3];
                    var y = coorArrayy[params[0].name/3];

                    var pt = new BMap.Point(x, y);
                    //地图移动到指定点中心
                    map.panTo(pt);

                    //此处添加黄色标记圆环图示
                    var myIcon = new BMap.Icon('${pageContext.request.contextPath}/static/image/icon.png', new BMap.Size(20,18));
                    var marker2 = new BMap.Marker(pt,{icon:myIcon});  // 创建标注
                    map.addOverlay(marker2);  // 将标注添加到地图中
                }

            </script>
        <%--</div>--%>
    </div>

</div>



<!--javascript 脚本-->
<script src="${pageContext.request.contextPath}/static/js/bootstrap.min.js"></script>

<!--Icons图标-->
<script src="${pageContext.request.contextPath}/static/js/lumino.glyphs.js"></script>

<%--全局自定义js文件--%>
<script src="${pageContext.request.contextPath}/static/js/global-define.js"></script>

<%--模块自己的js文件--%>
<script src="${pageContext.request.contextPath}/static/js/module-monitor.js"></script>

<%--滑动侧边栏的js文件--%>
<script src="${pageContext.request.contextPath}/static/js/BootSideMenu.js"></script>
<script src="${pageContext.request.contextPath}/static/js/UpDownBootSideMenu.js"></script>
<script src="${pageContext.request.contextPath}/static/js/sidebarcontrol.js"></script>