<%@ page contentType="text/html; charset=UTF-8" %> 
<jsp:useBean id="dao" class="member.MemberDAO"/>
<jsp:useBean id="dto" class="member.MemberDTO"/>
<%  request.setCharacterEncoding("utf-8"); 
String root = request.getContextPath();
String id = request.getParameter("id");
dto = dao.read(id);
%> 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title>
<script type="text/javascript">

function inCheck(f){
	if(f.mname.value==""){
		 alert("변경할 이름을 입력해주세요");
		 f.fname.focus();
		 return false;
		  }
  if(f.tel.value==""){
 alert("변경할 전화번호를 입력해주세요");
 f.tel.focus();
 return false;
  }
  
  if(f.email.value==""){
	  alert("변경할 전화번호를 입력해주세요");
	  f.email.focus();
	  return false;
	   } 
  if(f.zipcode.value==""){
	  alert("변경할 우편번호를 입력해주세요");
	  f.zipcode.focus();
	  return false;
	   } 
  if(f.address1.value==""){
	  alert("변경할 주소를 입력해주세요");
	  f.address1.focus();
	  return false;
	   } 
  if(f.job.value==""||f.job.value=="0"){
	  alert("변경할 직업을 입력해주세요");
	  f.job.focus();
	  return false;
	   }
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
<!-- *********************************************** -->
 
<DIV class="title">정보 수정</DIV>
 
<FORM name='frm' 
 method='POST' 
 action='./updateInfoProc.do'
 onsubmit="return inCheck(this)">
  <input type="hidden" name="id" value="<%=id%>"> 
  <TABLE>
  <TR>
      <TH>이름</TH>
      <TD>
       <input type="text" name="mname" value="<%=dto.getMname()%>">
      </TD>
    </TR>
    <TR>
      <TH>전화번호</TH>
      <TD>
       <input type="text" name="tel" value="<%=dto.getTel()%>">
      </TD>
    </TR>
    <TR>
      <TH>이메일</TH>
      <TD>
       <input type="text" name="email" value="<%=dto.getEmail()%>">
      </TD>
    </TR>
    <TR>
      <TH>우편번호</TH>
      <TD>
       <input type="text" name="zipcode" value="<%=dto.getZipcode()%>">
      </TD>
    </TR>
    <TR>
      <TH>주소</TH>
      <TD>
       <input type="text" name="address1" value="<%=dto.getAddress1()%>">
      </TD>
    </TR>
    <TR>
      <TH>상세주소</TH>
      <TD>
       <input type="text" name="address2" value="<%=dto.getAddress2()%>">
      </TD>
    </TR>
    <TR>
      <TH>직업</TH>
      <td><select name="job">
						<option value="0">선택하세요</option>
						<option value="A01">회사원</option>
						<option value="A02">전산관련직</option>
						<option value="A03">연구전문직</option>
						<option value="A04">각종학교학생</option>
						<option value="A05">일반자영업</option>
						<option value="A06">공무원</option>
						<option value="A07">의료인</option>
						<option value="A08">법조인</option>
						<option value="A09">종교/언론/예술인</option>
						<option value="A10">기타</option>
				</select></td>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='submit' value='변경'>
    <input type='button' value='취소' onclick="history.back()">
  </DIV>
</FORM>
 
 
<!-- *********************************************** -->
</body>
<!-- *********************************************** -->
</html> 