<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<% request.setCharacterEncoding("utf-8"); 
String url="jdbc:oracle:thin:@127.0.0.1:1521:XE";
String user = "soldesk";
String password = "1234";
String driver ="oracle.jdbc.driver.OracleDriver";

Class.forName(driver);

Connection con = DriverManager.getConnection(url,user,password);

StringBuffer sql = new StringBuffer();
sql.append(" select memono,title, ");
sql.append(" to_char(wdate,'yyyy-mm-dd') wdate, viewcnt ");
sql.append(" from memo ");
sql.append(" order by memono DESC ");
PreparedStatement pstmt =con.prepareStatement(sql.toString());

ResultSet rs = pstmt.executeQuery();
%> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function read(memono){
	//alert(memono);
	var url="./read.jsp";
	url = url +"?memono="+memono;
	location.href=url;
	
}
</script>
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
	table{
	width: 60%;
	margin: 0 auto
	}
	table,th,td{
	border:1px solid black;
	border-collapse:collapse;
	}
	th,td{
	padding:10px
	}
	a:LINK {
color:#000000;
text-decoration: none;
}
a:VISITED {
color:#000000;
text-decoration: none;
}
a:HOVER {
color:#ff0000;
text-decoration: none;
}
a:ACTIVE {
color:#000000;
text-decoration: none;
}
</style> 
</head> 
<body>
<div>
메모목록
</div>
<table>
<tr>
<th>번호</th>
<th>제목</th>
<th>날짜</th>
<th>조회수</th>
</tr>
<%if(rs.next()==false){ %>
<td colspan="4">등록된 메모가 없습니다.</td>
</tr>
<%}else{
	do{
	%>
	<tr>
	<td><%=rs.getInt("memono") %></td>
	<td><a href="javascript:read('<%=rs.getInt("memono") %>')"><%=rs.getString("title") %></a></td>
	<td><%=rs.getString("wdate") %></td>
	<td><%=rs.getString("viewcnt") %></td>
	</tr>
	<%}while(rs.next());
}//if-end
%>
</table>
<div>
<input type="button" value="등록"
onclick="location.href='./createForm.jsp'">
</div>
</body> 
</html> 
<%
if(rs!=null)rs.close();
if(pstmt!=null)pstmt.close();
if(con!=null)con.close();
%>