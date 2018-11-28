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
 
<DIV class="title">파일 업로드 테스트</DIV>

<div class="content">


</div>
 
<FORM name='frm' method='POST' action="./upload_multi_proc.jsp" enctype="multipart/form-data">
  <TABLE>
    <TR>
      <TH>파일 1:</TH>
      <TD><input type="file" name="file1" size="50"></TD>
    </TR>
    <TR>
      <TH>파일 2:</TH>
      <TD><input type="file" name="file2" size="50"></TD>
    </TR>
    <TR>
      <TH>파일 3:</TH>
      <TD><input type="file" name="file3" size="50"></TD>
    </TR>
    <TR>
      <TH>파일설명</TH>
      <TD><input type="text" name="title" size="50" value="서브웨이 먹어야지"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='전송'>
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 