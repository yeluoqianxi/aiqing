
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
    <title></title>
     <script src="http://libs.baidu.com/jquery/1.9.0/jquery.js"></script>
</head>
<body>
<script type="text/javascript"> 
     // 请求数据函数
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
barArray=get_asp_josn_string({ sql_CJ:"成型" })
//console.log(get_asp_josn_string({ sql_CJ:"成型" }))
//document.write(barArray)

let arr_sets= barArray.split('<br/>')
//document.write("车间滚动明细数据")
//document.write(arr_sets[0])
//document.write("各车间累计实际周期")
//document.write(arr_sets[1])

document.write("车间实际周期与计划周期折线图")
var sets_zqts_zxzxt=arr_sets[3]
//var sets_zq_zxt_str=JSON.stringify(sets_zq_zxt)
var sets_zqts_zxzxt_list=JSON.parse(sets_zqts_zxzxt)
//var sets_zq_zxt_list=eval('(' + sets_zq_zxt + ')')
console.log(sets_zqts_zxzxt_list)

var sets_zqts_zxzxt_list_count= Object.keys(sets_zqts_zxzxt_list).length;
console.log(sets_zqts_zxzxt_list_count)


//document.write(sets_zq_zxt_list)
//console.log(sets_zq_zxt)
//console.log(typeof sets_zq_zxt)
//console.log(typeof sets_zq_zxt_list)

 var sets_zqts_zxzxt_list_count_mc=new Array()
 var sets_zqts_zxzxt_list_count_ts=new Array()
 var sets_zqts_zxzxt_list_count_zq=new Array()

 for (var i=0;i<sets_zqts_zxzxt_list_count;i++){
     sets_zqts_zxzxt_list_count_mc.push(sets_zqts_zxzxt_list[i].GXMC)
     sets_zqts_zxzxt_list_count_ts.push(sets_zqts_zxzxt_list[i].wgts)
     sets_zqts_zxzxt_list_count_zq.push(sets_zqts_zxzxt_list[i].wgzq)     
 }
console.log(sets_zqts_zxzxt_list_count_mc)
console.log(sets_zqts_zxzxt_list_count_ts)
console.log(sets_zqts_zxzxt_list_count_zq)



//document.write(typeof sets_zq_zxt_list)
//document.write("车间各工序 订单数量与平均计划周期")
//write(arr_sets[3])

//document.write("各车间产能饱和度")
//document.write(arr_sets[4]) 
</script>
</body>
</html>