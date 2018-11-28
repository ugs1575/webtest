<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="gallery.GalleryDAO" />
<%
	int gno = Integer.parseInt(request.getParameter("gno"));
	dao.upViewCnt(gno);
	
	GalleryDTO dto = dao.read(gno);
	String content = dto.getContent();
	content = content.replaceAll("\r\n", "<br>");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}

.curImg {
	margin-right: 0;
	border-style: solid;
	border-width: 3px;
	border-color: red;
}

.td_padding {
	padding: 5px 5px;
}

</style>
<script type="text/javascript">
	function gupdate(){
		var url = "updateForm.jsp";
		url += "?gno=<%=gno%>";
		url += "&oldfile=<%=dto.getFname()%>";
		
		location.href = url;
	}
	function gdelete(){
		var url = "deleteForm.jsp";
		url += "?gno=<%=gno%>";
		
		location.href = url;
	}
	function glist(){
		var url = "list.jsp";
				location.href = url;
	}
	function readGo(gno){
		var url = "read.jsp";
		url += "?gno="+gno;
		
		location.href = url;
	}
</script>
<%-- <link href="<%=root%>/css/style.css" rel="Stylesheet" type="text/css"> --%>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
</head>
<!-- *********************************************** -->
<body>
	<jsp:include page="/menu/top.jsp" flush="false" />
	<!-- *********************************************** -->

	<h2 style="text-align: center"><span class="glyphicon glyphicon-picture"></span><%=dto.getWriter()%>'s</h2>

	<TABLE class="table table-hover">
	<tr>
			<TD rowspan="6" style="width:800px; height:600px; overflow:hidden; text-align: center">
			<img src="./storage/<%=dto.getFname()%>" style="width:800px; height:600px"></TD>
			<tr>
			<TD style="width:400px; height:50px" >
			<div class="form-group" >
					 <label for="title">Title:</label><br>
			<%=dto.getTitle()%></div></TD>
			</tr>
			<tr>
			<TD style="width:400px; height:50px">
			<div class="form-group" >
					 <label for="usr">Writer:</label><br>
					 <%=dto.getWriter()%></div></TD>
			</tr>
			<tr>
			
			<TD style="width:400px">
			<div class="form-group" >
					 <label for="content">Content:</label><br>
			<%=dto.getContent()%></div></TD>
			</tr>
			<tr>
			
			<TD style="width:400px; height:50px">
			<div class="form-group" >
					 <label for="date">Date:</label><br>
					 <%=dto.getUdate()%></div></TD>
			</tr>
			<tr>
			
			<TD style="width:400px; height:50px">
			<div class="form-group" >
					 <label for="view">View:</label><br>
					 <%=dto.getViewcnt()%></div></TD>
			</tr>
	</TABLE>
	<table style="width: 1000px; margin:0 auto" >
	<tr>
		<%
			List list = dao.readList(gno);
			int[] lGno = (int[]) list.get(0);
			String[] lFname = (String[]) list.get(1);
			for (int i = 0; i < 5; i++) {
				if (lFname[i] == null) {
		%>
		<td class="td_padding"><img src="./storage/noimage.jpg" 
			width="200px" height="200px"></td>
		<%
				} else {
					if (lGno[i] == gno) {
		%>
		<td class="td_padding"><a
			href="javascript:readGo('<%=lGno[i]%>')"> <img class="curImg"
				src="./storage/<%=lFname[i]%>" width="200px" height="200px" border="0"></a></td>
		<%
					} else {
		%>
		<td class="td_padding" ><a
			href="javascript:readGo('<%=lGno[i]%>')"> <img 
				src="./storage/<%=lFname[i]%>" width="200px" height="200px" border="0"></a></td>
		<%
					}
				}
			}
		%>
		</tr>
	</table>
	

	<DIV class='bottom' style="text-align:center">
		<button type="button" class="btn btn-default btn-sm" onclick="gupdate()"><span class="glyphicon glyphicon-edit"></span> 수정</button>
		<button type="button" class="btn btn-default btn-sm" onclick="gdelete()"><span class="glyphicon glyphicon-trash"></span> 삭제</button>
		<button type="button" class="btn btn-default btn-sm" onclick="glist()"><span class="glyphicon glyphicon-list"></span> 목록</button>
	</DIV>

	<!-- *********************************************** -->
	<jsp:include page="/menu/bottom.jsp" flush="false" />
</body>
<!-- *********************************************** -->
</html>