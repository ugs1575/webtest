<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="gallery.GalleryDAO"/>
<jsp:useBean id="dto" class="gallery.GalleryDTO"/>
<%
	String tempDir="/gallery/temp";
	String upDir="/gallery/storage";
	
	tempDir = application.getRealPath(tempDir); //절대경로
	upDir = application.getRealPath(upDir);
	UploadSave upload = new UploadSave(request, -1, -1, tempDir);
	
	//UploadSave upload = (UploadSave) request.getAttribute("upload");
	
	dto.setWriter(UploadSave.encode(upload.getParameter("writer")));
	dto.setContent(UploadSave.encode(upload.getParameter("content")));
	dto.setTitle(UploadSave.encode(upload.getParameter("title")));
	dto.setPw(upload.getParameter("pw"));
	
	FileItem fileItem = upload.getFileItem("fname");
	int size = (int)fileItem.getSize();
	String fname = null;
	if(size>0){
		fname = UploadSave.saveFile(fileItem, upDir);		
	} else {
		fname = "noimage.jpg";
	}
	
	dto.setFname(fname);
	
	boolean flag = dao.create(dto);
	

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
<script type="text/javascript">
function glist(){
	var url = "list.jsp";
	location.href = url;	
}
function gcreate(){
	var url = "createForm.jsp";
	location.href = url;
}

</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">
 <span class="glyphicon glyphicon-picture"></span>처리결과</div>
<div
 class="content">
<%
	if (flag) out.print("사진 등록에 성공하였습니다.");
	else out.print("사진 등록에 실패하였습니다.");
	%>
</div>  
  <DIV class='bottom'>
  <%if (flag){%>
  <button type="button" class="btn btn-default btn-sm" onclick="glist()"><span class="glyphicon glyphicon-list"></span> 목록</button>
  <button type="button" class="btn btn-default btn-sm" onclick="gcreate()"><span class="glyphicon glyphicon-pencil"></span> 계속등록</button>
  
  <%} else { %>
  
  <button type="button" class="btn btn-default btn-sm" onclick="glist()"><span class="glyphicon glyphicon-list"></span> 목록</button>
  <button type="button" class="btn btn-default btn-sm" onclick="history.back()"><span class="glyphicon glyphicon-repeat"></span> 다시시도</button>
  <%} %>
  </DIV>

 
</DIV>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 