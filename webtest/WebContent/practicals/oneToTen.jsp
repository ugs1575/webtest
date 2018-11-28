<%@ page contentType="text/html; charset=utf-8" %>
<html>
<head>
<%
	int sum=0;
	for (int i=0;i<=10;i++){
		sum = sum+i;
	}
%>
</head>
<body>
1부터 10까지의 합은 <%=sum%>입니다.
</body>
</html>