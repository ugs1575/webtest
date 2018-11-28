<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 
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
<div>삭제 확인</div>
<form method="post" action="deleteProc.jsp">
<input type="hidden" name="memono" value="<%=memono%>">
<div>
삭제를 하면 복구 될 수 없습니다.<br><br>
삭제하시려면 삭제버튼을 클릭하세요<br><br>
취소는 '목록'버튼을 누르세요
<br><br>
<input type="submit" value="삭제처리">
<input type="button" value="목록" onclick="location.href='./list.jsp'">
</div>
</form> 
</body> 
</html> 