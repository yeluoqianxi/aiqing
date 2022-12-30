
<% Response.Addheader "Content-Type","text/html; charset=UTF-8" %>
<%
  dim  rs,con,sql,count,result,count1
  set  con=Server.CreateObject("ADODB.Connection")
  con.open  connStr
  set rs=Server.CreateObject("ADODB.Recordset")
  sql="SELECT distinct cjmc FROM JSSC_PCSJKB_HZSJ_GH WHERE Typec='折线图' order by cjmc"
  rs.open sql,con,1,1
%>
<%
  Dim i
  Dim JSONstr
  If  Not (rs.EOF And rs.BOF)  Then
      rs.MoveFirst
      While Not rs.EOF
           JSONstr = JSONstr + "{"
           For i = 0 To rs.Fields.Count - 1
              JSONstr = JSONstr + """" + rs.Fields(i).Name + """:""" + CStr(rs.Fields(i).Value) + ""","
              JSONstr = Left(JSONstr, Len(JSONstr) - 1)
              JSONstr = JSONstr + "},"
          next
          rs.MoveNext
      wend
      JSONstr = Left(JSONstr,Len(JSONstr) - 1)
      JSONstr = "[" + JSONstr + "]"
      'response.Write(JSONstr)
  end if
%>
<%
  rs.close
  con.close
  set rs = Nothing
  set con = Nothing
%>