<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="../ssi/ssi.jsp" %>
<jsp:useBean id="dao" class="memo.memoDAO"/>

<%
//검색관련
String col = utility.checkNull(request.getParameter("col"));
String word = utility.checkNull(request.getParameter("word"));

if(col.equals("total"))
	word="";

//paging
int nowPage = 1;
int recordPerPage=5;

if(request.getParameter("nowPage")!=null){
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
}

//DB에서 가져올 순번 생성
int sno = ((nowPage-1)*recordPerPage) +1;
int eno = nowPage*recordPerPage;

Map map = new HashMap();
map.put("col",col);
map.put("word",word);
map.put("sno",sno);
map.put("eno",eno);


List<memoDTO> list = dao.list(map);

int totalRecord = dao.total(map);
%> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<script type="text/javascript">
function read(memono){
	//alert(memono);
	var url="./read.jsp";
	url = url +"?memono="+memono;
	url = url +"&col=<%=col%>";
	url = url +"&word=<%=word%>";
	url = url +"&nowPage=<%=nowPage%>";
	location.href=url;
	
}
</script>
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 24px; 
} 
/* div{
text-align: center;
	margin-top:20px;
	margin-bottom:20px;
	}
	table{
	width: 60%;
	margin: 0 auto
	}
	table,th,td{
	border:1px solid black;
	border-collapse:collapse;
	}
	th,td{
	padding:10px
	}
	a:LINK {
color:#000000;
text-decoration: none;
}
a:VISITED {
color:#000000;
text-decoration: none;
}
a:HOVER {
color:#ff0000;
text-decoration: none;
}
a:ACTIVE {
color:#000000;
text-decoration: none;
}
 */
.search{
margin = 2px auto;
}
</style> 
</head> 
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>

<div>
메모목록
</div>
<div class="search">
<form method="post" action="list.jsp">
<select name="col">
<option value="title"
<%if(col.equals("title")){
	out.print("selected");
}%>
>제목</option>
<option value="content"
<%if(col.equals("content")){
	out.print("selected");
}%>
>내용</option>
<option value="total">전체출력</option>
</select>
<input type="text" name="word" value="<%=word %>">
<button>검색</button>
<button type="button" onclick="location.href='createForm.jsp'">등록</button>
</form>
</div>

<div class="container">
<h2><span class="glyphicon glyphicon-th-list">
</span>
목록</h2>
<table class="table table-hover">
<thead>
<tr>
<th>번호</th>
<th>제목</th>
<th>날짜</th>
<th>조회수</th>
<th>Grpno</th>
<th>Indent</th>
<th>Ansnum</th>
</tr>
</thead>
<%
	if(list.size()==0){
%>
<tbody>
<tr>
<td colspan="7">등록된 메모가 없습니다.</td>
</tr>
</tbody>
<%
}else{
	for(int i=0; i<list.size();i++){
		memoDTO dto = list.get(i);
	
	%>
	<tbody>
	<tr>
	<td><%=dto.getMemono() %></td>
	<td>
    	<%
    	for(int r=0;r<dto.getIndent();r++){
    		out.print("&nbsp;&nbsp;");
    	}
    	if(dto.getIndent()>0)
    		out.print("<img src='../menu/imgs/star.jpg'>");
    	%>
	<a href="javascript:read('<%=dto.getMemono()%>')"><%=dto.getTitle() %></a>
	<%
		if(utility.compareDay(dto.getWdate()))
			out.print("<img src='../menu/imgs/new.gif'>");
	%>
	</td>
	<td><%=dto.getWdate() %></td>
	<td><%=dto.getViewcnt() %></td>
	<td><%=dto.getGrpno() %></td>
	<td><%=dto.getIndent() %></td>
	<td><%=dto.getAnsnum() %></td>
	</tr>
	</tbody>
	
	<%  } //for-end
     }//if-end
%>
</table>
<div class='bottom'>
<%=utility.paging3(totalRecord, nowPage, recordPerPage, col, word)%>
</div>
</div>

<jsp:include page="/menu/bottom.jsp"/>
</body> 
</html> 
