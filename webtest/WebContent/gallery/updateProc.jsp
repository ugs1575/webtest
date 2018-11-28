<%@ include file="../ssi/ssi.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %> 
 <jsp:useBean id="dao" class="gallery.GalleryDAO" />
<%
	String upDir = application.getRealPath("/gallery/storage");
	String tempDir = application.getRealPath("/gallery/temp");

	UploadSave upload = new UploadSave(request, -1, -1, tempDir);

	int gno = Integer.parseInt(upload.getParameter("gno"));
	String title = upload.getParameter("title");
	String writer = upload.getParameter("writer");
	String content = upload.getParameter("content");
	String oldfile = UploadSave.encode(upload.getParameter("oldfile"));

	FileItem fileItem = upload.getFileItem("fname");
	String fname = null;
	if (fileItem.getSize() > 0) {
		UploadSave.deleteFile(upDir, oldfile);
		fname = UploadSave.saveFile(fileItem, upDir);
	}
	Map map = new HashMap();
	
	map.put("gno", gno);
	map.put("fname", fname);
	map.put("title", title);
	map.put("writer", writer);
	map.put("content", content);
	
	boolean flag = dao.updateInfo(map);
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
function gread(){
	var url = "read.jsp";
	url = url + "?gno=<%=gno%>";
	location.href = url;
}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 

<body>
<jsp:include page="/menu/top.jsp" flush="false"/>

 
<DIV class="title">수정 완료</div>
 <div class="content">
  <%
		if (flag) {
			out.print("수정 완료!");
		} else {
			out.print("수정에 실패했습니다.");
		}
	%>
</div>
	<DIV class='bottom'>
		<%
			if (flag) {
		%>
		<input type='button' value='내 정보' onclick="gread()">
		<%
			} else {
		%>
		<input type='button' value='다시 시도' onclick="history.back()">
		<%
			}
		%>
	</DIV>
 
 

<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
</html> 
