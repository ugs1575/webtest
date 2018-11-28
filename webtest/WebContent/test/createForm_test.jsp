<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp" %>
 
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
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">글 등록</DIV>
<div class="content">
 
<FORM name='frm' method='POST' action='./createProc_test.jsp' enctype="multipart/form-data">

  <TABLE>
  
    <TR>
      <TH>제목</TH>
      <TD><input type='text' name = 'title' size='60'></TD>
    </TR>
    
    <TR>
      <TH>내용</TH>
      <TD><textarea name='content' rows = '15' cols='60'></textarea></TD>
    </TR>
    
    <TR>
      <TH>참고</TH>
      <TD><input type='text' name = 'etc' size='30'></TD>
    </TR>
    
    <TR>
      <TH>파일</TH>
      <TD><input type='file' name = 'filename' size='60'></TD>
    </TR>
 
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='등록'></input>
  </DIV>
  
</FORM>
</div>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 