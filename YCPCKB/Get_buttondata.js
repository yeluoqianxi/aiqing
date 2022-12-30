// 请求数据函数
function get_asp_josn_string(relation) {
    var isTrue = false;
    var str;
    $.ajax({
        url: "../getbutton.asp",
        type: "post",
        async: false,
        dataType: "text",
        data: relation,
        success: function(data) {
            str = data
        },
        error: function() {
            alert("启动失败！")
            that.attr("disabled", false);
            isTrue = false;
        }
    });
  
  return str
 }
function aasdsa(str){
      var asd=document.getElementById('qushu')
      asd.innerHTML="我爱你"
}