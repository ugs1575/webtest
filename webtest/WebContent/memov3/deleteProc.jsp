<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="memo.memoDAO"/>
<%
int memono = Integer.parseInt(request.getParameter("memono"));

boolean flag = dao.delete(memono);
%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 24px; 
} 
div{
text-align: center;
margin-top:100px;
}
</style>
<script type = "text/javascript">
function mlist() {
	var url = "list.jsp";
	url = url + "?col=<%=request.getParameter("col")%>"
	url = url + "&word=<%=request.getParameter("word")%>"
	url = url + "&nowPage=<%=request.getParameter("nowPage")%>"
	location.href = url;
}
</script>
</head> 
<body>
<div>
<%
if(flag){
	out.print("메모를 삭제했습니다.");
}else{
	out.print("메모삭제를 실패했습니다.");
}
%>
<br>
<input type="button" value="목록" onclick="mlist()">
</div>
</body> 
</html> 
