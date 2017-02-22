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
});