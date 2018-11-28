<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="address.AddressDAO"/>

<%
	int no = Integer.parseInt(request.getParameter("no"));
	dao.upViewcnt(no);
	AddressDTO dto = dao.read(no);
	
%> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function tupdate(){
	var url = "updateForm.jsp";
	url = url + "?no=<%=no%>";
	location.href = url;
}
function tdel(){
	var url = "delete.jsp";
	url = url + "?no=<%=no%>";
	location.href = url;
}
function treply(){
	var url = "replyForm.jsp";
	url = url + "?no=<%=no%>";
	location.href = url;
}
function tlist(){
	var url = "list.jsp";
	location.href = url;
}
</script>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
} 
div {
	text-align: center;
	margin: 20px 0px;
	padding: 5px;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 5px;
}

table {
	width: 60%;
	margin: auto;
}

th, td {
	padding: 10px;
}
</style>
</head> 
<body> 
<jsp:include page = "/menu/top.jsp" flush="false"/>
<div><%=no%>번 항목 조회</div>
<table>
	<tr>
		<th>이름</th>
		<td><%=dto.getName() %></td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td><%=dto.getPhone() %></td>
	</tr>
	<tr>
		<th>우편번호</th>
		<td><%=dto.getZipcode() %></td>
	</tr>
	<tr>
		<th>주소</th>
		<td><%=dto.getAddress() %></td>
	</tr>
	<tr>
		<th>상세주소</th>
		<td><%=dto.getAddress2() %></td>
	</tr>
</table>
<div>
<button onclick="tlist()">목록</button>
<button onclick="location.href='createForm.jsp'">등록</button>
<button onclick="tupdate()">수정</button>
<button onclick="tdel()">삭제</button>
<button onclick="treply()">답변</button>
</div>
<jsp:include page = "/menu/bottom.jsp" flush="false"/>
</body> 
</html> 