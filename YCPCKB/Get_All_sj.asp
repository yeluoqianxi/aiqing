<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<% Response.Addheader "Content-Type","text/html; charset=UTF-8"%>
<!--#include file="../conn.asp"-->
<%
  function geshihua(setss)
    Dim i_1
    Dim JSONstr_1
    If  Not (setss.EOF And setss.BOF)  Then
        setss.MoveFirst
        While Not setss.EOF
            JSONstr_1=JSONstr_1+ "{"
            For i_1= 0 To setss.Fields.Count - 1
            JSONstr_1 = JSONstr_1 + """"+ cstr(setss.Fields(i_1).Name)+""":""" + cstr(setss.Fields(i_1).Value) +""","
            next 
        JSONstr_1 = Left(JSONstr_1,Len(JSONstr_1) - 1)
        JSONstr_1 =JSONstr_1+"},"
        setss.MoveNext
    wend
    JSONstr_1=Left(JSONstr_1, Len(JSONstr_1) - 1)
    JSONstr_1="[" + JSONstr_1 + "]"
    end if
    geshihua=JSONstr_1
end function
%>

<% 
function get_rs(sql_yj)
  dim  rs,con,sql
  set  con=Server.CreateObject("ADODB.Connection")
  con.open  connStr
  set  rs=Server.CreateObject("ADODB.Recordset")
  sql=sql_yj
  rs.open  sql,con,1,1 
  'response.Write("我爱你")
  get_rs=geshihua(rs)
  rs.close
  con.close
  set rs= Nothing
  set con= Nothing
end function 
%>

<%
'车间滚动明细数据   完成
dim cj 
    cj =request.Item("sql_CJ")
    'response.Write("我爱你-------")
    'response.Write(cj)

dim dad,json_str
dad="SELECT top 100 CJMC,DD_PCY,DDBH,GXMC,WGSJ,LJSJ,FCSJ,HEBJ FROM JSSC_PCSJKB_MXSJ_GH where cjmc='"&cj&"' order by wgsj"
json_str=get_rs(dad)
response.Write(json_str)
response.Write("<br/>")

'各车间累计实际周期  完成
dim dad4,json_str4
dad4="SELECT all_jhzq ,wg_jhzq,wg_sjzq  FROM  JSSC_PCSJKB_HZSJ_GH  WHERE TYPEC='各车间指标' and cjmc='"&cj&"'"
response.Write(get_rs(dad4))
response.Write("<br/>")

'车间实际周期与计划周期折线图  完成
dim dad1,json_str1
dad1="SELECT cjmc,convert(decimal(10,2),wg_jhzq) wg_jhzq,convert(decimal(10,2),wg_sjzq)wg_sjzq FROM JSSC_PCSJKB_HZSJ_GH  WHERE Typec='折线图' and cjmc='"&cj&"' order by nowtime"
json_str1=get_rs(dad1)
response.Write(json_str1)
'response.Write(get_rs(dad1))
response.Write("<br/>")

'车间各工序 订单数量与平均计划周期 完成
dim dad2,json_str2
dad2="SELECT CJMC,GXMC,Wg_ddts wgts,WG_SJZQ wgzq FROM  JSSC_PCSJKB_HZSJ_GH  WHERE TYPEC='数量周期' and cjmc='"&cj&"' "
response.Write(get_rs(dad2))
response.Write("<br/>")


'各车间产能饱和度  完成
dim dad3,json_str3
dad3="SELECT CJMC,All_Jhzq zcl,WG_JHZQ wccl,WG_SJZQ wwccl FROM  JSSC_PCSJKB_HZSJ_GH WHERE TYPEC='车间产能' and cjmc='"&cj&"' "
response.Write(get_rs(dad3))
response.Write("<br/>")
%>