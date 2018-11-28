<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/dbopen.jsp" %>
<%
int memono = Integer.parseInt(request.getParameter("memono"));

	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	sql.append(" update memo ");
	sql.append(" set	title =?, ");
	sql.append(" 	content = ? ");
	sql.append(" where memono = ? ");
	
	pstmt = con.prepareStatement(sql.toString());
	
	pstmt.setString(1, title);
	pstmt.setString(2, content);
	pstmt.setInt(3, memono);
	
	int cnt = pstmt.executeUpdate();
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
 text-align:center;
 margin-top:100px;
 }
</style> 
</head> 
<body> 
<div>
<%
if(cnt>0){
	out.print("메모를 수정했습니다.");
}else{
	out.print("메모수정이 실패했습니다.");
}
%>
<br>
<input type="button" value="목록"
onclick="location.href='./list.jsp'">
</div>
</body> 
</html> 
<%@ include file="../ssi/dbclose.jsp" %>