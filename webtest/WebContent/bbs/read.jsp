<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="bdao" class="bbs.BbsDAO"/>
<%
	int bbsno = Integer.parseInt(request.getParameter("bbsno"));
	bdao.upViewcnt(bbsno);
	BbsDTO dto = bdao.read(bbsno);
	
	String content = dto.getContent();
	content = content.replaceAll("\r\n","<br>");
%>
 
<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type ="text/javascript">
function breply(){

	var url = "replyForm.jsp";
	url = url + "?bbsno=<%=bbsno%>";
	location.href = url;
}
function blist(){
	var url = "list.jsp";
	url = url + "?col=<%=request.getParameter("col")%>"
	url = url + "&word=<%=request.getParameter("word")%>"
	url = url + "&nowPage=<%=request.getParameter("nowPage")%>"
	location.href=url;
}
function bupdate(){
	var url = "updateForm.jsp";
	url = url + "?bbsno=<%=bbsno%>";
	url = url + "&col=<%=request.getParameter("col")%>"
	url = url + "&word=<%=request.getParameter("word")%>"
	url = url + "&nowPage=<%=request.getParameter("nowPage")%>"
	
	location.href=url;
}
function bdel(){
	var url = "deleteForm.jsp";
	url = url + "?bbsno=<%=bbsno%>";
	url = url + "&oldfile=<%=dto.getFilename()%>";
	url = url + "&col=<%=request.getParameter("col")%>"
	url = url + "&word=<%=request.getParameter("word")%>"
	url = url + "&nowPage=<%=request.getParameter("nowPage")%>"
	
	location.href=url;
}
function fileDown(){
	var url = "<%=root%>/download";
	url = url + "?filename=<%=dto.getFilename()%>";
	url = url +"&dir=/bbs/storage";
	
	location.href = url;
}
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/ckeditor/ckeditor.js"></script>
 
<script type="text/JavaScript">
  window.onload=function(){
   CKEDITOR.replace('content');
  };
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
 
<DIV class="title">조회</DIV>
 

 <TABLE style="width:60%; padding:20px">
    <TR>
      <TH>성명</TH>
      <TD><%=dto.getTitle() %></TD>
    </TR>
    <TR>
  	<TD colspan="2"></TD>
    </TR>
     <TR>
      <TH>성명</TH>
      <TD><%=dto.getWname() %></TD>
    </TR>
    <TR>
      <TH>조회수</TH>
      <TD><%=dto.getViewcnt() %></TD>
    </TR>
     <TR>
      <TH>등록일</TH>
      <TD><%=dto.getWdate() %></TD>
    </TR>
    <TR>
      <TH>파일</TH>
      <TD>
      <%if(dto.getFilename()!=null){ %>
		 <a href="javascript:fileDown('<%=dto.getFilename() %>')">
       	  <span class="glyphicon glyphicon-download-alt"></span>
         </a>
         (<%=(dto.getFilesize()/1024) %> KB)
		 <%
	}else{
		out.print("파일없음");
	}%>
	</TD>
    </TR>
    <TR>
      <TH>GRPNO</TH>
      <TD><%=dto.getGrpno() %></TD>
    </TR>
  </TABLE>
  
  <DIV class='bottom'>
    <input type='button' value='목록' onclick="blist()">
    <input type='button' value='등록' onclick="location.href='createForm.jsp'">
    <button onclick="bupdate()">수정</button>
    <button onclick="bdel()">삭제</button>
    <button onclick="breply()">답변</button>
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 