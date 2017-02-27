/**
 * Created by free on 10/14/2016.
 */
$(document).ready(function()
{
    $('#downsidebar').UpDownBootSideMenu({side:"down", autoClose:true});

    $(document).on('click','.toggler', function(){
        var toggler = $(this);
        var container = toggler.parent();
        var status = container.attr('data-status');
        console.log("status = "+status);
        if(!status){
            status = "opened";
        }
        if(status == "closed")
        {
            var updowntoggler = $('.updowntoggler');
            var updowncontainer = updowntoggler.parent();
            updowncontainer.animate({
                width: "100%"
            });
        }
        if(status == "opened")
        {
            var updowntoggler = $('.updowntoggler');
            var updowncontainer = updowntoggler.parent();
            updowncontainer.animate({
                width: "80.1119%"
            });
        }
    });

    $('#switchbtn').click(function () {

        if(chartIdx % 2 == 1) //单数情形-变换为右线逆序
        {
            myChart.setOption({
                title: {
                    text: '管片沉降-左线',
                    x: 'center',
                    padding: 10
                },
                series: [{
                    data: [0, -4, -5, -8, -6, -11, -15, -16, -25, -32, -38, -60, -75, -80,
                        -82, -82.5, -80, -78, -75, -60, -50, -35, -30, -28, -27, -25, -25, -25,
                        -24, -23, -21, -19, -17, -16, -13, -11, -9, -7.5, -6.9, -7.2,
                        -8, -9, -10, -10, -9, -9.2, -10, -6, -5, -3, 0]
                }]
            });

            chartIdx++;
        }
        else{ //双数情形-变换为左线正序
            myChart.setOption({
                title: {
                    text: '管片沉降-右线',
                    x: 'center',
                    padding: 10
                },
                series: [{
                    data: [0, -3, -5, -6, -10, -10, -10, -10, -10, -9, -8, -8, -8, -9,
                        -9, -11, -13, -16, -17, -19, -21, -23, -24, -25, -25, -25, -27, -28,
                        -30, -35, -50, -60, -75, -78, -80,  -90, -100, -100, -88, -60,
                        -38, -32, -25, -16, -15, -11, -6, -8, -5, -4, 0]
                }]
            });

            chartIdx++;
        }
    })
});