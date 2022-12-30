<%@ Page Language="C#" %>

<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
    <title>获取按钮</title>    
    <style>
       #MyDiv{
       width:400px;
       height:600px;
       }

    </style>
</head>
<body>
  
    <div id="MyDiv"></div>
    <script>
   
   function AddButton() {
         var MyDiv=document.getElementById("MyDiv");
         var bt =document.createElement("button");           //createElement生成button对象
         bt.innerHTML = '删除'; 
         bt.onclick = function () {                          //绑定点击事件
             delete(this.parentNode.parentNode.id);
         };
         pictureDiv.appendChild(bt);                         //添加到页面
    }
    </script>
</body>

    
</html>
