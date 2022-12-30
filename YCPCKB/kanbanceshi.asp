
<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>页面布局</title>             
<meta charset="utf-8" />
<meta maximum-scale="1.0", user-scalable="0"/>
<script type="text/javascript" src="https://cdn.staticfile.org/echarts/4.3.0/echarts.min.js"> </script>
<script src="https://www.itxst.com/package/jquery-3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="Data.js"></script>
<script type="text/javascript" src="Date.js"></script>
<!--<script type="text/javascript" src="ajax.js"></script>-->

<style type="text/css">
  html{height:100%}
  #biaotitle{
  width:100%;
  height:10%;
  opacity:1.8;
  /*background-color:black*/
  }

  .title{
  width:30%;
  height:60%;
  font-size:4rem;
  font-weight:700;
  font-family:sans-serif;
  color:white;
  opacity:1;
  margin:0 auto;
  }

  #title1{
  width:40%;
  height:30%;
  float:right;
  /*display: table-cell;*/                      /*此元素会作为一个表格单元格显示*/
  /*vertical-align: middle;*/                   /*垂直居中*/
  text-align:center;                            /*水平居中*/
  color:white;
  font-size:2rem;
  font-weight:400;
  font-family:sans-serif;
  opacity:0.8;
  }
  body{
  background-color:darkgray;
  background: url("bj.jpg") no-repeat center center;
  background-size:cover;
  height: 100%;
  padding: 0;
  opacity:0.8; 
  }
  #chars
  {
  width:40%;
  height:87%;
  color:snow;   
  float:left;
  margin-top:15px
  }
  #zhifangtu{
  height:60%;
  color:black;
  margin-top:20px
  }
  #mingxi{
  /*background-color:slategray;*/
  height:40%;
  width:100%;
  opacity:1;
   /*overflow:auto */
  }
  #msg1{
  /*background-color:slategray;*/
  margin-left:20px;
  height:80%;
  width:88%;
  opacity:1;
  /*
  overflow:hidden;
  overflow:auto */
  }
  #gundo{
  /*background-color:slategray;*/
  height:80%;
  overflow:auto;
  }
  #gundunbiaoti {
  text-align:center;                            /*水平居中*/
  color:white;
  font-size:28px;
  font-weight:600;
  font-family:sans-serif;
  margin-top:0;
  opacity:1; 
  }
  #anniu{
  /*background-color:blue;*/
  width:10%;
  height:80%;
  float:left;
  margin-top:10px;
  opacity:1;  
  }  
  .anniu{  
  background-color:hsla(240,100%,64%,0.5);
  width:80%;
  height:6%; 
  /*line-height:6%;*/
  /*margin-left:2px;*/
  margin-top:10px;
  color:white;
  font-size:15px;
  font-weight:800;
  border:6px solid lavender;
  border-radius:50%;
  text-align: center
  }
  #chars1
  {
  width:50%;
  height:87%;
  color:snow;   
  float:right;
  margin-top:15px
  }
  #shanxin1{
  /*background-color:slategray;*/
  height:40%;
  width:100%;
  opacity:1;
  }
  #shanxinzhanbi{
  /*background-color:peachpuff;*/
  height:100%;
  width:35%;
  float:left;
  }
  #zhouqizf{
  /*background-color:peachpuff;*/
  height:100%;
  width:60%;
  float:right;
  }
  #zhexiantu{
  width:100%;
  height:57%;
  float:right;
  margin-top:15px
  }

</style> 
<!--#include file="../conn.asp"-->
<!--#include file="button.asp"-->
</head>
<body> 

<%
dim aiqing
aiqing=JSONstr
%>


<div id="biaotitle">
    <div class="title">  周期看板  </div>
    <div id="title1">
    </div>
</div>
<div id="chars">

  <div id="mingxi"> 
  </div>

  <div id="zhifangtu" name="初始值">
  </div>
</div> 
<div id="anniu" name="成型">
</div>
<div id="chars1">
  <div id="shanxin1">
    <div id="shanxinzhanbi">
    </div>
    <div id="zhouqizf">
    </div>
  </div>
  <div id="zhexiantu">
  </div>
</div>

<script type="text/javascript">
  var  zifu=<%=aiqing%>;
  //console.log(JSON.stringify(user))
  var  shenm=JSON.stringify(zifu)
  var  obj=JSON.parse(shenm)    //$.parseJSON(shenm) var obj = eval('(' + asdd + ')');
  var  count = Object.keys(obj).length;
  //console.log(count);
  //console.info(obj);
  //console.log(obj[6].cjmc)
  //console.log(obj[6].cjmc)
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
  document.getElementById("anniu").name=canshu
  document.getElementById("zhifangtu").name=canshu
  alert(document.getElementById("anniu").name)
  //$(document).ready(function(get_date()))
  get_date()
  })

  /*
  if (canshu='')
  {
  window.location.href='yemianzhanshi.asp?userId='+obj[0].cjmc;
  }
  else
  {
  window.location.href = 'yemianzhanshi.asp?userId='+canshu;
  }
  */
</script>
<script type="text/javascript">
 get_data1()
</script>
</body>
      
</html>