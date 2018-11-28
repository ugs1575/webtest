<%@ include file="../ssi/ssi.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="dao" class="gallery.GalleryDAO" />
<%
	int gno = Integer.parseInt(request.getParameter("gno"));
/* 	String pw = request.getParameter("pw");
	String repw = request.getParameter("repw"); */
	String pw = request.getParameter("pw");
	String newpw = request.getParameter("newpw");
	
	Map map = new HashMap();

	map.put("gno", gno);
	map.put("pw", pw);
	map.put("newpw", newpw);
	/* map.put("repw", repw); */
	boolean gflag = dao.passwdCheck(map);
	boolean flag = false;
	if(gflag)
		 flag = dao.updatePasswd(map);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
</style>
<script type="text/javascript">
function read(){
	var url = "read.jsp";
	url = url + "?gno=<%=gno%>";
	location.href = url;
}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>

<body>
	<jsp:include page="/menu/top.jsp" flush="false" />


	<DIV class="title">비밀번호 변경</DIV>
	<div class="content">
	<%
		
		if(!gflag){
			out.print("비밀번호가 틀렸습니다.");
		}
		else if (flag) {
			out.print("비밀번호 변경 완료!");
		} else {
			out.print("비밀번호 변경에 실패했습니다.");
		}
	
	%>
</div>
	<DIV class='bottom'>
	<%
			if (flag) {
		%>
		<input type='button' value='내 정보' onclick="read()">
		<%
			} else {
		%>
		<input type='button' value='다시 시도' onclick="history.back()">
		<%
			}
		
		%>
	</DIV>



	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
</html>
