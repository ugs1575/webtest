<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>

<%
String newPasswd = request.getParameter("new_passwd");
String id = request.getParameter("id");
System.out.println(" new password: "+ newPasswd);
boolean flag = dao.changePasswd(id,newPasswd);
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
</style> 
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">비밀번호 변경 처리</DIV>

<div class="content">
<% if(flag){
	out.print("비밀번호를 변경 했습니다.");
}else{
	out.print("비밀번호 변경을 실패했습니다.");
}
%>
</div>

<%if(flag){ %>
 <div class='bottom'>
 	<input type = 'button' value='로그인' onclick="location.href='loginForm.jsp'">
 	<input type = 'button' value='홈' onclick="location.href='../index.jsp'">
 </div>
 <%}else{ %>
  <div class='bottom'>
 	<input type = 'button' value='다시시도' onclick="history.back()">
 	<input type = 'button' value='홈' onclick="location.href='../index.jsp'">
 </div>
 <%} %>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 