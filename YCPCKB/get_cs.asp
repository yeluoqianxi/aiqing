<html>
<head>
<meta charset="UTF-8">
<title>试验VBS获取JS变量 </title>
<script language="javascript">
    var object = {name:"张三",age:20};
</script>
<script language="vbscript">
    Dim jsObj
    ' 获取js脚本中的object对象变量
    Function GetJSObj()
        Set jsObj = GetJsVariableAdvance("object",Nothing)
        MsgBox IsObject(jsObj)
    End Function
    ' 输出对象的值，这里用的是VBS中的变量jsObj
    Function ShowObjPropertys()
        Msgbox "姓名：" & jsObj.name & "   年龄：" & jsObj.age
    End Function 
    '/****************************************************/
    '* 功能：读取JS变量或语句的值，支持返回值为对象
    '* 参数：strVariableName：JS是的变量名或语句，执行后的值可以是字符串也可以是对象
    '* errReturn：出错时的返回值
    '* 返回值： 变量的值或对象，出错时返回errReturn指定值
    '* 编写人：  chenyb
    '* 编写日期：2011-08-13
    '* 其他说明：以下只是方法，根据需要再扩展
    '/****************************************************/
    Function GetJsVariableAdvance(strVariableName,errReturn )
        Dim objScript,qtpGetJsVarObj,rtValue
        On Error Resume Next 
        document.createAttribute "JsVariableAdvanceValue"
        Set objScript = document.createElement( "script" ) 
        objScript.language = "javascript" 
        objScript.type = "text/javascript"
        objScript.defer = true
        objScript.text = "document.JsVariableAdvanceValue = " & strVariableName & ";"
        document.appendChild objScript 
        If IsObject(document.JsVariableAdvanceValue) Then
            Set rtValue = document.JsVariableAdvanceValue
        Else
            rtValue = document.JsVariableAdvanceValue
        End If 
        document.removeChild objScript
        If Err.Number <> 0 Then
            If IsObject(errReturn) Then
                Set GetJsVariableAdvance = errReturn 
            Else
                GetJsVariableAdvance = errReturn 
            End If
        Else 
            If IsObject(rtValue) Then
                Set GetJsVariableAdvance =  rtValue
            Else
                GetJsVariableAdvance =  rtValue
            End If 
        End If 
        On Error Goto 0
    End Function 
</script>
 
</head>
<body>
<input type=button οnclick="GetJSObj();" value="获取对象" />
<input type=button οnclick="ShowObjPropertys();" value="显示对象属性" />
</body>
</html>


　//javascript原生自动滚动
  function startmarquee(lh,speed,delay,marqueeObj) {  //lh---每行列表的高度，speed---滚动的速度，delay---间隔多久滚动一次,marqueeObj---需要实现这个效果的id
      var p=false;
      var t;
      var o=document.getElementById(marqueeObj);  
      o.innerHTML+=o.innerHTML;
      o.style.marginTop=0;
      o.onmouseover=function(){p=true;} //鼠标移入，停止滚动
      o.onmouseout=function(){p=false;}//鼠标移出，继续滚动
      
      function start(){
          t=setInterval(scrolling,speed); //定时器，自动滚动
          if(!p) o.style.marginTop=parseInt(o.style.marginTop)-1+"px";
      }    
      
      function scrolling(){
          if(parseInt(o.style.marginTop)%lh!=0){
              o.style.marginTop=parseInt(o.style.marginTop)-1+"px";
              if(Math.abs(parseInt(o.style.marginTop))>=o.scrollHeight/2) o.style.marginTop=0;
          }else{
              clearInterval(t);
              setTimeout(start,delay);
          }
      }
      setTimeout(start,delay);
  }
  startmarquee(48,20,1000,"marqueebox"); //引用函数


<!--<script type="text/javascript">
  sadasd=<%=keyi%>
  var aiqi=JSON.stringify(sadasd)
  var obj1=JSON.parse(aiqi) //$.parseJSON(shenm) var obj = eval('(' + asdd + ')');
  var count1 = Object.keys(obj1).length;
  //console.log(typeof obj1);
  //console.log(obj1[0].GXMC);
  //console.log(count1)
  document.getElementById("mingxi").innerHTML='<h3 id="gundunbiaoti">订单信息列表</h3>   <ul class="msg1" id="msg1"></ul>' 
  var bsd
  bsd='<tr><td style="word-break: break-all; width: 10%"">工序</td>  <td style="word-break: break-all; width: 10%"">排产员</td>  <td style="word-break: break-all; width: 15%"">合同号</td>   <td style="word-break: break-all; width: 30%"">计划完工时间</td>   <td style="word-break: break-all; width: 20%"">核销标记</td></tr>'
  $("#msg1").append(bsd);
  for (var i=0;i<count1;i++){
  a='<tr>';
  //sql1="SELECT top 5 GXMC,DD_PCY,DDBH,WGSJ,LJSJ,FCSJ,HEBJ FROM JSSC_PCSJKB_MXSJ_GH  where cjmc='"+cjcs+"'"
  a+='<td>'+obj1[i].GXMC+'</td><td>'+obj1[i].DD_PCY+'</td><td>'+obj1[i].DDBH+'</td><td>'+obj1[i].WGSJ+'</td><td>'+obj1[i].HEBJ+'</td>';
  a+='</tr>';
  $("#msg1").append(a);
  //console.log(obj1[0]["gxmc"])
  }
</script>-->



<marquee direction="滚动方向">...</marquee>


　//javascript原生自动滚动
  function startmarquee(lh,speed,delay,marqueeObj) {  //lh---每行列表的高度，speed---滚动的速度，delay---间隔多久滚动一次,marqueeObj---需要实现这个效果的id
      var p=false;
      var t;
      var o=document.getElementById(marqueeObj);  
      o.innerHTML+=o.innerHTML;
      o.style.marginTop=0;
      o.onmouseover=function(){p=true;} //鼠标移入，停止滚动
      o.onmouseout=function(){p=false;}//鼠标移出，继续滚动
      
      function start(){
          t=setInterval(scrolling,speed); //定时器，自动滚动
          if(!p) o.style.marginTop=parseInt(o.style.marginTop)-1+"px";
      }    
      
      function scrolling(){
          if(parseInt(o.style.marginTop)%lh!=0){
              o.style.marginTop=parseInt(o.style.marginTop)-1+"px";
              if(Math.abs(parseInt(o.style.marginTop))>=o.scrollHeight/2) o.style.marginTop=0;
          }else{
              clearInterval(t);
              setTimeout(start,delay);
          }
      }
      setTimeout(start,delay);
  }
  startmarquee(1,20,40,"gundo"); //引用函数


$(function() {
    var $this = $("#news");
    var scrollTimer;
    $this.hover(function() {
        clearInterval(scrollTimer);
    }, function() {
        scrollTimer = setInterval(function() {
            scrollNews($this);
        }, 2000);
    }).trigger("mouseleave");

    function scrollNews(obj) {
        var $self = obj.find("ul");
        var lineHeight = $self.find("li:first").height(); 
        $self.animate({
            "marginTop": -lineHeight + "px"
        }, 600, function() {
            $self.css({
                marginTop: 0
            }).find("li:first").appendTo($self);
        })
    }
})
