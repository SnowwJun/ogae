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
				<form id="check" action="checkAdmin.ado" method="post" onsubmit="check()">
					<input type="hidden" id="id" name="id" value="${admin.id}">
					<table class="type02">
						<tr>
							<th scope="row">아이디</th>
							<td>${admin.id}</td>
						</tr>
						<tr>
							<th scope="row">비밀번호</th>
							<td><input type="password" id="password" name="password"/></td>
						</tr>						
						<tr>
							<td colspan="2" align="right">
								<input type="submit" value="수정하기"/>&nbsp;&nbsp;&nbsp;
								<!-- input type="button" value="뒤로가기" onclick="location.href='/'"/ -->
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
</body>
<script>
	$(document).ready(function() {
		$('#check').submit(function() {
			if($("#password").val() == '') {
				alert('비밀번호를 입력해주세요.');
				return false;
			}
		});
		
		var msg = '<%=session.getAttribute("msg")%>';
		if(msg != null && msg != '' && msg != 'null') {
			alert(msg);
		}
	});
	
</script>
</html>