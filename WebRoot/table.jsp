<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.taglibs.standard.tag.common.core.ForEachSupport"%>
<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'table.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	  <style type="text/css">
	 .title{
		 width: 30%;	
		 background-color: #CCC;
		 font-weight: bold;
	 }
	 .content{
	     width:70%;
	     background-color: #CBCFE5;
	 }
	 
   </style>
  </head>
  
  <body>
  		<center>
  		<h1>用户信息</h1>
  		<hr>
  		<jsp:useBean  id="upUser" scope="session" class="timo.User" />
  			<table width="600"  cellpadding="0" cellspacing="0" border="1" >
  			<tr>
  			<td class="title">用户名：</td>
  			<td class="content"><jsp:getProperty property="username" name="upUser" /></td>
  			</tr>
  			<tr>
  			<td class="title">密码：</td>
  			<td class="content"><jsp:getProperty property="password" name="upUser"/></td>
  			</tr>
  			<tr>
  			<td class="title">性别：</td>
  			<td class="content"><jsp:getProperty property="gender" name="upUser"/></td>
  			</tr>
  			<tr>
  			<td class="title">电子邮箱：</td>
  			<td class="content"><jsp:getProperty property="email" name="upUser"/></td>
  			</tr>
  			<tr>
  			<td class="title">出生日期：</td>
  			<td class="content">
  			<%  
  					SimpleDateFormat sdf =new SimpleDateFormat("yyyy年MM月dd日");
  					String date=sdf.format(upUser.getBirthday());
  			 %><%=date %>
  			</td>
  			</tr>
  			<tr>
  			<td class="title">爱好：</td>
  			<td class="content">
  			<% 
  					String[] favorites=upUser.getFavorites();
  					for(String f:favorites){ 					
  					%><%=f%>&nbsp;&nbsp;<%
  					}			
  			%>  			
  			</tr>
  			<tr>
  			<td class="title">城市：</td>
  			<td class="content"><jsp:getProperty property="city" name="upUser"/></td>
  			</tr>
  			<tr>
  			<td class="title">自我介绍：</td>
  			<td class="content"><jsp:getProperty property="introduce" name="upUser"/></td>
  			</tr>
  			<tr>
  			<td class="title">是否同意霸王条款：</td>
  			<td class="content"><jsp:getProperty property="flag" name="upUser"/></td>
  			</tr>	
  			</table>	
  		</center>  		  		  		  		
  </body>
</html>
