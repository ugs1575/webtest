<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>

<% int memono = Integer.parseInt(request.getParameter("memono")); %>
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
margin-top:20px;
margin-bottom:20px;
}
</style>
</head> 
<body>
<jsp:include page="/menu/top.jsp"/>

<div>삭제 확인</div>
<form method="post" action="deleteProc.jsp">
<input type="hidden" name="memono" value="<%=memono%>">
<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
<div>
삭제를 하면 복구 될 수 없습니다.<br><br>
삭제하시려면 삭제버튼을 클릭하세요<br><br>
취소는 '목록'버튼을 누르세요
<br><br>
<input type="submit" value="삭제처리">
<input type="button" value="목록" onclick="history.back()">
</div>
</form> 
<jsp:include page="/menu/bottom.jsp"/>
</body> 
</html> 