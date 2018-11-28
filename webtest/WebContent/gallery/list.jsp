<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="gallery.GalleryDAO"/>

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

	int totalRecord = dao.total(map);
	List<GalleryDTO> list = dao.list(map);
%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type = "text/javascript">
function read(gno) {
	var url = "read.jsp";
	url = url + "?gno=" + gno;
	url = url +"&col=<%=col%>";
	url = url +"&word=<%=word%>";
	url = url +"&nowPage=<%=nowPage%>";
	location.href = url;
}
</script> 
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
	text-align: center;
}

.search {
	width: 80%;
	text-align: center;
	margin: 2px auto;
}

</style>

</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->
	<div class="search">
		<form method="post" action="./list.jsp">
			<select name="col">
				<option value="writer"
				<%if(col.equals("writer")){
					out.print("selected");
				}%>
				>작성자</option>
				<option value="title"
				<%if(col.equals("title")){
					out.print("selected");
				}%> 
				>제목</option>
				<option value="content"
				<%if(col.equals("content")){
					out.print("selected");
				}%>
				>내용</option>
				<option value="total">전체출력</option>
			</select> <input type="text" name="word" value="<%=word%>">
			<button>검색</button>
			<button type="button" onclick="location.href='createForm.jsp'">등록</button>
		</form>

	</div>
	
	<div class="container">
	<h2><span class="glyphicon glyphicon-th-list"></span>이미지 목록</h2>
		
		<%
			if (list.size() == 0) {
		%>
		<tr>
			<td colspan="6">등록된 글이 없습니다.</td>
		</tr>
		<%
			}else{
				for(int i=0; i<list.size(); i++){
					GalleryDTO dto = list.get(i);
		%>
		<TABLE class="table table-hover">
		<tbody>
				<tr>
				<td rowspan = '6' width="50px"><%=dto.getGno() %></td>
				</tr>	
				
				<TR>
					<TD rowspan='6' width="400px" height="300px"><a href="javascript:read('<%=dto.getGno()%>')"><img
						src='./storage/<%=dto.getFname()%>' width='100%' height='100%'></a>
					</TD>
				</TR>
				
				<TR>
					<TH>작성자</TH>
					<TD><%=dto.getWriter()%></TD>
				</TR>
				
				<TR>
					<TH>제목</TH>
					<TD><%=dto.getTitle()%></TD>
				</TR>
				
				<TR>
					<TH>작성날짜</TH>
					<TD><%=dto.getUdate()%></TD>
				</TR>
				
				<TR>
					<TH>조회수</TH>
					<TD><%=dto.getViewcnt()%></TD>
				</TR>
				
			</TABLE>
			</tbody>
<%
			} //for end
			} //if end
%>
 
  <DIV class='bottom'>
	<%=utility.paging3(totalRecord, nowPage, recordPerPage, col, word)%>
  </DIV>
  
</div> 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>

</body>
<!-- *********************************************** -->
</html> 