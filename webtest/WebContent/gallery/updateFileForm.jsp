<%@ include file="../ssi/ssi.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %> 
 
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

<body>
<jsp:include page="/menu/top.jsp" flush="false"/>

<DIV class="title">사진 수정</DIV>
 
<FORM name='frm' method='POST' action='./updateFileProc.jsp' enctype="multipart/form-data">
  <input type="hidden" name="gno" value="<%=request.getParameter("gno") %>">
  <input type="hidden" name="oldfile" value="<%=request.getParameter("oldfile") %>">
  <TABLE>
  	<TR>
      <TD colspan="2" style="text-align: center">
      <img src = "./storage/<%=request.getParameter("oldfile") %>">
      </TD>
    </TR>
    <TR>
      <TH>파일</TH>
      <TD><input type="file" name="fname"></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <button type="submit" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-edit"></span>수정</button>
			 <button type="button" class="btn btn-default btn-sm" onclick="history.back()"><span class="glyphicon glyphicon-repeat"></span>뒤로가기</button>
  </DIV>
</FORM>
 
 

<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
</html> 
