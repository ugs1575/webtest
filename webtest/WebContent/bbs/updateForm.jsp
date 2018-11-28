<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="bdao" class="bbs.BbsDAO"/>
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	BbsDTO dto = bdao.read(bbsno);
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
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 
<script type="text/JavaScript">
  window.onload=function(){
   CKEDITOR.replace('content');
  };
</script>
<script type="text/javascript">
function incheck(f){
    // content: textarea name
    if (CKEDITOR.instances['content'].getData() == '') {
      window.alert('내용을 입력해 주세요.');
      CKEDITOR.instances['content'].focus();
      return false;
    }
	if(f.wname.value==""){
		alert("이름을 입력하시오");
		f.wname.focus();
		return;
	}
	if(f.title.value==""){
		alert("제목을 입력하시오");
		f.title.focus();
		return;
	}
	if(f.content.value==""){
		alert("내용을 입력하시오");
		f.content.focus();
		return;
	}
	if(f.passwd.value==""){
		alert("비밀번호을 입력하시오");
		f.passwd.focus();
		return;
	}
	
	f.submit();
}
</script>


<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">수정</DIV>
 
<FORM name='frm' method='POST' action='./updateProc.jsp'
enctype="multipart/form-data">
<input type="hidden" name="bbsno" value="<%=dto.getBbsno() %>">
<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
<input type="hidden" name="oldfile" value="<%=dto.getFilename() %>">
  <TABLE>
    <TR>
      <TH>성명</TH>
      <TD><input type="text" name="wname" value="<%=dto.getWname() %>"></TD>
    </TR>
    <TR>
      <TH>제목</TH>
      <TD><input type="text" name="title" value="<%=dto.getTitle() %>"></TD>
    </TR>
     <TR>
     <TD colspan="2"></TD>
    </TR>
     <TR>
      <TH>비밀번호</TH>
      <TD><input type="password" name="passwd"></TD>
    </TR>
       <TR>
      <TH>파일</TH>
      <TD><input type="file" name="filename"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='button' value='수정' onclick="incheck(this.form)">
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 