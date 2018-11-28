<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/dbopen.jsp" %>
<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");


	sql.append(" insert into memo(memono, title, content, wdate) ");
	sql.append(" values(memo_seq.nextval,?,?,sysdate) ");
	
	pstmt = con.prepareStatement(sql.toString());
	
	pstmt.setString(1, title);
	pstmt.setString(2, content);
	
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
	out.print("메모를 등록했습니다.");
}else{
	out.print("메모등록이 실패했습니다.");
}
%>
<br>
<input type="button" value="계속 등록"
onclick="location.href='./createForm.jsp'">
<input type="button" value="목록"
onclick="location.href='./list.jsp'">

</div>
</body> 
</html> 
<%@ include file="../ssi/dbclose.jsp" %>