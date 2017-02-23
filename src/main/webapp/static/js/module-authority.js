/**
 * Created by Administrator on 2016/12/5.
 */

function html_encode(str) {
    var s = "";
    if (str.length == 0) return "";
    s = str.replace(/&/g, "&gt;");
    s = s.replace(/</g, "&lt;");
    s = s.replace(/>/g, "&gt;");
    s = s.replace(/ /g, "&nbsp;");
    s = s.replace(/\'/g, "&#39;");
    s = s.replace(/\"/g, "&quot;");
    s = s.replace(/\n/g, "<br>");
    return s;
}
function html_decode(str) {
    var s = "";
    if (str.length == 0) return "";
    s = str.replace(/&gt;/g, "&");
    s = s.replace(/&lt;/g, "<");
    s = s.replace(/&gt;/g, ">");
    s = s.replace(/&nbsp;/g, " ");
    s = s.replace(/&#39;/g, "\'");
    s = s.replace(/&quot;/g, "\"");
    s = s.replace(/<br>/g, "\n");
    return s;
}
function SelfConfirm(type, content) {
    var self = this;
    if (typeof(content) == "object" && Object.prototype.toString.call(content).toLowerCase() == "[object object]" && !content.length) {
        this.content = JSON.stringify(content);
    }
    else {
        this.content = content;
    }
    this.confirmtype = type;
    this.confirmobj = {
        icon: 'glyphicon glyphicon-info-sign',
        title: '提示',
        content: self.content,
        type: 'blue',
        typeAnimated: true,
        columnClass: 'col-md-3',
        buttons: {
            close: {
                text: '关闭',
                btnClass: 'btn-blue',
                action: function () {
                    return;
                }
            }
        }
    };
    if (this.confirmtype == 'info') {
        this.confirmobj.icon = 'glyphicon glyphicon-info-sign';
        this.confirmobj.title = '提示';
        this.confirmobj.type = 'blue';
        this.confirmobj.buttons.close.btnClass = 'btn-blue';
    }
    else if (this.confirmtype == 'warn') {
        this.confirmobj.icon = 'glyphicon glyphicon-warning-sign';
        this.confirmobj.title = '警告'
        this.confirmobj.type = 'red';
        this.confirmobj.buttons.close.btnClass = 'btn-red';
    }
    else {
        console.log("Passing Wrong type parameter");
        return null;
    }

    this.showTip = function () {

        $.confirm(self.confirmobj);
    };
}

var orignAuthArray = new Array();
var curentAuthArray = new Array();
$(document).ready(function () {

    //给当前模块菜单添加active效果
    $(function () {
        $('#menu-authority').addClass('active');
    })

    //Enable Bootstrap-checkbox via JavaScript:
    $(':checkbox').checkboxpicker();

    $('#sel').change(function () {
        var userid = $("#sel").val();

        var requesturi = "service/rest/getAuthByName?userid=" + userid;
        $.getJSON(requesturi, function (resources_data) {

            // var confirm = new SelfConfirm('info', JSON.stringify(resources_data));
            // confirm.showTip();
            $(":checkbox[name='userauthorities']").prop("checked", false);
            var resource;
            var resource_id;
            for (resource in resources_data) {
                resource_id = resources_data[resource].id;
                orignAuthArray.push(resource_id);

                $(":checkbox[value='" + resource_id + "']").prop("checked", true);
            }
            // var selfconfirm = new SelfConfirm('info', "Origin Auth: " + orignAuthArray);
            // selfconfirm.showTip();
        });
    });
    $('#changeauthority').click(function () {
        var selecteduser = $("#sel").val().trim();
        if (selecteduser == "-请选择用户-" || selecteduser.length == 0) {
            var selconfirm = new SelfConfirm('warn', '请先选择用户!');
            selconfirm.showTip();
            return;
        }
        var hidden_var_name;
        var hidden_value;
        $.ajax({
            type: "GET",
            url: "getcsrf",
            async: false,
            success: function (data, status) {
                // var selconfirm = new SelfConfirm('info', "Ajax GET ${pageContext.request.contextPath}/innerchauth" + " </br>Result As Below:</br>" + html_encode(data));
                // selconfirm.showTip();
                console.log("==================================================");
                console.log(status);
                console.log("||||||||||||||||||||||||||||||||||||||||||||||||||");
                console.log(data);
                var string_array = data.match(new RegExp('.*hidden.*', "gi"));
                console.log("***********************************");
                console.log(string_array);
                hidden_var_name = string_array[0].match(new RegExp('name=.*'), "gi");
                hidden_var_name = hidden_var_name[0].split('"');
                hidden_var_name = hidden_var_name[1];
                console.log(hidden_var_name);
                hidden_value = string_array[0].match(new RegExp('value=.*'), "gi");
                hidden_value = hidden_value[0].split('"');
                hidden_value = hidden_value[1];
                console.log(hidden_value);
            },
            error: function (data, status) {
                console.log("xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx");
                console.log("Status: " + status);
                console.log("Data: " + data);
            },

        });
        $("#authlist p input[type=checkbox]").each(function () {
            //var chk = $(this).find("[checked]");
            if (this.checked) {
                var authid = $(this).val();
                console.log("authid = " + authid);
                curentAuthArray.push(authid);
            }
        });
        // var selconfirm = new SelfConfirm('info', "Current Auth: " + curentAuthArray);
        // selconfirm.showTip();
        var addauth = "";
        var delauth = "";
        var bfind = false;
        var local_iter_i = 0;
        var local_iter_j = 0;
        for (local_iter_i = 0; local_iter_i < curentAuthArray.length; local_iter_i++) {
            bfind = false;
            for (local_iter_j = 0; local_iter_j < orignAuthArray.length; local_iter_j++) {
                if (curentAuthArray[local_iter_i] == orignAuthArray[local_iter_j]) {
                    bfind = true;
                }
            }
            if (bfind == false) {
                if (addauth.length == 0) {
                    addauth = addauth + curentAuthArray[local_iter_i];
                }
                else {
                    addauth = addauth + "," + curentAuthArray[local_iter_i];
                }
            }
        }
        local_iter_i = 0;
        local_iter_j = 0;
        bfind = false;

        for (local_iter_i = 0; local_iter_i < orignAuthArray.length; local_iter_i++) {
            bfind = false;
            for (local_iter_j = 0; local_iter_j < curentAuthArray.length; local_iter_j++) {
                if (orignAuthArray[local_iter_i] == curentAuthArray[local_iter_j]) {
                    bfind = true;
                }
            }
            if (bfind == false) {
                if (delauth.length == 0) {
                    delauth = delauth + orignAuthArray[local_iter_i];
                }
                else {
                    delauth = delauth + "," + orignAuthArray[local_iter_i];
                }
            }
        }

        orignAuthArray.length = 0;
        curentAuthArray.length = 0;
        local_iter_i = 0;
        local_iter_j = 0;
        if ((addauth.length == 0) && (delauth.length == 0)) {
            var selconfirm = new SelfConfirm('info', '所选用户权限未做更改!');
            selconfirm.showTip();
            return;
        }
        if (addauth.length == 0) {
            addauth = "none";
        }
        if (delauth.length == 0) {
            delauth = "none";
        }
        var senddata = "userid=" + $("#sel").val() + "&addauth=" + addauth + "&delauth=" + delauth + "&" + hidden_var_name + "=" + hidden_value;
        $.ajax({
            type: "POST",
            url: "doinnerchanuth",
            data: senddata,
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            dataType: "json",
            success: function (data) {
                console.log(data);
                JSON.stringify(data);
                console.log("userid:" + $("#sel").val() + "</br> Added Auth: " + addauth + "</br> Del Auth: " + delauth + "</br>" + JSON.stringify(data));
                var selconfirm = new SelfConfirm('info', "更改成功");
                selconfirm.showTip();

            },
            error: function (msg) {
                var selconfirm = new SelfConfirm('warn', msg);
                selconfirm.showTip();
//                        alert(msg);
            }
        });
    })
});