<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="memo.memoDAO"/>
<%
	int memono = Integer.parseInt(request.getParameter("memono"));

	//조회수 증가
	//memoDAO dao = new memoDAO();
	//조회수 증가end
	dao.updateViewcnt(memono);

	//조회
	memoDTO dto = dao.read(memono);

	String content = dto.getContent();
	content = content.replaceAll("\r\n", "<br>");
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 24px;
}

div {
	text-align: center;
	margin-top: 20px;
	margin-bottem: 20px;
}

table {
	width: 60%;
	margin: 0 auto;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
}
</style>
<script type="text/javascript">
	function mreply(){
		var url ="replyForm.jsp";
		url = url +"?memono=<%=memono%>";
		
		location.href = url;
	}
	function mcreate() {
		var url = "createform.jsp";
		location.href = url;
	}
	function mupdate(memono) {
		var url = "updateform.jsp";
		url = url + "?memono=<%=memono%>";
		url = url + "&col=<%=request.getParameter("col")%>"
		url = url + "&word=<%=request.getParameter("word")%>"
		url = url + "&nowPage=<%=request.getParameter("nowPage")%>"
		location.href = url;
	}
	function mdelete(memono) {
		var url = "deleteForm.jsp";
		url += "?memono=" + memono;
		url = url + "&col=<%=request.getParameter("col")%>"
		url = url + "&word=<%=request.getParameter("word")%>"
		url = url + "&nowPage=<%=request.getParameter("nowPage")%>"
		location.href = url;
	}
	function mlist() {
		var url = "list.jsp";
		url = url + "?col=<%=request.getParameter("col")%>"
		url = url + "&word=<%=request.getParameter("word")%>"
		url = url + "&nowPage=<%=request.getParameter("nowPage")%>"
		location.href = url;
	}
</script>
</head>
<body>
<jsp:include page="/menu/top.jsp"/>

	<div>조회</div>
	<table>
		<tr>
			<th>제목</th>
			<td><%=dto.getTitle()%></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><%=content%></td>
		</tr>
		<tr>
			<th>조회수</th>
			<td><%=dto.getViewcnt()%></td>
		</tr>
		<tr>
			<th>등록일</th>
			<td><%=dto.getWdate()%></td>
		</tr>
	</table>
	<div>
		<input type="button" value="등록" onclick="mcreate()"> 
		<input type="button" value="수정" onclick="mupdate('<%=dto.getMemono()%>')">
		<input type="button" value="삭제" onclick="mdelete('<%=dto.getMemono()%>')"> 
		<input type="button" value="목록" onclick="mlist()">
		<button onclick="mreply()">답변</button>
	</div>
<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>
