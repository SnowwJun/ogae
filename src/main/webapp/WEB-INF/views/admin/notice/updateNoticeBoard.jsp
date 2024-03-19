<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="/resources/css/common.css" />
<link rel="stylesheet" href="./resources/css/admin/admin_roomview.css">
<title>여기오개</title>

<%@ page import="java.util.*" %>

<script type ="text/javascript">
	function check() { 
		//form 의 요소를 가지고 올 때에는 form의 이름을 사용하여 가져와야 한다
		var notice_title = document.getElementById("notice_title").vaule;
		var notice_content = document.getElementById("notice_content").vaule;
		var text = document.create.text;
		if (title.value == "") { 
			alert("제목을 입력해주세요.");
			title .focus();
			return false;
		} else if (name.value == "") {
			alert ("이름을 입력해주세요.");
			name .focus();
			return false;	
		} else if (text.value == "") {
			alert ("내용을 입력해주세요.");
			text .focus();
			return false;
		}
		 alert ("글이 등록됩니다!");
		 document.getElementById("updateForm").submit();
	}


	 $(document).ready(function() {
	        // 서버에서 받아온 notice_condition 값에 따라 체크 여부 설정
	        var noticeConditionValue = "${notice.notice_condition}";  // JSP 변수 사용
	        var checkbox = document.querySelector('.temp-save');

	        if (noticeConditionValue === "true") {
	            checkbox.checked = true;
	        } else {
	            checkbox.checked = false;
	        }
	    });
</script>


</head>
<body id="page-top">
	<div id="wrapper">
		<div id="sidebar">
			<%@ include file="../sidebar.jsp"%>
		</div>
		<div id="topbar">
			<%@ include file="../topbar.jsp"%>
			<div id="content-wraaper" class="d-flex flex-column">
					<div class="list-page">

					<!-- Page Heading -->
					<div class="container-fluid">

						<h1 class="h3 mb-2 text-gray-800" style="margin: 100px 0 0 280px;">공지 사항 수정</h1>
						<br> <br>
						<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">Notice</h6>
							</div>
							<div class="card-body">
								<form action="updateNoticeBoard.ado" id="updateForm" method="post">
									<div class="myinfo">
								
								
								<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
											<tr>
												<th class="title" width="15%">제목</th>
												<td><input type="text" id="notice_title" class="input-box" name="notice_title" value="${notice.notice_title}"></td>
											</tr>	
							
							<tr>
												<th class="title" width="15%">작성자</th>
												<td><input type="text" name="notice_writer" class="input-box" value="${notice.notice_writer}"></td>
								
							</tr>
							</table>
							
							
							<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
											<tr>
												<th class="content" colspan="4"
													style="text-align: center; background-color: #f2f2f2;">내용</th>
											</tr>
											<tr>
												<td colspan="4">
													<textarea id="notice_content" class="input-box" name="notice_content"  style="text-align: center;">${notice.notice_content}</textarea>
													</td>
												</tr>
												</table>	
								</div>				
								
								<div align="right">
								<!-- 임시저장 -->	
									<c:set var="notice" value="${notice}" />
										<input type="checkbox" class="temp-save" name="notice_condition" style="float: left; margin: 17px 10px 0 0;" value="true" data-target="notice_condition" ${notice.notice_condition ? 'checked' : ''}>
									<button id="submitButton" class="temp-save">임시저장</button>
									
									<input type="submit" class="btn btn-success btn-icon-split" value="수정등록">
									<a href="getNoticeList.ado">
											<button type="button" class="btn btn-light btn-icon-split">취소</button>
									</a>
								</div>
								<br><br>
								</form>
					</div>
			</div>
		</div>
	</div>
	<div id="footer">
		<%@ include file="../footer.jsp"%>
	</div>
	
	<script src="/resources/js/notice/insertNotice.js"></script>
</body>
</html>