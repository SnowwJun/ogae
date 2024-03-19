<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap"
	rel="stylesheet">
<link href="/resources/css/user/insertReview.css" rel="stylesheet" type="text/css" />
<link href="/resources/css/star.css" rel="stylesheet" />
<script defer src="/resources/js/review.js"></script>
<title>여기오개</title>

</head>
<body id="page-top">
<%@include file="/WEB-INF/views/user/header.jsp" %>
	<form action="updateReview.do" method="post" onsubmit="updateGradeCount();">
		<input type="hidden" name="idx" value="${review.idx}" />
		<div class="container-fluid">
			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-gray-800">REVIEW</h1>
			<br>
			<!-- DataTales Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
               <h6 class="m-0 font-weight-bold text-primary">REVIEW</h6>
          		</div>
          		<h2><span class="t_red">* 표시는 필수 입력 항목입니다.</span></h2>
				<div class="card-body">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align: left">
					<tr>
						<td width="50%">
							<span class="t_red">* </span>제목
							<div class="title">
							<input type="text" id="title_text" name="title" value="${review.title}" placeholder="제목을 입력해주세요."
							style="width: 30%; margin-left: 20px" required>
						</div>
						</td>
					</tr>
					<tr>
						<td>
						<span class="t_red">* </span>이름
						<div class="writer">
							<input type="text" id="writer_text" name="writer" value="${review.writer}" placeholder="이름을 입력해주세요."
							style="width: 30%; margin-left: 20px">
						</div>
						</td>
					</tr>
					<tr>
						<td>
						<span class="t_red">* </span>만족도<br/>
						<div class="grade"><span class="headerTitle" style="margin-left: 150px; vertical-align: middle; line-height: 50px;"></span>
		                    <c:set var="gradeCount" value="${review.grade}"/>               
						    <input type="radio" class="star" id="star5" name="grade" value="5" ${gradeCount == 5 ? 'checked' : ''} />
						    <label for="star5" title="5">5 stars</label>
						    <input type="radio" class="star" id="star4" name="grade" value="4" ${gradeCount == 4 ? 'checked' : ''} />
						    <label for="star4" title="4">4 stars</label>
						    <input type="radio" class="star" id="star3" name="grade" value="3" ${gradeCount == 3 ? 'checked' : ''} />
						    <label for="star3" title="3">3 stars</label>
						    <input type="radio" class="star" id="star2" name="grade" value="2" ${gradeCount == 2 ? 'checked' : ''} />
						    <label for="star2" title="2">2 stars</label>
						    <input type="radio" class="star" id="star1" name="grade" value="1" ${gradeCount == 1 ? 'checked' : ''} />
						    <label for="star1" title="1">1 star</label>
			           	</div>
						</td>
					</tr>
					<tr>
					<td colspan="2">
					<span class="t_red">* </span>내용
						<div class="content">
							<textarea type="text" id="content_text" name="content" placeholder="내용을 입력해주세요."
							rows="10" oninput='this.style.height = ""; this.style.height = this.scrollHeight + "px"'
							style="resize: none; width: 67%; margin-left: 20px; max-height: 300px;">${review.content}</textarea>
						</div>
					</td>
					</tr>
				</table>
					<div align="right">
						<input type="submit" class="btn btn-warning btn-icon-split" value="수정"/>
						<a href="getReviewList.do"><button type="button" class="btn btn-light btn-icon-split">취소</button></a>
					</div>
				</div>
			</div>
		</div>
	</form>
<%@include file="/WEB-INF/views/user/footer.jsp" %>
 <script>
	 function updateGradeCount() {
	     var gradeCount = document.querySelector('input[name="grade"]:checked').value;
	     // 여기에 starCount 변수의 값을 변경하는 코드를 작성합니다.
	
	     // 폼 제출을 막기 위해 false를 반환합니다.
	     return false;
	 }
    </script>
</body>
</html>