<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="member.MemberDAO"/>

<%  
String id = request.getParameter("id");
if(id==null) id = (String)session.getAttribute("id");

MemberDTO dto = dao.read(id);
%>  

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">
function mdel(){
	var url = "deleteForm.jsp";
	url += "?id=<%=id%>";
	location.href=url;
}
function updateFile(){
var url = "updateFileForm.jsp";
url += "?id=<%=id%>";
url += "&oldfile=<%=dto.getFname()%>";
 
location.href=url;
}
function updatePasswd(){
	var url = "updatePasswdForm.jsp";
	url += "?id=<%=id%>";
	location.href=url;
}
function updateInfo(){
	var url = "updateInfoForm.jsp";
	url += "?id=<%=id%>";
	location.href=url;
}

</script>
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
 
<DIV class="title"><%=dto.getMname() %>의 회원정보</DIV>
 
 
<TABLE>
  <tr>
   <td colspan="2">
   <img src="./storage/<%=dto.getFname() %>">
   </td>
  </tr>
  <TR>
    <TH>아이디</TH>
    <TD><%=dto.getId() %></TD>
  </TR>
  <TR>
    <TH>성명</TH>
    <TD><%=dto.getMname() %></TD>
  </TR>
  <TR>
    <TH>전화번호</TH>
    <TD><%=dto.getTel() %></TD>
  </TR>
  <TR>
    <TH>이메일</TH>
    <TD><%=dto.getEmail() %></TD>
  </TR>
  <TR>
    <TH>우편번호</TH>
    <TD><%=dto.getZipcode() %></TD>
  </TR>
  <TR>
    <TH>주소</TH>
    <TD>
    <%=dto.getAddress1() %>
    <%=utility.checkNull(dto.getAddress2()) %>
    </TD>
  </TR>
  <TR>
    <TH>직업</TH>
    <TD>
     직업코드:<%=dto.getJob() %>
        (<%=utility.getCodeValue(dto.getJob()) %>)
    </TD>
  </TR>
  <TR>
    <TH>날짜</TH>
    <TD><%=dto.getMdate() %></TD>
  </TR>
</TABLE>
  
<DIV class='bottom'>
  <input type='button' value='정보수정' onclick="updateInfo()">
  <input type='button' value='사진수정' onclick="updateFile()">
  <input type='button' value='패스워드 변경' onclick="updatePasswd()">
  <input type='button' value='회원 정보 삭제' onclick="mdel()">
</DIV>
 
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 
 
 