
function get_asp_josn_string(relation) {
    var isTrue = false;
    var str;
    $.ajax({
        url: "http://localhost:54323/Get_All_sj.asp",
        type: "post",
        async: false,
        dataType: "text",
        data: relation,                                       //发送到服务器的数据
        success: function(data) {
            str = data
        },
        error: function() {
            alert("启动失败！")
            that.attr("disabled", false);
            isTrue = false;
        }
    });
    return str;
}
// 请求的条件
/*
function get_date_ss(sads){
var disdis = {
   sql_CJ:asds
    }
console.log(get_asp_josn_string(disdis))
}
*/

/*
console.log(get_asp_josn_string({sql_CJ:"成型" }))
*/

function get_date(){
var dasda
dasda=document.getElementById("anniu").name
//console.log(dasda) 
var bar_relations = {
  sql_CJ:dasda
}
barArray=get_asp_josn_string(bar_relations)
console.log(barArray)
}

/*
var dasda
    dasda=document.getElementById("anniu").getAttribute("name")
console.log(dasda)
var bar_relations={
    sql_CJ:dasda
}
*/

