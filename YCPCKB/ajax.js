
function get_asp_josn_string(relation) {
    var isTrue = false;
    var str;
    $.ajax({
        url: "http://localhost:54323/Get_All_sj.asp",
        type: "post",
        async: false,
        dataType: "text",
        data: relation,                                       //���͵�������������
        success: function(data) {
            str = data
        },
        error: function() {
            alert("����ʧ�ܣ�")
            that.attr("disabled", false);
            isTrue = false;
        }
    });
    return str;
}
// ���������
/*
function get_date_ss(sads){
var disdis = {
   sql_CJ:asds
    }
console.log(get_asp_josn_string(disdis))
}
*/

/*
console.log(get_asp_josn_string({sql_CJ:"����" }))
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

