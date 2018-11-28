<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="address.AddressDTO"/> 
<jsp:useBean id="dao" class="address.AddressDAO"/>
<jsp:setProperty name="dto" property="*" />
<%
	boolean flag = dao.create(dto);
%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function alist(){
	var url = "list.jsp";
	location.href=url;
}
</script>
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
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<body> 
<jsp:include page="/menu/top.jsp" flush="false"/>
<div class="title">처리결과</div>
<div class="content">
<%
	if(flag){
		out.print("주소 등록 성공!");
	}else{ 
		out.print("주소 등록 실패!");
	}
%>
</div>
<div>
 <input type='button' value='목록' onclick="alist()">
 <input type='button' value='계속 등록' onclick="location.href='createForm.jsp'">
</div>
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body> 
</html> 