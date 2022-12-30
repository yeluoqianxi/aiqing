<!--#include file="../conn_17.asp"-->
<% Response.Addheader "Content-Type","text/html; charset=UTF-8"  %> 
<%  
    dim  rs,con,sql,count,result,count1
    set  con=Server.CreateObject("ADODB.Connection")
    con.open  connStr
    set rs=Server.CreateObject("ADODB.Recordset") 
    sql="SELECT distinct cjmc  FROM  JSSC_PCSJKB_HZSJ_GH  WHERE Typec='折线图' order by cjmc "
    rs.open  sql,con,1,1 

%>                    
<%  
  
    Dim i,JSONstr 
    If  Not (rs.EOF And rs.BOF)  Then
        rs.MoveFirst
        While Not rs.EOF
             JSONstr = JSONstr + "{"
             For i = 0 To rs.Fields.Count - 1         '得到rs文件的字段索引   rs.Fields.Count为文件的字段个数
               ''判断数据类型
               'Select Case rs.Fields(i).Type         
               '    Case DataTypeEnum.dbCurrency   
               '        '货币类型
               '        JSONstr = JSONstr + """" + rs.Fields(i).Name + """:" + CStr(rs.Fields(i).Value) + ","
               '        
               '    Case DataTypeEnum.dbBigInt, DataTypeEnum.dbDecimal, DataTypeEnum.dbFloat, DataTypeEnum.dbInteger, DataTypeEnum.dbLong, DataTypeEnum.dbDouble, DataTypeEnum.dbNumeric, DataTypeEnum.dbSingle
               '        '数值类型
               '        JSONstr = JSONstr + """" + rs.Fields(i).Name + """:" + CStr(rs.Fields(i).Value) + ","
               '    Case Else
               '        '文本类型
               '        JSONstr = JSONstr + """" + rs.Fields(i).Name + """:""" + CStr(rs.Fields(i).Value) + ""","
               'End Select
               'Next
                JSONstr = JSONstr + """" + rs.Fields(i).Name + """:""" + CStr(rs.Fields(i).Value) + ""","
                JSONstr = Left(JSONstr, Len(JSONstr) - 1)       '少取一位，去掉最后一个键值对的,号  加右边界 
                '右边界
                JSONstr = JSONstr + "},"
            next 
            rs.MoveNext
        wend
        JSONstr = Left(JSONstr, Len(JSONstr) - 1)     '去掉大括号，改为中括号  最终将其序列化
        JSONstr = "[" + JSONstr + "]"                       
        response.Write(JSONstr)
   end if
%>  
<%
    rs.close
    con.close
    set rs = Nothing
    set con = Nothing
%>      

<% Response.Addheader "Content-Type","text/html; charset=UTF-8"  %> 
<%  
    dim  rs,con,sql,count,result,count1
    set  con=Server.CreateObject("ADODB.Connection")
    con.open  connStr
    set rs=Server.CreateObject("ADODB.Recordset") 
    sql="SELECT distinct cjmc  FROM  JSSC_PCSJKB_HZSJ_GH  WHERE Typec='折线图' order by cjmc "
    rs.open  sql,con,1,1  

    result=rs.Getrows
    count=ubound(result,2)
    rs.close
    '重新打开数据集
    rs.Open sql,con,1,1
    'jsonStr = " "
    'rows = " "
%>                    
<%                    
    ' 字符分割标识
    'response.Write("@")       
    Dim anniu() 
    Redim anniu(count)      
    Dim i
    For i=0 To count
        'Set myArray(i) = server.createobject("scripting.dictionary")
        For Each e In rs.Fields  
       
        'response.Write(cstr(e.value))
        anniu(i)=cstr(e.value)
        Next            
        'response.Write(myArray(i))
        'response.Write(rs.Fields.Count)
    Rs.movenext     
    Next  
    ' Dim j
    ' For j=0 To count
    '     response.Write(myArray(j)+"</br>")
    ' next
    'json.tolist()  
%>  
<%
    rs.close
    con.close
    set rs = Nothing
    set con = Nothing
%>  