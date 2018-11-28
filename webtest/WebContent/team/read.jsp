<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file = "../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="team.TeamDAO"/>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	
	TeamDTO dto = dao.read(no);
	
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
div{
	text-align: center;
	margin-top:  20px;
}
table{
	width :50%;
	margin: 5px auto;
}
th,td{
 	padding: 5px;
}
table,th,td{
	border:1px solid black;
	border-collapse:collapse;
}
</style>
<script type="text/javascript">
function tlist(){
	var url = "list.jsp";
	location.href = url;
}
</script> 
</head> 
<body> 
<jsp:include page="/menu/top.jsp"/>
<div>조회</div>
<table>
	<tr>
		<th>이름</th>
		<td><%=dto.getName() %></td>
	</tr>
	<tr>
		<th>성별</th>
		<td><%=dto.getGender() %></td>
	</tr>
	<tr>
		<th>보유기술</th>
		<td><%=dto.getSkills() %></td>
	</tr>
	<tr>
		<th>번호</th>
		<td><%=dto.getPhone() %></td>
	</tr>
	<tr>
		<th>취미</th>
		<td><%=dto.getHobby() %></td>
	</tr>
	<tr>
		<th>우편번호</th>
		<td><%=dto.getZipcode() %></td>
	</tr>
	<tr>
		<th>주소1</th>
		<td><%=dto.getAddress() %></td>
	</tr>
	<tr>
		<th>주소2</th>
		<td><%=dto.getAddress2() %></td>
	</tr>


</table>
<div>
	<button type="button" onclick="tlist()">목록</button>
</div>
<jsp:include page="/menu/bottom.jsp"/>
</body> 
</html> 