<%@ include file="../ssi/ssi.jsp"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<jsp:useBean id="dao" class="gallery.GalleryDAO" />
<%
	int gno = Integer.parseInt(request.getParameter("gno")); 
	GalleryDTO dto = dao.read(gno);

	String pw = dto.getPw();
	System.out.println(pw);
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
	
	function inputCheck(f) {
		if(f.newpw.value==""){
			alert("변경할 비밀번호를 입력하세요.");
			f.newpw.focus();
			return false;
		}
		if(f.repw.value==""){
			alert("확인 비밀번호를 입력하세요.");
			f.repw.focus();
			return false;
		}
		if (f.newpw.value != f.repw.value) {
			alert("비밀번호가 일치하지 않습니다. 다시 입력해주세요.");
			f.pw.focus();
			return false;
		}
<%-- <%boolean flag = dao.passwdCheck(map);
			if (!flag) {%>
	alert("현재의 비밀번호가 일치하지않습니다.");
		return false;
<%}%> --%>
	}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>

<body>
	<jsp:include page="/menu/top.jsp" flush="false" />

	<DIV class="title">비밀번호 수정</DIV>

	<FORM name='frm' method='POST' action='./updatePasswdProc.jsp'
		onsubmit="return inputCheck(this)">
		<input type="hidden" name="gno" value="<%=request.getParameter("gno")%>">
		<TABLE>
			<TR>
				<TH>현재 비밀번호 입력</TH>
				<TD><input type="text" name="pw"></TD>
			</TR>
			<TR>
				<TH>변경할 비밀번호 입력</TH>
				<TD><input type="password" name="newpw"></TD>
			</TR>
			<TR>
				<TH>비밀번호 재확인</TH>
				<TD><input type="password" name="repw"></TD>
			</TR>
		</TABLE>

		<DIV class='bottom'>
			<input type='submit' value='수정'> <input type='button'
				value='취소' onclick="history.back()">
		</DIV>
	</FORM>



	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
</html>
