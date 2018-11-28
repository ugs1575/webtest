<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="address.AddressDAO"/>

<%
//검색관련처리
	String col = utility.checkNull(request.getParameter("col"));
	String word = utility.checkNull(request.getParameter("word"));

	if (col.equals("total"))
		word = "";

	//paging관련
	int nowPage = 1;
	int recordPerPage = 5;

	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
	}

	//DB에서 가져올 레코드의 순번
	int sno = ((nowPage - 1) * recordPerPage) + 1;
	int eno = nowPage * recordPerPage;

	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);

	List<AddressDTO> list = dao.list(map);
	System.out.println("lis: "+list.size());
	//전체레코드 갯수(col,word)
	int totalRecord = dao.total(map);

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

div {
	text-align: center;
	margin: 20px 0px;
	padding: 5px;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 5px;
}

table {
	width: 60%;
	margin: auto;
}

th, td {
	padding: 10px;
}
</style>
<script type="text/javascript">
	function reply(no){
		var url = "replyForm.jsp";
		url = url + "?no="+no;
		url = url +"&col=<%=col%>";
		url = url +"&word=<%=word%>";
		url = url +"&nowPage=<%=nowPage%>";
		location.href=url;
	}
	function read(no) {
		var url = "read.jsp";
		url = url + "?no=" + no;
		url = url +"&col=<%=col%>";
		url = url +"&word=<%=word%>";
		url = url +"&nowPage=<%=nowPage%>";
		location.href = url;
	}
	function update(no) {
		var url = "updateForm.jsp";
		url = url + "?no=" + no;
		url = url +"&col=<%=col%>";
		url = url +"&word=<%=word%>";
		url = url +"&nowPage=<%=nowPage%>";
		location.href = url;
	}
	function del(no) {
		if (confirm("정말?")) {
			var url = "delete.jsp";
			url = url + "?no=" + no;
			url = url +"&col=<%=col%>";
			url = url +"&word=<%=word%>";
			url = url +"&nowPage=<%=nowPage%>";
			location.href = url;
		}
	}
</script>
</head>
<body>
<jsp:include page="/menu/top.jsp"/>

	<div>주소 목록</div>
	<div class="search">
		<form method="post" action="./list.jsp">
			<select name="col">
				<option value="name"
				<%if(col.equals("name")){
					out.print("selected");
				}%>
				>이름</option>
				<option value="phone"
				<%if(col.equals("phone")){
					out.print("selected");
				}%> 
				>전화번호</option>
				<option value="total">전체출력</option>
			</select> <input type="text" name="word" value="<%=word%>">
			<button>검색</button>
			<button type="button" onclick="location.href='createForm.jsp'">등록</button>
		</form>

	</div>
	<table>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>전화번호</th>
			<th>우편번호</th>
			<th>주소</th>
			<th>조회수</th>
			<th>Grpno</th>
			<th>Indent</th>
			<th>Ansnum</th>
			<th>Refnum</th>
			<th>수정 / 삭제 / 답변</th>
		</tr>
		<%
			for (int i = 0; i < list.size(); i++) {
				AddressDTO dto = list.get(i);
		%>
		<tr>
			<td><%=dto.getNo()%></td>
			<td><a href="javascript:read('<%=dto.getNo()%>')"><%=dto.getName()%></a></td>
			<td><%=dto.getPhone()%></td>
			<td><%=dto.getZipcode()%></td>
			<td><%=dto.getAddress() + dto.getAddress2()%></td>
			<td><%=dto.getViewcnt()%></td>
			<td><%=dto.getGrpno()%></td>
			<td><%=dto.getIndent()%></td>
			<td><%=dto.getAnsnum()%></td>
			<td><%=dto.getRefnum()%></td>
			<td><a href="javascript:update('<%=dto.getNo()%>')">수정</a> 
			/ 
			<a href="javascript:del('<%=dto.getNo()%>')">삭제</a>
			/
			<a href="javascript:reply('<%=dto.getNo()%>')">답변</a></td>
		</tr>
		<%
			}
		%>
	</table>
	<div class='bottom'>
		<%=utility.paging3(totalRecord, nowPage, recordPerPage, col, word)%>
	</div>
<jsp:include page = "/menu/bottom.jsp" flush="false"/>
</body>
</html>
