<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../ssi/ssi.jsp" %>
<%
int no = Integer.parseInt(request.getParameter("no"));
TeamDAO dao = new TeamDAO();
TeamDTO dto = dao.replyRead(no);
 %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
	font-size: 20px;
}
div{
	text-align: center;
	margin-top:  20px;
}
table{
	width :50%;
	margin: 5px auto;
}
th,td{
 	padding: 5px;
}
table,th,td{
	border:1px solid black;
	border-collapse:collapse;
}
</style>
<script type="text/javascript">
function incheck(f){
	if(f.name.value==""){
	alert("이름을 입력하세요");
	f.name.focus();
	return false;
	}
	if(f.gender[0].checked==false && f.gender[1].checked==false){
	alert("성별을 체크하세요");
	f.gender[0].focus();
	return false;
	}
	var cnt=0;
	for(var i=0; i<f.skill.length; i++){
	if(f.skill[i].checked==true){
	cnt++;
	}
	}
	if(cnt==0){
	alert("보유기술을 체크하세요")
	f.skill[0].focus();
	return false;
	}
	if(f.hobby.selectedIndex==0){
	alert("취미를 선택하세요");
	f.hobby.focus();
	return false;
	}
	if(f.phone.value==""){
	alert("전화번호를 입력하세요");
	f.phone.focus();
	return false;
	}
}

</script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>

</head>
<body>
<jsp:include page="/menu/top.jsp"/>
<div>답변 등록</div>
<form name ='frm' action='./replyProc.jsp' method='post'
	onsubmit="return incheck(this)">
<input type="hidden" name="grpno" value="<%=dto.getGrpno() %>">
<input type="hidden" name="indent" value="<%=dto.getIndent() %>">
<input type="hidden" name="ansnum" value="<%=dto.getAnsnum() %>">
<input type="hidden" name="no" value="<%=dto.getNo() %>">
<table>
	<tr>
	<th>이름</th>
	<td><input type="text" name="name" size="25" value="<%=dto.getName()%>"></td>
	</tr>
	<tr>
	<th>성별</th>
	<td>
	<input type="radio" name="gender" value="여자">여자
	<input type="radio" name="gender" value="남자">남자
	</td>
 	</tr>
 	<tr>
 	<th>보유기술</th>
 	<td>
 	<input type="checkbox" name="skill" value="java">java
 	<input type="checkbox" name="skill" value="JSP">JSP
 	<input type="checkbox" name="skill" value="MVC">MVC
 	<input type="checkbox" name="skill" value="Spring">Spring
 	<input type="checkbox" name="skill" value="Ajax">Ajax
 	</td>
 	</tr>
	<tr>
		<th>취미</th>
		<td>
		<select name="hobby">
		<option>취미를 선택하세요</option>
			<option value="영화보기">영화보기</option>
			<option value="게임">게임</option>
			<option value="기술서적읽기">기술서적읽기</option>
			<option value="보드">보드</option>
			<option value="운동">운동</option>
		</select>
	</tr>
	<tr>
	<th>전화번호</th>
	<td><input type="text" name="phone"></td>
	</tr>
	<tr>
	<th>우편번호</th>
	<td><input type="text" 
	name="zipcode" 
	size="7" 
	maxlength="5"
	id="sample6_postcode" 
	placeholder="우편번호">
	<button type="button" onclick="sample6_execDaumPostcode()">우편번호 검색</button>
	</td>
	</tr>
	<tr>
		<th>주소</th>
		<td>
		<input type="text" 
		name="address" 
		size="45" 
		id="sample6_address" 
		placeholder="주소">
		<input type="text" 
		name="address2" 
		size="45"
		id="sample6_address2" 
		placeholder="상세주소">
		</td>
	</tr>
</table>
<div>
	<button>등록</button>
	<button type="reset">입력취소</button>
</div>
</form>
<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>