
/**
 * Created by Administrator on 2016/10/28.
 */


$(document).ready(function () {

    //给当前模块菜单添加active效果
    $('#menu-monitor').addClass('active');
    
    var baiduURL = project_url + "/asset";
    showAssetTypes(baiduURL, 0);
    
});



//在百度地图上显示设备绿点，当参数类型为0--所有设备点；1--类型1设备点；2--类型2设备点。
function showAssetTypes(requestUrl, type) {

    //首先清空原有的百度覆盖点
    if(map != null){
        map.clearOverlays();
    }

    //数组收集坐标点容器
    var points = [];

    //Ajax获取服务器端坐标点
    $.ajax({
        url: requestUrl,
        type: "GET",
        success: function (data) {

            var ajaxobj = JSON.parse(data);

            for(var i=0;i<ajaxobj.length;i++)
            {
                if(type == 0){
                    var posx = ajaxobj[i].positionx;
                    var posy = ajaxobj[i].positiony;
                    var p = new BMap.Point(posx, posy);
                    p.data = 3*i+1;
                    points.push(p);
                    continue;
                }
                else{
                    alert('错误的管片设施类型！');
                }
            }

            var options = {
                size: BMAP_POINT_SIZE_NORMAL,
                shape: BMAP_POINT_SHAPE_CIRCLE,
                color: '#008B00'
            }

            var pointCollection = new BMap.PointCollection(points, options);


            //鼠标悬停事件
            pointCollection.addEventListener('mouseover', function (e) {

                var txt = e.point.data;
                //对于小于10的数字前面添加‘0’
                if(txt < 10)
                {
                    txt = '0' + txt;
                }
                //创建自定义覆盖物
                var myOverlay = new SquareOverlay(new BMap.Point(e.point.lng, e.point.lat), txt);
                map.addOverlay(myOverlay);
            });

            //鼠标离开事件
            pointCollection.addEventListener('mouseout', function (e) {

                var labellist = map.getOverlays();
                for(var i=0;i<labellist.length;i++)
                {
                    if(labellist[i].type == 'customOverlay')
                    {
                        map.removeOverlay(labellist[i]);
                    }
                }
            });

            map.addOverlay(pointCollection);
        }
    });
}



/*var map=null;
function RunBaiduMap(requestUrl){
    
}*/


function getBoundary(){
    var bdary = new BMap.Boundary();
    bdary.get("南京市", function(rs){       //获取行政区域
                                         //map.clearOverlays();        //清除地图覆盖物
        var count = rs.boundaries.length; //行政区域的点有多少个
        if (count === 0) {
            alert('未能获取当前输入行政区域');
            return ;
        }
        //var pointArray = [];
        for (var i = 0; i < count; i++) {
            var ply = new BMap.Polygon(rs.boundaries[i], {strokeWeight: 2, strokeColor: "#ffffff"}); //建立多边形覆盖物
            map.addOverlay(ply);  //添加覆盖物
        }
    });
}



//自定义地铁环片的覆盖物标识

// 1.定义自定义覆盖物的构造函数
function SquareOverlay(/*center, length, color*/point, text){

    this._point = point;
    this._text = text;
    this.type = 'customOverlay';
}

// 2.继承API的BMap.Overlay
SquareOverlay.prototype = new BMap.Overlay();

// 3.实现初始化方法
SquareOverlay.prototype.initialize = function(map){

    // 保存map对象实例
    this._map = map;
    // 创建div元素，作为自定义覆盖物的容器
    var div = document.createElement("div");
    div.style.position = "absolute";
    // 可以根据参数设置元素外观
    div.style.width = 63 + "px";
    div.style.height = 41 + "px";
    div.style.background = "url('"+ project_url +"/static/image/label.png')";

    var span = document.createElement("span");
    div.appendChild(span);
    span.appendChild(document.createTextNode(this._text));
    span.style.position = "absolute";
    span.style.top = 10 + "px";
    span.style.left = 20 + "px";

    // 将div添加到覆盖物容器中
    map.getPanes().markerPane.appendChild(div);
    // 保存div实例
    this._div = div;
    // 需要将div元素作为方法的返回值，当调用该覆盖物的show、hide方法，或者对覆盖物进行移除时，API都将操作此元素。
    return div;
}

// 实现绘制方法
SquareOverlay.prototype.draw = function(){
    // 根据地理坐标转换为像素坐标，并设置给容器
    var position = this._map.pointToOverlayPixel(this._point);
    this._div.style.left = position.x + "px";
    this._div.style.top = position.y -20 + "px";
}


