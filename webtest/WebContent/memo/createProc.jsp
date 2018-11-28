<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ page import="java.sql.DriverManager"  %>
<%@ page import="java.sql.Connection"  %>
<%@ page import="java.sql.PreparedStatement"  %>
<% request.setCharacterEncoding("utf-8"); %> 
<%
String title = request.getParameter("title");
String content = request.getParameter("content");

String url ="jdbc:oracle:thin:@127.0.0.1:1521:XE";
String user = "soldesk";
String password = "1234";
String driver = "oracle.jdbc.driver.OracleDriver";

Class.forName(driver);

Connection con = DriverManager.getConnection(url,user,password);

	StringBuffer sql = new StringBuffer();
	sql.append(" insert into memo(memono, title, content, wdate) ");
	sql.append(" values(memo_seq.nextval,?,?,sysdate) ");
	
	PreparedStatement pstmt =
			con.prepareStatement(sql.toString());
	
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
<%
if(pstmt!=null){
pstmt.close();
}
if(con!=null){
con.close();
}
%>