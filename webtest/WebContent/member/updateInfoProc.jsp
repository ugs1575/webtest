<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>
<jsp:useBean id="dto" class="member.MemberDTO"/>

<%
String id = request.getParameter("id");
String mname = request.getParameter("mname");
String tel = request.getParameter("tel");
String email = request.getParameter("email");
String zipcode = request.getParameter("zipcode");
String address1 = request.getParameter("address1");
String address2 = request.getParameter("address2");
String job = request.getParameter("job");

//System.out.println(" new password: "+ newPasswd);
boolean flag = dao.changeInfo(id,mname,tel,email,zipcode,address1,address2,job);
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
 
<DIV class="title">정보 수정 처리</DIV>

<div class="content">
<% if(flag){
	out.print("정보 수정을 성공했습니다.");
}else{
	out.print("정보 수정을 실패했습니다.");
}
%>
</div>

<%if(flag){ %>
 <div class='bottom'>
 	<input type = 'button' value='로그인' onclick="location.href='loginForm.jsp'">
 	<input type = 'button' value='홈' onclick="location.href='../list.jsp'">
 </div>
 <%}else{ %>
  <div class='bottom'>
 	<input type = 'button' value='다시시도' onclick="history.back()">
 	<input type = 'button' value='홈' onclick="location.href='../list.jsp'">
 </div>
 <%} %>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 