<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dto" class="bbs.BbsDTO"/>
<%
String tempDir = application.getRealPath("/bbs/temp");
String upDir = application.getRealPath("/bbs/storage");

UploadSave upload = new UploadSave(request,-1,-1,tempDir);//매개변수가 포함된 생성자는 uesbean사용 x


//form의 값 받기
dto.setWname(UploadSave.encode(upload.getParameter("wname")));
dto.setTitle(UploadSave.encode(upload.getParameter("title")));
dto.setContent(UploadSave.encode(upload.getParameter("content")));
dto.setPasswd(upload.getParameter("passwd"));

//hidden 값 받기
dto.setBbsno(Integer.parseInt(upload.getParameter("bbsno")));
String col = upload.getParameter("col");
String word = UploadSave.encode(upload.getParameter("word"));
String nowPage = upload.getParameter("nowPage");
String oldfile = UploadSave.encode(upload.getParameter("oldfile"));

//업로드 파일 받기
FileItem fileItem = upload.getFileItem("filename");
int filesize = (int)fileItem.getSize();
String filename = null;


Map map = new HashMap();
map.put("bbsno",dto.getBbsno());
map.put("passwd",dto.getPasswd());


boolean pflag = bdao.passCheck(map);
boolean flag = false;
if(pflag){
	if(filesize>0){
		if(oldfile!=null) UploadSave.deleteFile(upDir, oldfile);
		filename = UploadSave.saveFile(fileItem, upDir);
	}

	dto.setFilename(filename);
	dto.setFilesize(filesize);
	
	flag = bdao.update(dto);
}

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
function blist(){
	var url = "list.jsp";
	url = url + "?col=<%=col%>"
	url = url + "&word=<%=word%>"
	url = url + "&nowPage=<%=nowPage%>"
	location.href = url;
}
</script>
<link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css">
</head> 
<!-- *********************************************** -->
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
<!-- *********************************************** -->
 
<DIV class="title">처리결과</DIV>
 
<div class="content">
<%
if(pflag==false){
	out.print("패스워드가 일치하지 않습니다.");
} else if(flag){
	out.print("글을 변경했습니다.");
} else{
	out.print("글변경을 실패했습니다.");
}
%>
</div>
<DIV class='bottom'>
    <input type='button' value='다시시도' onclick="history.back()">
    <input type='button' value='목록' onclick="blist()">
</DIV>
 
<!-- *********************************************** -->
<jsp:include page="/menu/bottom.jsp" flush="false"/>
</body>
<!-- *********************************************** -->
</html> 