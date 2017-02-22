/**
 * Created by Administrator on 2017/2/15.
 */


//给当前模块菜单添加active效果
$(function () {
    $('#menu-sheet').addClass('active');


    //添加echarts的图表0(占位表格)=========================================================================================
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('null0'));

    // 指定图表的配置项和数据
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
            data: [],
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
                data:[]
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);
    
    //添加echarts的图表1==================================================================================================
    // 基于准备好的dom，初始化echarts实例
    myChart = echarts.init(document.getElementById('left-manualshoulian'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '左线-人工水平收敛',
            x: 'left',
            padding: 0
        },
        tooltip: {
            trigger: 'axis',
            formatter: '环号：{b0} <br/> 累计变化量：{c0}(mm)'
        },
        legend: {
            data:['2016-10-1'],
            y:  'bottom',
            padding: 0
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
            data: [],
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
            min: -20,
            max: 100,
            splitNumber: 12
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
                data:[]
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);

    // 使用Ajax同步获取图表数据
    ajaxData('/sheet1', myChart);


    //添加echarts的图表2==================================================================================================
    // 基于准备好的dom，初始化echarts实例
    myChart = echarts.init(document.getElementById('right-manualshoulian'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '右线-人工水平收敛',
            x: 'left',
            padding: 0
        },
        tooltip: {
            trigger: 'axis',
            formatter: '环号：{b0} <br/> 累计变化量：{c0}(mm)'
        },
        legend: {
            data:['2016-10-1'],
            y:  'bottom',
            padding: 0
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
            data: [],
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
            min: -20,
            max: 100,
            splitNumber: 12
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
                data:[]
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);

    // 使用Ajax同步获取图表数据
    ajaxData('/sheet2', myChart);


    //添加echarts的图表3==================================================================================================
    // 基于准备好的dom，初始化echarts实例
    myChart = echarts.init(document.getElementById('left-daochuangchenjiang'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '左线-道床沉降',
            x: 'left',
            padding: 0
        },
        tooltip: {
            trigger: 'axis',
            formatter: '环号：{b0} <br/> 累计变化量：{c0}(mm)'
        },
        legend: {
            data:['2016-10-1'],
            y:  'bottom',
            padding: 0
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
            data: [],
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
            min: -100,
            max: 20,
            splitNumber: 12
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
                data:[]
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);

    // 使用Ajax同步获取图表数据
    ajaxData('/sheet3', myChart);

    //添加echarts的图表4==================================================================================================
    // 基于准备好的dom，初始化echarts实例
    myChart = echarts.init(document.getElementById('right-daochuangchenjiang'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '右线-道床沉降',
            x: 'left',
            padding: 0
        },
        tooltip: {
            trigger: 'axis',
            formatter: '环号：{b0} <br/> 累计变化量：{c0}(mm)'
        },
        legend: {
            data:['2016-10-1'],
            y:  'bottom',
            padding: 0
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
            data: [],
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
            min: -100,
            max: 20,
            splitNumber: 12
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
                data:[]
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);

    // 使用Ajax同步获取图表数据
    ajaxData('/sheet4', myChart);

    //添加echarts的图表5==================================================================================================
    // 基于准备好的dom，初始化echarts实例
    myChart = echarts.init(document.getElementById('left-horizonshift'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '左线-水平位移',
            x: 'left',
            padding: 0
        },
        tooltip: {
            trigger: 'axis',
            formatter: '环号：{b0} <br/> 累计变化量：{c0}(mm)'
        },
        legend: {
            data:['2016-10-1'],
            y:  'bottom',
            padding: 0
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
            data: [],
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
            min: -5,
            max: 25,
            splitNumber: 6
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
                data:[]
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);

    // 使用Ajax同步获取图表数据
    ajaxData('/sheet5', myChart);

    //添加echarts的图表6==================================================================================================
    // 基于准备好的dom，初始化echarts实例
    myChart = echarts.init(document.getElementById('right-horizonshift'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '右线-水平位移',
            x: 'left',
            padding: 0
        },
        tooltip: {
            trigger: 'axis',
            formatter: '环号：{b0} <br/> 累计变化量：{c0}(mm)'
        },
        legend: {
            data:['2016-10-1'],
            y:  'bottom',
            padding: 0
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
            data: [],
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
            min: -5,
            max: 25,
            splitNumber: 6
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
                data:[]
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);

    // 使用Ajax同步获取图表数据
    ajaxData('/sheet6', myChart);

    //添加echarts的图表7==================================================================================================
    // 基于准备好的dom，初始化echarts实例
    myChart = echarts.init(document.getElementById('left-horizonconvergence'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '左线-水平收敛',
            x: 'left',
            padding: 0
        },
        tooltip: {
            trigger: 'axis',
            formatter: '环号：{b0} <br/> 累计变化量：{c0}(mm)'
        },
        legend: {
            data:['2016-10-1'],
            y:  'bottom',
            padding: 0
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
            data: [],
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
            min: 0,
            max: 90,
            splitNumber: 10
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
                data:[]
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);

    // 使用Ajax同步获取图表数据
    ajaxData('/sheet7', myChart);

    //添加echarts的图表8==================================================================================================
    // 基于准备好的dom，初始化echarts实例
    myChart = echarts.init(document.getElementById('right-horizonconvergence'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '右线-水平收敛',
            x: 'left',
            padding: 0
        },
        tooltip: {
            trigger: 'axis',
            formatter: '环号：{b0} <br/> 累计变化量：{c0}(mm)'
        },
        legend: {
            data:['2016-10-1'],
            y:  'bottom',
            padding: 0
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
            data: [],
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
            min: 0,
            max: 90,
            splitNumber: 10
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
                data:[]
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);

    // 使用Ajax同步获取图表数据
    ajaxData('/sheet8', myChart);

    //添加echarts的图表9==================================================================================================
    // 基于准备好的dom，初始化echarts实例
    myChart = echarts.init(document.getElementById('left-manualsettle'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '左线-人工道床沉降',
            x: 'left',
            padding: 0
        },
        tooltip: {
            trigger: 'axis',
            formatter: '环号：{b0} <br/> 累计变化量：{c0}(mm)'
        },
        legend: {
            data:['2016-10-1'],
            y:  'bottom',
            padding: 0
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
            data: [],
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
            min: -100,
            max: 20,
            splitNumber: 12
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
                data:[]
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);

    // 使用Ajax同步获取图表数据
    ajaxData('/sheet9', myChart);

    //添加echarts的图表10=================================================================================================
    // 基于准备好的dom，初始化echarts实例
    myChart = echarts.init(document.getElementById('right-manualsettle'));

    // 指定图表的配置项和数据
    var option = {
        title: {
            text: '右线-人工道床沉降',
            x: 'left',
            padding: 0
        },
        tooltip: {
            trigger: 'axis',
            formatter: '环号：{b0} <br/> 累计变化量：{c0}(mm)'
        },
        legend: {
            data:['2016-10-1'],
            y:  'bottom',
            padding: 0
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
            data: [],
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
            min: -100,
            max: 20,
            splitNumber: 12
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
                data:[]
            }
        ]
    };

    // 使用刚指定的配置项和数据显示图表。
    myChart.setOption(option);

    // 使用Ajax同步获取图表数据
    ajaxData('/sheet10', myChart);
    
    
    
    //独立的函数Function
    function ajaxData(targetURL, myChart) {
        var indexs = new Array();
        var values = new Array();
        $.ajax({
            url: location.protocol+"//"+location.host+"/MetroProject"+ targetURL,
            type: "GET",
            async: false,
            success: function (data) {

                var ajaxobj = JSON.parse(data);
                for(var i=0;i<ajaxobj.length;i++)
                {
                    indexs[i] = ajaxobj[i].index;
                    values[i] = ajaxobj[i].value;
                }

                myChart.setOption({
                    xAxis: {
                        data: indexs
                    },
                    series: [{
                        data: values
                    }]
                });
            }
        });
    }
})