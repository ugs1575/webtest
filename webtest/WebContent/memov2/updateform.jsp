<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/dbopen.jsp" %>

<%int memono = Integer.parseInt(request.getParameter("memono"));

	
	sql.append(" select memono, title, content ");
	sql.append(" from memo ");
	sql.append(" where memono=? ");
	
	pstmt = con.prepareStatement(sql.toString());
	pstmt.setInt(1, memono);
	
	rs = pstmt.executeQuery();
	if(rs.next()){
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
margin-top:20px;
margin-bottom:20px;
}
table{
width:50%;
margin: 0 auto
}
table,th,td{
border:1px solid black;
border-collapse:collapse;
}
</style> 
<script type="text/javascript">
function input(f){
	if(f.title.value==""){
		alert("제목을 변경하세요");
		f.title.focus();
		return false;
	}
	if(f.content.value==""){
		alert("내용을 변경하세요");
		f.content.focus();
		return false;
	}
}
</script>
</head> 
<body> 
<div>수정</div>
<form name="frm" method="POST" action="./updateProc.jsp" 
onsubmit="return input(this)">
<input type="hidden" name="memono" value="<%=memono %>">
<table>
<tr>
<th>제목</th>
<td>
<input type="text" name="title" size="30" value="두시회의"/>
</td>
</tr>
<tr>
<th>내용</th>
<td>
<textarea rows="10" cols="30" name="content"><%=rs.getString("content")%></textarea>
</td>
</tr>
</table>
<div>
<input type="submit" value="수정">
</div>
</form>
</body> 
</html>
<%} %> 
<%@ include file="../ssi/dbclose.jsp" %>