<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp" %>
<%
String id = (String)session.getAttribute("id");
String grade=(String)session.getAttribute("grade");
String str = null;
String title="나의 여행 블로그";
if(id!=null && grade.equals("A")){
	   title="관리자 페이지";
}
if(id==null){
	str ="메인 페이지 입니다. 로그인 부탁드릴게요...........>3<";
} else{
	
	str = "안녕하세요 "+id+" 님 <3";
}





%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-size: 20px; 
} 
</style> 
<link href="${root}/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp"/>
 
<DIV class="title"><%=title %></DIV>

<div class="content">
<h1><%=str %></h1>

<% if(id==null) {%>
<button onclick="location.href='loginForm.jsp'">로그인</button>
<%} else{ %>
<button onclick="location.href='logout.jsp'">로그아웃</button>
<%} %>

</div>
 

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 