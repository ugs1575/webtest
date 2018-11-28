<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>
<jsp:useBean id="dto" class="member.MemberDTO"/>

<%
String id = request.getParameter("id");
String passwd = request.getParameter("passwd");


Map map = new HashMap();
map.put("id", id);
map.put("pw", passwd);

boolean flag = dao.loginCheck(map);
dto = dao.read(id);
String name = dto.getMname();
System.out.println("name>>>>>>>>>"+name);

if(flag){
	String grade = dao.getGrade(id);
	session.setAttribute("id",id);
	session.setAttribute("grade",grade);
}

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
 
<DIV class="title">로그인 결과</DIV>
<div class="content">
<%if(flag){ %> 
<%=name %> 님 로그인 축하드립니다 ㅎㅅㅎ
**********환영합니당~~*************

<%} else{ %>
로그인 실패 ㅠㅅㅠ
<%} %>
</div>

  <DIV class='bottom'>
    <input type='button' value='홈' onclick="location.href='index.jsp'">
    <input type='button' value='다시 시도' onclick="history.back()">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 