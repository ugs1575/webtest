<%@ include file="../ssi/ssi.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="dao" class="gallery.GalleryDAO" />

<%
	int gno = Integer.parseInt(request.getParameter("gno"));
	GalleryDTO dto = dao.read(gno);

	String pw = dto.getPw();
	Map map = new HashMap();
	map.put("gno", gno);
	map.put("pw", pw);
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
function updatePasswd(){
	var url = "updatePasswdForm.jsp";
	url += "?gno=<%=gno%>";
		location.href = url;
	}

	function inputCheck(f) {
		if (f.writer.value == "") {
			alert("작성자를 입력해 주세요.");
			f.writer.focus();
			return false;
		}
		if (f.pw.value == "") {
			alert("비밀번호를 입력해 주세요.");
			f.pw.focus();
			return false;
		}
		if (f.title.value == "") {
			alert("제목을 입력해 주세요.");
			f.title.focus();
			return false;
		}
		if (f.content.value == "") {
			alert("내용을 입력해 주세요.");
			f.content.focus();
			return false;
		}
<%-- <%boolean flag = dao.passwdCheck(map);
			if (!flag) {%>
	alert("현재의 비밀번호가 일치하지않습니다.");
		return false;
<%}%> --%>
	}
</script>
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
</head>

<body>
	<jsp:include page="/menu/top.jsp" flush="false" />


	<FORM name='frm' method='POST' action='./updateProc.jsp'
		enctype="multipart/form-data" onsubmit="return inputCheck(this)">
		<input type="hidden" name="gno"
			value="<%=request.getParameter("gno")%>"> <input
			type="hidden" name="oldfile"
			value="<%=request.getParameter("oldfile")%>">

		<div class="container">

			<h2>
				<span class="glyphicon glyphicon-pencil"></span> 글 수정
			</h2>

			<TABLE>
				<tr>
					<td rowspan='6'
						style="width: 800px; height: 600px; overflow: hidden; text-align: center">
						<img alt="미리보기" src="./storage/<%=dto.getFname()%>" id="avatar_image" >
					</td>
				</tr>
				<TR>
					<TD>					
					<input type="file" name="fname" accept=".jpg,.png,.gif"
						onchange="getThumbnailPrivew(this, 'avatar_image');">					
					</TD>	
					
				</TR>
				<TR>
					<TD>
					<div class="form-group" >
					 <label for="title">Title:</label>					
					<input type="text" name="title" size="50"
						placeholder="Title" style="width: 400px" value="<%=dto.getTitle()%>">
					</div>
						</TD>
				</TR>
				<TR>

					<TD>
					<div class="form-group" >
					 <label for="content">Content:</label>	
					<textarea rows="10" cols="50" name="content"
							placeholder="Content" style="width: 400px; resize: none;"><%=dto.getContent()%></textarea>
					</div>		
					</TD>
				</TR>
				<TR>
					<TD>
					<div class="form-group" >
					 <label for="usr">Writer:</label>						
					<input type="text" name="writer" size="20"
						placeholder="Writer" style="width: 400px" value="<%=dto.getWriter()%>">
					</div>
					</TD>
				</TR>
				<TR>

					<TD><input type="password" name="pw" size="15" placeholder="password" style="width: 400px">
					<br><button type="button" class="btn btn-default btn-sm" onclick="updatePasswd()"><span class="glyphicon glyphicon-edit"></span>암호수정</button></TD>
				</TR>
			</TABLE>

		</div>
		<br>
		<DIV class='bottom' style="text-align:center">

			<button type="submit" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-edit"></span>수정</button>
			 <button type="button" class="btn btn-default btn-sm" onclick="history.back()"><span class="glyphicon glyphicon-repeat"></span>뒤로가기</button>
		</DIV>


	</FORM>

	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
</html>
