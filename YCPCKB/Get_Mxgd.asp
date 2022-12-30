<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
    <title> 滚动效果 </title>
<script src="https://www.itxst.com/package/jquery-3.5.1/jquery.min.js"></script>
<style type="text/css">
  * {
      margin: 0;
      padding: 0;
  }
  .box {
      width: 400px;
      height: 250px;
      margin: 100px auto;
      border: 1px solid #000;
      border-radius: 20px;
      box-shadow: 5px 5px 10px #333;
      overflow: hidden;
  }
  h3 {
      height: 50px;
      line-height: 50px;
      text-align: center;
      font-size: 28px;
      color: #fff;
      background: green;
  }
  .content {
      height:200px;
      overflow: hidden;
  }
  ul li {
      list-style: none;
      height: 40px;
      line-height: 40px;
      text-align: left;
      padding-left: 20px;
      font-size: 18px;
      color: #333;
  }
</style>
</head>
<!--#include file="Get_Ddmx.asp"-->
<%
  dim keyi
  keyi=JSONstr1  '先将服务器变量读取出来
%>
<body>
<div class="box">
  <h3>订单信息列表</h3>
  <div class="content" id="content">
  <marquee behavior="scroll" direction="up" vspace="10px" scrollamount=3.5>
  <ul class="msg1" id="msg1"></ul>
  </marquee>
  </div>
</div>
<script type="text/javascript">
  //console.log(JSON.stringify(user))
  sadasd=<%=keyi%>
  var aiqi=JSON.stringify(sadasd)
  var obj1=JSON.parse(aiqi) //$.parseJSON(shenm) var obj = eval('(' + asdd + ')');
  var count1 = Object.keys(obj1).length;
  /*     
  console.log(count);
  console.info(obj);
  console.log(obj[6].cjmc)
  console.log(obj[6].cjmc)
  */
  for (var i=0;i<count1;i++){
  a='<li>';
  a+=obj1[i].cjmc +'\xa0\xa0\xa0\xa0\xa0\xa0'+obj1[i].gxmc+ '\xa0\xa0\xa0\xa0\xa0\xa0' + obj1[i].dd_pcy+':'+obj1[i].ddbh;
  a+='<li>';
  $("#msg1").append(a);
  console.log(obj1[0])
  }
</script>
<!--<script type="text/javascript">
  var content=document.getElementById("content");
  var msg1=document.getElementById("msg1");
  /*
  var msg2=document.getElementById("msg2");
  msg2.innerHTML=msg1.innerHTML;
  */
  var timer=50;
  content.scrollTop=0;
  function myScrollTop(){
  if(content.scrollTop>content.scrollHeight){
  content.scrollTop=0;
  content.scrollTop++
  }
  else{
  content.scrollTop++
  }
  }
setInterval('myScrollTop()',timer);
</script>-->
</body>
</html>