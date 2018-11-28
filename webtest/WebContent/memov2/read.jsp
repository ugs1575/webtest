<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/dbopen.jsp" %>

<% 

int memono = Integer.parseInt(request.getParameter("memono"));


//조회수 증가
sql.append(" update memo ");
sql.append(" set viewcnt = viewcnt + 1 ");
sql.append(" where memono = ? ");

pstmt = con.prepareStatement(sql.toString());

pstmt.setInt(1,memono);

pstmt.executeUpdate();
//조회수 증가end

sql.delete(0, sql.length());

sql.append(" select memono,title,content, ");
sql.append(" to_char(wdate,'yyyy-mm-dd') wdate, viewcnt ");
sql.append(" from memo ");
sql.append(" where memono=? ");

pstmt = con.prepareStatement(sql.toString());
pstmt.setInt(1,memono);

rs = pstmt.executeQuery();
String content = null;
if(rs.next()){
	content = rs.getString("content");
	content = content.replace("\r\n","<br>");
}
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
 margin-bottem:20px;
}
table{
 width:60%;
 margin:0 auto;
}
table,th,td{
border:1px solid black;
border-collapse:collapse;
}
th,td{
padding:10px;
}
</style> 
<script type="text/javascript">
function mcreate(){
	var url = "createform.jsp";
	location.href=url;
}
function mupdate(memono){
var url = "updateform.jsp";
url += "?memono="+memono;
location.href=url;
}
function mdelete(memono){
	var url = "deleteForm.jsp";
	url += "?memono="+memono;
	location.href=url;
}
function mlist(){
	var url = "list.jsp";
	location.href=url;
	}
</script>
</head> 
<body>
<div>조회</div>
<table>
<tr>
<th>제목</th>
<td><%=rs.getString("title") %></td>
</tr>
<tr>
<th>내용</th>
<td><%=content %></td>
</tr>
<tr>
<th>조회수</th>
<td><%=rs.getInt("viewcnt") %></td>
</tr>
<tr>
<th>등록일</th>
<td><%=rs.getString("wdate") %></td>
</tr>
</table> 
<div>
<input type="button" value="등록" onclick="mcreate()">
<input type="button" value="수정"
onclick="mupdate('<%=rs.getInt("memono") %>')">
<input type="button" value="삭제"
onclick="mdelete('<%=rs.getInt("memono") %>')">
<input type="button" value="목록" onclick="mlist()">

</div>

</body> 
</html> 
<%@ include file="../ssi/dbclose.jsp" %>