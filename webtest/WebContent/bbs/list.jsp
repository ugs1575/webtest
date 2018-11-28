<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp"%>
<jsp:useBean id="bdao" class="bbs.BbsDAO"/>

<%
	// 검색 관련 처리
	String col = utility.checkNull(request.getParameter("col"));
	String word = utility.checkNull(request.getParameter("word"));

	if (col.equals("total")) {
		word = "";
	}

	//페이징 관련 처리

	int nowPage = 1; // 외출
	int recordPerPage = 5;

	if (request.getParameter("nowPage") != null) {
		nowPage = Integer.parseInt(request.getParameter("nowPage")); //위험함! numberformatException 가능성	
	}

	//DB에서 가져올 레코드의 순번
	int sno = ((nowPage - 1) * recordPerPage) + 1; //공식임 ㅎ
	int eno = nowPage * recordPerPage;

	Map map = new HashMap();
	map.put("col", col);
	map.put("word", word);
	map.put("sno", sno);
	map.put("eno", eno);

	List<BbsDTO> list = bdao.list(map);
	//전체 레코드 개수(col, word)
	int totalRecord = bdao.total(map);
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

.search {
	text-align: center;
	width: 80%;
	margin: 2px auto;
}
</style>
<script type="text/javascript">
	function read(bbsno) {
		var url = "read.jsp";
		url = url + "?bbsno=" + bbsno;
		url = url + "&col=<%=col%>";
		url = url + "&word=<%=word%>";
		url = url + "&nowPage=<%=nowPage%>";
		location.href = url;
	}
	
	function fileDown(filename){
		var url = "<%=root%>/download";
		url = url + "?filename="+filename;
		url = url + "&dir=/bbs/storage";
		
		location.href=url;
	}
</script>

</head>

<body>
	<jsp:include page="/menu/top.jsp" flush="false" />

	<div class="search">
		<form method="post" action="./list.jsp">
			<select name="col">
				<!-- 외출 -->
				<option value="wname"
					<%if (col.equals("wname")) {
				out.print("selected"); // 내가 선택한 분류? 가 고정되어있도록..?
			}%>>성명</option>
				<option value="title"
					<%if (col.equals("title")) {
				out.print("selected");
			}%>>제목</option>
				<option value="content"
					<%if (col.equals("content")) {
				out.print("selected");
			}%>>내용</option>
				<option value="total">전체출력</option>
			</select> <input type="text" name="word" value="<%=word%>">
			<!-- 외출 검색창에 내가 뭘 검색했는지 흔적? 을 남길 수 있음. -->
			<button>검색</button>
			<button type="button" onclick="location.href='createForm.jsp'">등록</button>
		</form>
	</div>
	<br>

	<DIV class="container">
		<h2>
			<span class="glyphicon glyphicon-list-alt"></span>게시판 목록
		</h2>

		<TABLE class="table table-hover">
			<thead>
				<TR>
					<TH>번호</TH>
					<TH>제목</TH>
					<TH>성명</TH>
					<TH>조회수</TH>
					<TH>등록일</TH>
					<TH>파일명</TH>
				</TR>
			</thead>
			<%
				if (list.size() == 0) {
			%>
			<tbody>
				<tr>
					<td colspan="6">등록된 글이 없네요.</td>
				</tr>
			</tbody>
			<%
				} else {
					for (int i = 0; i < list.size(); i++) {
						BbsDTO dto = list.get(i);
			%>
			<tbody>
				<tr>
					<td><%=dto.getBbsno()%></td>
					<td>
						<%
							for (int r = 0; r < dto.getIndent(); r++) {
										out.print("&nbsp;&nbsp;");
									}
									if (dto.getIndent() > 0) {
										out.print("<img src = '../menu/images/suri.png'>");
									}
						%> <a href="javascript:read('<%=dto.getBbsno()%>')"><%=dto.getTitle()%></a>
						<%
							if (utility.compareDay(dto.getWdate())) {
										out.print("<img src = '../menu/images/me.jpg'>");
									}
						%>
					</td>
					<td><%=dto.getWname()%></td>
					<td><%=dto.getViewcnt()%></td>
					<td><%=dto.getWdate()%></td>
					<td>
						<%
							if (dto.getFilename() != null) {
						%> <a
						href="javascript:fileDown('<%=dto.getFilename()%>')"> <span
							class="glyphicon glyphicon-download-alt"></span> Download
					</a> <%
 	} else {
 				out.print("No file");
 			}
 %>
					</td>
				</tr>
			</tbody>
			<%
				}
				}
			%>
		</TABLE>

		<DIV class='bottom'>
			<!-- <input type='button'> -->
			<%=utility.paging3(totalRecord, nowPage, recordPerPage, col, word)%>
		</DIV>

	</DIV>


	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
</html>
