<%@ page contentType="text/html; charset=UTF-8"%>
<%@ include file="../ssi/ssi.jsp"%>
<jsp:useBean id="dao" class="team.TeamDAO"/>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	
	TeamDTO dto = dao.read(no);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script>
	function incheck(f) {
		//alert("호출");
		var cnt = 0;
		for (var i = 0; i < f.skill.length; i++) {
			if (f.skill[i].checked == true) {
				cnt++;
			}
		}
		if (cnt == 0) {
			alert("보유기술을 체크하세요")
			f.skill[0].focus();
			return;
		}
		if (f.hobby.selectedIndex == 0) {
			alert("취미를 선택하세요");
			f.hobby.focus();
			return;
		}
		if (f.phone.value == "") {
			alert("전화번호를 입력하세요");
			f.phone.focus();
			return;
		}

		f.submit();

	}
</script>
<style type="text/css">
* {
	font-family: gulim;
	font-size: 20px;
}

div {
	text-align: center;
	margin-top: 20px;
}

table {
	width: 50%;
	margin: 5px auto;
}

th, td {
	padding: 5px;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
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
						if (data.userSelectedType === 'R') {
							//법정동명이 있을 경우 추가한다.
							if (data.bname !== '') {
								extraAddr += data.bname;
							}
							// 건물명이 있을 경우 추가한다.
							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
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
	<div>수정</div>
	<form name='frm' action='./updateProc.jsp' method='post'>
	<input type="hidden" name="no" value="<%=no%>">
	<input type="hidden" name="col" value="<%=request.getParameter("col") %>">
	<input type="hidden" name="word" value="<%=request.getParameter("word") %>">
	<input type="hidden" name="nowPage" value="<%=request.getParameter("nowPage") %>">
		<table>
			<tr>
				<th>이름</th>
				<td><%=dto.getName()%></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><%=dto.getGender()%></td>
			</tr>
			<tr>
				<th>보유기술</th>
				<td>
				<input type="checkbox" name="skill" value="java"
					<%if (dto.getSkills().indexOf("java") != -1)
				out.print("checked");%>>java
					<input type="checkbox" name="skill" value="JSP"
					<%if (dto.getSkills().indexOf("JSP") != -1)
				out.print("checked");%>>JSP
					<input type="checkbox" name="skill" value="MVC"
					<%if (dto.getSkills().indexOf("MVC") != -1)
				out.print("checked");%>>MVC
					<input type="checkbox" name="skill" value="Spring"
					<%if (dto.getSkills().indexOf("Spring") != -1)
				out.print("checked");%>>Spring
					<input type="checkbox" name="skill" value="Ajax"
					<%if (dto.getSkills().indexOf("Ajax") != -1)
				out.print("checked");%>>Ajax
				</td>
			</tr>
			<tr>
				<th>취미</th>
				<td><select name="hobby">
						<option>취미를 선택하세요</option>
						<option value="영화보기">영화보기</option>
						<option value="게임">게임</option>
						<option value="기술서적읽기">기술서적읽기</option>
						<option value="보드">보드</option>
						<option value="운동">운동</option>
				</select> <script type="text/javascript">
				document.frm.hobby.value="<%=dto.getHobby()%>";
					
				</script>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" name="phone" value="<%=dto.getPhone()%>"></td>
			</tr>
			<tr>
				<th>우편번호</th>
				<td><input type="text" name="zipcode" size="7" maxlength="5"
					id="sample6_postcode" value="<%=dto.getZipcode()%>">
					<button type="button" onclick="sample6_execDaumPostcode()">우편번호
						검색</button></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" name="address" size="45"
					id="sample6_address" value="<%=dto.getZipcode()%>"> <input
					type="text" name="address2" size="45" id="sample6_address2"
					value="<%=dto.getZipcode()%>"></td>
			</tr>
		</table>
		<div>
			<button type="button" onclick="incheck(this.form)">수정</button>
			<button type="reset">입력취소</button>
		</div>
	</form>
<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>
