<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="/resources/css/admin/style.css"/>
<!-- datepicker -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- timepicker -->
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<!-- div class="container" -->
<div id="wrapper">
	<div id="sidebar">
		<%@ include file="../sidebar.jsp" %>
	</div>
	<div id="topbar">
		<%@ include file="../topbar.jsp" %>
		<section>
			<h2>관리자 정보</h2>
		</section>
		<div id="content-wraaper" class="d-flex flex-column">
			<section>
				<form action="update.ado" method="post" id="updateForm">
					<input type="hidden" id="id" name="id" value="${admin.id}">
					<table class="type01">
						<tr>
							<th scope="row">아이디</th>
							<td>${admin.id}</td>
						</tr>
						<tr>
							<th scope="row">비밀번호</th>
							<td><input type="password" id="password" name="password"/></td>
						</tr>
						<tr>
							<th scope="row">비밀번호 확인</th>
							<td><input type="password" id="passwordcheck"/></td>
						</tr>
						<tr>
							<!-- 이름 변경시 본인인증 추가? -->
							<th scope="row">이름</th>
							<td><input type="text" id="name" name="name" value="${admin.name}"/></td>
						</tr>
						<tr>
							<th scope="row">은행명</th>
							<!-- select 로 변경할 것 -->
							<!-- td>
								<select id="bank" name="bank">
									<option value="010">010</option>
									<option value="02">02</option>
									<option value="031">031</option>						
								</select>
							</td -->
							<td><input type="text" id="bank" name="bank" value="${admin.bank}"/></td>
						</tr>
						<tr>
							<th scope="row">계좌번호</th>
							<td><input type="text" id="account" name="account" value="${admin.account}"/></td>
						</tr>
						<tr>
							<th scope="row">연락처</th>
							<td>
								<!-- select 로 변경할 것 -->
								<!-- select>
									<option value="010">010</option>
									<option value="02">02</option>
									<option value="031">031</option>						
								</select>
								- <input type="text" value="전화번호DB"/>
								- <input type="text" value="전화번호DB"/ -->
								<input type="text" id="phone" name="phone" value="${admin.phone}">
							</td>
						</tr>
						<tr>
							<th scope="row">이메일</th>
							<td><input type="text" id="email" name="email" value="${admin.email}"/></td>
						</tr>				
						<tr>
							<td colspan="2" align="right">
								<input type="submit" value="저장"/>&nbsp;&nbsp;&nbsp;
								<input type="button" value="뒤로가기" onclick="javascript:history.go(-1);"/>
							</td>
						</tr>	
					</table>
				</form>
			</section>
		</div>
	</div>
</div>
<div id="footer">		
	<%@ include file="../footer.jsp" %>
</div>
<script>
	$(document).ready(function() {
		$('#updateForm').submit(function() {
			if($('#password').val() == '') {
				alert("비밀번호를 입력해주세요.");
				return false;
			} 
			if($('#passwordcheck').val()  == '') {
				alert("비밀번호확인을 입력해주세요.");
				return false;
			}
			if($('#name').val() == '') {
				alert("이름을 입력해주세요.");
				return false;
			}
			if($('#phone').val() == '') {
				alert("연락처를 입력해주세요.");
				return false;
			}
			if($('#email').val() == '') {
				alert("이메일을 입력해주세요.");
				return false;
			}
			
			if($('#password').val() != $('#passwordcheck').val()) {
				alert("비밀번호가 일치하지 않습니다.");
				return false;
			}
		});
	});
</script>
</body>
</html>