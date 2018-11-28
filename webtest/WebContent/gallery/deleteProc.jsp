<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="gallery.GalleryDAO"/>

<%

		int gno = Integer.parseInt(request.getParameter("gno"));
		String pw = request.getParameter("pw");
		
		Map map = new HashMap();
		map.put("gno", gno);
		map.put("pw", pw);
		
		boolean pflag= dao.passwdCheck(map);
		
		boolean flag = false;

		if(pflag){
			flag=dao.delete(gno);
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
  font-size: 20px; 
} 
</style> 
<script type="text/javascript">
function glist(){
	var url = "list.jsp";
	location.href = url;	
}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">처리결과</DIV>
 <div class="content">
<%
 	if(pflag==false){
 		out.print("비밀번호 오류");
%>
 		  </div>
 		  <DIV class='bottom'>
 		    <input type='button' value='다시시도' onclick="history.back()">
 		    <input type='button' value='홈' onclick="location.href='../index.jsp'">
 		  </DIV>
<% 		
 	}else if(flag){
 		out.print("삭제 완료");
%>

  <DIV class='bottom'>
  
   <button type="button" class="btn btn-default btn-sm" onclick="glist()"><span class="glyphicon glyphicon-list"></span> 목록</button>
  </DIV> 	
<% 		
 	}else {
 		out.print("삭제 실패");
%>
<button type="button" class="btn btn-default btn-sm" onclick="glist()"><span class="glyphicon glyphicon-list"></span> 목록</button>
  <button type="button" class="btn btn-default btn-sm" onclick="history.back()"><span class="glyphicon glyphicon-repeat"></span> 다시시도</button>
<%
 	}
%>



 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
