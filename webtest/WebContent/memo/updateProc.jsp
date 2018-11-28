<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.sql.DriverManager"  %>
<%@ page import="java.sql.Connection"  %>
<%@ page import="java.sql.PreparedStatement"  %>
<% request.setCharacterEncoding("utf-8"); %> 
<%
int memono =
Integer.parseInt(request.getParameter("memono"));

	
String title = request.getParameter("title");
String content = request.getParameter("content");

String url ="jdbc:oracle:thin:@127.0.0.1:1521:XE";
String user = "soldesk";
String password = "1234";
String driver = "oracle.jdbc.driver.OracleDriver";

Class.forName(driver);

Connection con = DriverManager.getConnection(url,user,password);

	StringBuffer sql = new StringBuffer();
	sql.append(" update memo ");
	sql.append(" set	title =?, ");
	sql.append(" 	content = ? ");
	sql.append(" where memono = ? ");
	
	PreparedStatement pstmt =
			con.prepareStatement(sql.toString());
	
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
<%
if(pstmt!=null)pstmt.close();
if(con!=null)pstmt.close();

%>