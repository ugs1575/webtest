<%@ page contentType="text/html; charset=UTF-8" %> 
<%
if(rs!=null){
rs.close();
}
if(pstmt!=null){
pstmt.close();
}
if(con!=null){
con.close();
}
%>