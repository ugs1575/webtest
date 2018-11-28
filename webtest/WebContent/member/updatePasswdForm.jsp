<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="/ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="member.MemberDAO" />
<%
	request.setCharacterEncoding("utf-8");
	String id = request.getParameter("id");
	MemberDTO dto = dao.read(id);
	String oldPasswd = dto.getPasswd();
	System.out.println("oldPasswd: "+oldPasswd);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script type="text/javascript">
function inCheck(f){
  if(f.old_passwd.value==""){
 alert("현재 비밀번호를 입력해주세요");
 f.old_passwd.focus();
 return false;
  } 
 if(f.old_passwd.value!="<%=dto.getPasswd()%>"){
	alert("현재 비밀번호가 틀립니다. 다시 입력해 주세요");
	f.old_passwd.focus();
	return false;
  } 
 if(f.new_passwd.value==""){
	alert("새로운 비밀번호를 입력해주세요");
	f.new_passwd.focus();
	return false;
 }
 if(f.new_passwd.value!=f.new_passwd_check.value){
		alert("새로운 비밀번호가 틀립니다. 확인란에 다시 입력해 주세요");
		f.new_passwd_check.focus();
		return false;
  }
  f.submit();
}

</script>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}
</style>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<DIV class="title">비밀번호 수정</DIV>

	<FORM name='frm' method='POST' action='./updatePasswdProc.jsp'
		onsubmit="return inCheck(this)">
		<input type="hidden" name="id" value="<%=id%>"> 

		<TABLE>
			<TR>
				<TD><img src="./storage/<%=dto.getFname()%>"></TD>
			</TR>
			<TR>
				<TH>나의정보</TH>
				<TD>ID :<%=id%>
				</TD>
			</TR>
			<TR>
				<TH>현재 패스워드</TH>
				<TD><input type="password" name="old_passwd"></TD>
			</TR>
			<TR>
				<TH>새로운 패스워드</TH>
				<TD><input type="password" name="new_passwd"></TD>
			</TR>
			<TR>
				<TH>새로운 패스워드 확인</TH>
				<TD><input type="password" name="new_passwd_check"></TD>
			</TR>
		</TABLE>

		<DIV class='bottom'>
			<input type='submit' value='변경'>
			<input type='button' value='취소' onclick="history.back()">
		</DIV>
	</FORM>


	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>
