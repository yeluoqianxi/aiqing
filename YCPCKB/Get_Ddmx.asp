
<% Response.Addheader "Content-Type","text/html; charset=UTF-8"%>
<%  
  dim  rs1,con1,sql1,cjcs
  cjcs="滚镀"                           'request.querystring("canshu")
  set  con1=Server.CreateObject("ADODB.Connection")
  con1.open  connStr
  set rs1=Server.CreateObject("ADODB.Recordset") 
  sql1="SELECT  GXMC,DD_PCY,DDBH,WGSJ,LJSJ,FCSJ,HEBJ FROM JSSC_PCSJKB_MXSJ_GH  where cjmc='"+cjcs+"'"
  rs1.open  sql1,con1,1,1 
%>

<%
  Dim io
  Dim JSONstr1
  If  Not (rs1.EOF And rs1.BOF)  Then
        rs1.MoveFirst
        While Not rs1.EOF
            JSONstr1 = JSONstr1 + "{"
            For io = 0 To rs1.Fields.Count - 1
                JSONstr1 = JSONstr1 + """" + rs1.Fields(io).Name + """:""" + CStr(rs1.Fields(io).Value) + ""","     
            next
            JSONstr1 = Left(JSONstr1, Len(JSONstr1) - 1)
            JSONstr1 = JSONstr1 + "},"
            rs1.MoveNext
        wend
        JSONstr1=Left(JSONstr1,Len(JSONstr1)-1)
        JSONstr1="["+JSONstr1+"]"
        'response.Write(JSONstr1)
  end if
%>
<%
  rs1.close
  con1.close
  set rs1 = Nothing
  set con1 = Nothing
%>