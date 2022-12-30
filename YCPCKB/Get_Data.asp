<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta charset="utf-8" />
<title> 获取数据</title>    
<!--#include file="../conn_17.asp"-->
</head>
<body>
   <% 
       dim  rs,con,sql,count,biaoqian
       set  con=Server.CreateObject("ADODB.Connection")
       con.open  connStr
       biaoqian="五金外加工"
       response.Write(con)
       set rs=Server.CreateObject("ADODB.Recordset") 
       sql="SELECT * FROM  JSSC_PCSJKB_HZSJ_GH  WHERE Typec='折线图' and cjmc='"&biaoqian&"' order by nowtime"
       response.Write(sql)
       rs.open  sql,con,1,1  
       'response.Write(ubound(rs.Getrows,2)+1)
       'response.Write(ubound(rs.Getrows,1)+1)
       'count=rs.Getrows(-1,0,[0:13])
       'response.Write(rs("cjmc"))
    
        Arr_Cate=rs.getrows
        '字段是第一维度，记录是第二维度

        Dim Arr_CateNumS,Arr_CateNumI
        Arr_CateNumS=Ubound(Arr_Cate,2)  '得到数组中数据的下标

        Dim myArray()
        Redim myArray(Arr_CateNumS)

        For Arr_CateNumI=0 To Arr_CateNumS 
        Response.Write("车间："&Arr_Cate(1,Arr_CateNumI)&" | 计划周期："&Arr_Cate(5,Arr_CateNumI)&" | 实际周期："&Arr_Cate(6,Arr_CateNumI)&"  | 时间："&Arr_Cate(10,Arr_CateNumI)&" <br>")
        Next
  %>
    
  <%
    rs.close
    con.close
    set rs = Nothing
    set con = Nothing
  %>
    
</body>
</html>
