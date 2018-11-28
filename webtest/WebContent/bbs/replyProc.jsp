<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="bbs.BbsDTO"/>

<%



String tempDir = application.getRealPath("/bbs/temp");
String upDir = application.getRealPath("/bbs/storage");

UploadSave upload = new UploadSave(request, -1, -1, tempDir);

dto.setWname(UploadSave.encode(upload.getParameter("wname")));
dto.setTitle(UploadSave.encode(upload.getParameter("title")));
dto.setContent(UploadSave.encode(upload.getParameter("content")));
dto.setPasswd(upload.getParameter("passwd"));
dto.setGrpno(Integer.parseInt(upload.getParameter("grpno")));
dto.setAnsnum(Integer.parseInt(upload.getParameter("ansnum")));

FileItem fileItem = upload.getFileItem("filename");

int filesize = (int)fileItem.getSize();

String filename = null;

if(filesize>0) filename = UploadSave.saveFile(fileItem, upDir);

dto.setFilename(filename);
dto.setFilesize(filesize);

Map map = new HashMap();
map.put("grpno",dto.getGrpno());
map.put("ansnum",dto.getAnsnum());
bdao.upAnsnum(map);

boolean flag = bdao.replyCreate(dto);
%>

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function blist(){
	var url ="list.jsp";
	
	location.href = url;}
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
 
<DIV class="title">처리결과</DIV>
 
<div class="content">
<%
if(flag){
	out.print("답변 등록 성공");
} else{
	out.print("답변 등록 실패");
}

%>
</div>
  
  <DIV class='bottom'>
    <input type='button' value='목록' onclick="blist()">
    <input type='button' value='글등록' onclick="location.href='createForm.jsp'">
  </DIV>

 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 