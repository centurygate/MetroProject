/**
 * Created by Administrator on 2017/1/12.
 */

$(function () {

    //给当前模块菜单添加active效果
    $(function () {
        $('#menu-3dimension').addClass('active');
    })
  
    //初始加载Skyline窗口
    var flyPath = project_url+"/static/fly/Default.fly";
    sgworld.Project.Open(flyPath);

    //socket URL地址及监听连接
    var sockurl = project_url+'/add';
    connect();

    //区域定位的点击响应
    $('#menu-position').click(function () {

        var objid = sgworld.ProjectTree.FindItem('initialize');
        var obj = sgworld.ProjectTree.GetObject(objid);
        sgworld.Navigate.FlyTo(obj, 14);
    });


    var cnt = 0.2;
    //地下模式的点击响应
    $('#menu-underground').click(function () {

        sgworld.Command.Execute(1027, 0);
    });


/*    function switchHighlight() {
        var objid = sgworld.ProjectTree.FindItem('scale');
        var obj = sgworld.ProjectTree.GetObject(objid);

        var g= 128.0*(1.0-(cnt-0.2)/0.8);
        obj.Terrain.Tint.abgrColor = sgworld.Creator.CreateColor(255, g, 0, 255).ToABGRColor();
        cnt+=0.05;
    }*/


    //三维模块中添加WebSocket的通信设置，这里监听实时数据发生的异常
    function connect() {

        var socket = new SockJS(sockurl);
        if((socket == undefined) || (socket == null))
        {
            console.log("(socket == undefined) || (socket == null)");
        }

        var stompClient = Stomp.over(socket);
        stompClient.connect({}, function(frame) {

            console.log('Connected: ' + frame);

            stompClient.subscribe('/topic/showResult', function(calResult){
                //console.log(calResult);
                var measures = JSON.parse(calResult.body);

                //设置超过监测区间之后的闪亮反应：图片替换成异常叉号；管片高亮颜色逐步加深；
                if(measures.value >1.0 || measures.value <0.0)
                {
                    alert("mistake value!!");
                    return;
                }
                if(measures.value < 0.2)
                {
                    /*
                    //1.图片替换功能：将叉号的异常状态-->对号的正常状态
                    var objid = sgworld.ProjectTree.FindItem('pic_100');
                    var obj = sgworld.ProjectTree.GetObject(objid);
                    obj.ImageFileName ='E:\\normal.png';

                    //2.模型取消高亮
                    var objid2 = sgworld.ProjectTree.FindItem('seg_100');
                    var obj2 = sgworld.ProjectTree.GetObject(objid2);
                    obj2.Terrain.Tint.abgrColor=0;
                    */

                    //循环5次依次修改5个模型
                    for(var i=1;i<=5;i++)
                    {
                        //set picture
                        var num = 97 +i;
                        var id= 'pic_'+ num.toString();
                        var objid = sgworld.ProjectTree.FindItem(id);
                        var obj = sgworld.ProjectTree.GetObject(objid);
                        obj.ImageFileName = project_url + '/static/image/normal.png';

                        //set model
                        var id2= 'seg_'+ num.toString();
                        var objid2 = sgworld.ProjectTree.FindItem(id2);
                        var obj2 = sgworld.ProjectTree.GetObject(objid2);
                        obj2.Terrain.Tint.abgrColor=0;
                    }
                }
                else{
                    /*
                    //1.图片替换功能：将对号的正常状态-->叉号的异常状态
                    var objid = sgworld.ProjectTree.FindItem('pic_100');
                    var obj = sgworld.ProjectTree.GetObject(objid);
                    obj.ImageFileName ='E:\\exception.png';

                    //2.模型高亮颜色逐步插值加深
                    var objid2 = sgworld.ProjectTree.FindItem('seg_100');
                    var obj2 = sgworld.ProjectTree.GetObject(objid2);
                    var g= 128.0*(1.0-(measures.value-0.2)/0.8);
                    obj2.Terrain.Tint.abgrColor = sgworld.Creator.CreateColor(255, g, 0, 255).ToABGRColor();
                    */

                    //循环5次依次修改5个模型
                    for(var i=1;i<=5;i++)
                    {
                        //set picture
                        var num = 97 +i;
                        var id= 'pic_'+ num.toString();
                        var objid = sgworld.ProjectTree.FindItem(id);
                        var obj = sgworld.ProjectTree.GetObject(objid);
                        obj.ImageFileName = project_url + '/static/image/exception.png';

                        //set model
                        var id2= 'seg_'+ num.toString();
                        var objid2 = sgworld.ProjectTree.FindItem(id2);
                        var obj2 = sgworld.ProjectTree.GetObject(objid2);
                        if(Math.abs(i-3) == 0)
                        {
                            var g= 128.0*(1.0-(measures.value-0.2)/0.8);
                            obj2.Terrain.Tint.abgrColor = sgworld.Creator.CreateColor(255, g, 0, 255).ToABGRColor();
                        }
                        else if(Math.abs(i-3) == 1)
                        {
                            var g= 128.0*(1.0-(measures.value-0.2)/0.8*0.66);
                            obj2.Terrain.Tint.abgrColor = sgworld.Creator.CreateColor(255, g, 0, 255).ToABGRColor();
                        }
                        else if(Math.abs(i-3) == 2)
                        {
                            var g= 128.0*(1.0-(measures.value-0.2)/0.8*0.33);
                            obj2.Terrain.Tint.abgrColor = sgworld.Creator.CreateColor(255, g, 0, 255).ToABGRColor();
                        }
                    }
                }
            });
        });
    }
})