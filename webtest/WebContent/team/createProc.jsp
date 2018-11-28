<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao"  class="team.TeamDAO"/>
<jsp:useBean id="dto"  class="team.TeamDTO"/>
<jsp:setProperty name="dto" property="*"/>

<% boolean flag = dao.create(dto);  //배열을 문자열로 변경해주는과정  %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
	font-size: 20px;
}
div#title{
 	width:30%;
	margin: 20px auto;
	margin-top: 20 px;
	border : 1px solid black;
}
div{
	text-align:center;
	margin-top:10px;
}
</style>
<script type="text/javascript">
function tlist(){
	
	var url = "list.jsp"
	
	location.href=url;
	
}
</script>
</head>
<body>
	<div id="title">처리결과</div>
	<div>
	<%
		if(flag){
			out.print("팀원이 등록되었습니다.");
			
		}else{
			out.print("팀원 등록이 실패했습니다.");
		}
	
	%>
	
	</div>
	<div id="title">
	<button onclick="location.href='createform.jsp'">다시입력</button>
	<button onclick="tlist()">목록</button>
	</div>
</body>
</html>