<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp" %>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	
	AddressDAO dao = new AddressDAO();
	AddressDTO dto = dao.read(no);
	
	String name = request.getParameter("name");
	String phone = request.getParameter("phone");
	String zipcode = request.getParameter("zipcode");
	String address = request.getParameter("address");
	String address2 = request.getParameter("address2");
	
	dto.setName(name);
	dto.setPhone(phone);
	dto.setZipcode(zipcode);
	dto.setAddress(address);
	dto.setAddress2(address2);
	
	boolean flag = dao.update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
div#title {
	width: 30%;
	margin: 20px auto;
	margin-top: 20 px;
	border: 1px solid black;
}
div{
	text-align: center;
	padding: 20px;
	margin: 50px;
}
</style>
<script type="text/javascript">
function tlist(){
	var url = "list.jsp";
	url = url + "?col=<%=request.getParameter("col")%>"
	url = url + "&word=<%=request.getParameter("word")%>"
	url = url + "&nowPage=<%=request.getParameter("nowPage")%>"
	location.href=url;
}
</script>
</head>
<body>
<div id = "title">수정 결과</div>
<div>
	<%
		if (flag) {
			out.print("수정 완료!");
		}else{
			out.print("수정 실패!");
		}
	%>
</div>
<div id="title">
	<button type="button" onclick="tlist()">목록</button>
</div>
</body>
</html>
