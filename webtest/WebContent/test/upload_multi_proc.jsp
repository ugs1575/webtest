<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp" %>
<%
	String upDir = "/test/storage";
	String downDir = "test/storage";
	
	upDir = application.getRealPath(upDir);
	String tempDir = application.getRealPath("/test/temp");
	
	UploadSave upload = new UploadSave(request,-1,-1,tempDir);
	
	FileItem fileItem = upload.getFileItem("file1");
	int size1 = (int)fileItem.getSize();
	System.out.println("size:" +size1);
	String file1 = "";
	if(size1>0) file1 = UploadSave.saveFile(fileItem, upDir);
	
	fileItem = upload.getFileItem("file2");
	int size2 = (int)fileItem.getSize();
	String file2 = "";
	if(size2>0) file1 = UploadSave.saveFile(fileItem, upDir);
	
	fileItem = upload.getFileItem("file3");
	int size3 = (int)fileItem.getSize();
	String file3 = "";
	if(size3>0) file1 = UploadSave.saveFile(fileItem, upDir);
	
	String title = UploadSave.encode(upload.getParameter("title"));

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
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">파일 업로드 테스트</DIV>
파일 1 : <%=file1 %> / 파일사이즈: <%=size1 %><br>
파일 2 : <%=file2 %> / 파일사이즈: <%=size2 %><br>
파일 3 : <%=file3 %> / 파일사이즈: <%=size3 %><br>
설명 : <%=size3 %>
<div class="content">


</div>
 
 
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 