<!--#include file="yemianzhanshi.asp"-->


function getQueryUrlString(name) {
var reg = new RegExp('(^|&)' + name + '=([^&]*)(&|$)', 'i');
var r = window.location.search.substr(1).match(reg);
if(r != null) {
return decodeURI(r[2]);
}
return "请选择";
}
$("#s").click(function(){
var userId = getQueryString('Id');
var dialogId=getQueryString('name');
alert(Id;
alert(name);
})

<%
dim a
a=canshu
response.Write(a) 
%> 

