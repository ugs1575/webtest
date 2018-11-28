<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/dbopen.jsp" %>


<%
int memono = Integer.parseInt(request.getParameter("memono"));



sql.append(" delete from memo ");
sql.append(" where memono = ? ");

pstmt = con.prepareStatement(sql.toString());

pstmt.setInt(1, memono);

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
text-align: center;
margin-top:100px;
}
</style> 
</head> 
<body>
<div>
<%
if(cnt>0){
	out.print("메모를 삭제했습니다.");
}else{
	out.print("메모삭제를 실패했습니다.");
}
%>
<br>
<input type="button" value="목록"
onclick="location.href='./list.jsp'">
</div> 

</body> 
</html> 
<%@ include file="../ssi/dbclose.jsp" %>