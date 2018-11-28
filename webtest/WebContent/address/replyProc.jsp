<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="address.AddressDTO"/> 
<jsp:useBean id="dao" class="address.AddressDAO"/>
<jsp:setProperty name="dto" property="*" />
<% 
Map map = new HashMap();
map.put("grpno",dto.getGrpno());
map.put("ansnum",dto.getAnsnum());
bdao.upAnsnum(map);

boolean flag = dao.replyCreate(dto);
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
function alist(){
	var url = "list.jsp";
	location.href=url;
}
</script>
</head> 
<body> 
<div id="title">처리결과</div>
<div>
<%
	if(flag){
		out.print("답변 등록 성공!");
	}else{
		out.print("답변 등록 실패!");
	}
%>
</div>
<div>
<button onclick="location.href='replyForm.jsp'">계속 등록</button>
<button onclick="alist()">목록</button>
</div>
</body> 
</html> 