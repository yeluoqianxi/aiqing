<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>页面布局</title>             
<meta charset="utf-8" />
<script type="text/javascript" src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"> </script>
<script src="https://www.itxst.com/package/jquery-3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="Data.js"></script>
<script type="text/javascript" src="Date.js"></script>
<style type="text/css">
  #biaotitle{
  width:100%;
  height:80px;
  opacity:0.8;
  background-color:black
  }
  .title{
  width:30%;
  height:30%;
  font-size:35px;
  font-weight:700;
  font-family:sans-serif;
  color:blue;
  opacity:1.4;
  margin:0 auto;
  }
  #title1{
  width:40%;
  height:100px;
  float:right;    
  /*display: table-cell;*/                      /*此元素会作为一个表格单元格显示*/
  /*vertical-align: middle;*/                   /*垂直居中*/
  text-align:center;                            /*水平居中*/
  color:red;
  font-size:40px;
  font-weight:400;
  font-family:sans-serif;
  }
  body{
  background-color:darkgray;
  background: url("bj.jpg") no-repeat center center;
  background-size:cover;
  }
  #chars
  {
  width:50%;
  height:625px;
  color:snow;
  float:left;
  }
  #zhifangtu{
  background-color:red;
  height:425px;
  color:black;
  }
  #shanxin{
  background-color:slategray;
  height:200px;
  width:100%;
  opacity:0.7;
  }
  #shanxindong{
  background-color:pink;
  height:100%;
  width:40%;
  float:left;
  }
  #shanxinzhanbi{
  background-color:peachpuff;
  height:100%;
  width:60%;
  float:left;
  }
  #anniu{
  background-color:blue;
  width:10%;
  height:625px;
  float:left;
  }  
  .anniu{  
  background-color:green;
  width:78%;
  height:5.5%; 
  margin-left:10px;
  margin-top:5px;
  border:6px solid red;
  color:white;
  font-size:10px;
  font-weight:800;
  text-align: center; 
  }
  #zhexiantu{
  width:40%;
  height:600px;
  float:right
  }
  ul li{
  list-style: none;
  height: 40px;
  line-height: 40px;
  text-align: left;
  font-size: 9px;
  color: #333;
  }
</style> 
<!--#include file="../conn_17.asp"-->
<!--#include file="button.asp"-->
<!--#include file="Get_Ddmx.asp"-->
</head>
<body>
<%
dim aiqing
aiqing=JSONstr
%>
<%
dim keyi
keyi=JSONstr1
%>
<div id="biaotitle">
    <p class="title">  一次排产看板  </p>
    <div id="title1">
    </div>
</div>
<div id="chars">
  <div id="zhifangtu">
  </div>
  <div id="shanxin">
    <div id="shanxindong">
    </div>
    <div id="shanxinzhanbi">
    </div>
  </div>
</div> 

<div id="anniu">
</div>

<div id="zhexiantu">
</div>
<script type="text/javascript">
  sadasd=<%=keyi%>
  var aiqi=JSON.stringify(sadasd)
  var obj1=JSON.parse(aiqi) //$.parseJSON(shenm) var obj = eval('(' + asdd + ')');
  var count1 = Object.keys(obj1).length;
  document.getElementById("shanxindong").innerHTML='<marquee behavior="scroll" direction="up" vspace="10px" scrollamount=3.5><ul class="msg1" id="msg1"></ul></marquee>' 
  for (var i=0;i<count1;i++){
  a='<li>';
  a+=obj1[i].cjmc +'\xa0\xa0\xa0\xa0\xa0\xa0'+obj1[i].gxmc+ '\xa0\xa0\xa0\xa0\xa0\xa0' + obj1[i].dd_pcy+':'+obj1[i].ddbh;
  a+='<li>';
  $("#msg1").append(a);
  console.log(obj1[0])
  }
</script>
<script type="text/javascript">
  var  zifu=<%=aiqing%>;
  //console.log(JSON.stringify(user))
  var  shenm=JSON.stringify(zifu)
  var obj=JSON.parse(shenm)    //$.parseJSON(shenm) var obj = eval('(' + asdd + ')');
  var count = Object.keys(obj).length;
  console.log(count);
  console.info(obj);
  console.log(obj[6].cjmc)
  console.log(obj[6].cjmc)
  for (var i=0;i<count;i++){
  a='<div class="anniu">';
  a+='<p>';
  a+=obj[i].cjmc;
  a+='</p>';
  a+='</div>';
  $("#anniu").append(a);
  }
</script>
<script type="text/javascript">
  //window.location.href='yemianzhanshi.asp?userId='+obj[0].cjmc;
  $(".anniu").click(function(){
  ///var canshu=$(".anniu").innerHTML
  var canshu=$(this).text()
  //alert(canshu)
  //alert(window.location.href)
  window.location.href='yemianzhanshi.asp?userId='+canshu;
  })
  /*
  if (canshu='')
  {
  window.location.href = 'yemianzhanshi.asp?userId=' +obj[0].cjmc;
  }
  else
  {
  window.location.href = 'yemianzhanshi.asp?userId='+canshu;
  }
  */
</script>
</body>
</html>