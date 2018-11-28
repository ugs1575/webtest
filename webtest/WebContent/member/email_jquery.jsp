<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>

<%
String email = request.getParameter("email");
boolean flag = dao.duplicateId(email);

if(flag){
out.print("중복");
}else{
out.print("사용가능");
}

%>