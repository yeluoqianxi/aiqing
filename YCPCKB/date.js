/* window.onload=function(){  } */
$(document).ready(function(){
 setInterval(function(){   
    var date=new Date();   
    var year=date.getFullYear(); //获取当前年份
    var mon=date.getMonth()+1; //获取当前月份
    var da=date.getDate(); //获取当前日
    var day=date.getDay(); //获取当前星期几
    var h=date.getHours(); //获取小时
    var m=date.getMinutes(); //获取分钟
    var s=date.getSeconds(); //获取秒
    var d=document.getElementById('title1');
    d.innerHTML=''+year+'年'+mon+'月'+da+'日'+'  '+h+':'+m+':'+s;  },1000)
 })