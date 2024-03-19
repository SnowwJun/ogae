<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<link href="/resources/css/user/review.css" rel="stylesheet" type="text/css" />
<link href="/resources/css/star.css" rel="stylesheet" />
<title>여기오개</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
function saveTextarea() {
  var content = document.getElementById("content").value;
  localStorage.setItem("content", content);
}

function loadTextarea() {
  var content = localStorage.getItem("content");
  document.getElementById("content").value = content;
}

function checkPasswordAndRedirect(action, idx) {
  var inputPass = prompt("해당 글에 맞는 비밀번호를 입력하세요.");
  console.log(inputPass); // 로그 출력
  
  $.ajax({
	  type: "POST",
	  url: "/checkReviewPassword.do",
	  data: {
	    idx: idx,
	    inputPass: encodeURIComponent(inputPass)
	  },
	  dataType: "text",
	  success: function (response) {
          // 성공적으로 응답을 받았을 때 실행되는 콜백 함수
          console.log("Response:", response); // 서버 응답을 로그에 출력

          // 비밀번호가 일치할 경우에만 동작 수행
          if (response === "success") {
              // 수정 버튼 클릭 시
              if (action === 'updateReview.do') {
                window.location.href = "updateReview.do?idx=" + idx;
              }
              // 삭제 버튼 클릭 시
              else if (action === 'deleteReview.do') {
                window.location.href = "deleteReview.do?idx=" + idx;
              }
              else {
                alert("비밀번호가 일치하지 않습니다.");
              }
            } else {
              alert("비밀번호가 일치하지 않습니다.");
            }
          },
      error: function (error) {
          // 요청이 실패했을 때 실행되는 콜백 함수
          console.error(error);
      }
  });
}
</script>
</head>
<body id="page_top">
<%@include file="/WEB-INF/views/user/header.jsp" %>
<div class="main-wrap main-swiper">
<div class="main-img">


</div>

<div class="text-wrap">
<h2>REVIEW</h2>
</div>
</div>
	<form action="updateReview.do" method="post" enctype="multipart/form-data">
		<input name="idx" type="hidden" value="${review.idx}" />
	<div class="container-fluid" style="margin-top: 100px;">
	
	 <!-- Page Heading -->
       
         <!-- DataTales Example -->
         <div class="card shadow mb-4">
            <div class="card-header py-3">
               <h6 class="m-0 font-weight-bold text-primary">REVIEW</h6>
          	</div>
       		 <div class="card-body">
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<tr>
					<th class="title" width="15%">제목</th>
					<td colspan="2">${review.title}</td>
				</tr>
				<tr>
					<th class="writer">작성자</th>
					<td colspan="2">${review.writer}</td>
				</tr>
				<tr>
					<th>만족도</th>
					<td colspan="2"><span class="star">
						<c:if test="${review.grade == 5}">
						<label>★★★★★</label>
						</c:if>
						<c:if test="${review.grade == 4}">
							<label>★★★★</label>
						</c:if>
						<c:if test="${review.grade == 3}">
							<label>★★★</label>
						</c:if>
						<c:if test="${review.grade == 2}">
							<label>★★</label>
						</c:if>
						<c:if test="${review.grade == 1}">
							<label>★</label>
						</c:if>
					</span></td>
				</tr>
				<tr>
					<th class="regDate">작성일</th>
					<td colspan="2"><fmt:formatDate value="${review.regDate}" pattern="yyyy년 MM월 dd일 HH:mm:ss" /></td>
				</tr>
				  <c:if test="${not empty review.modyDate}">
						<tr>
 							<th class="modyDate">최근 수정일</th> 
	 							<td colspan="2">
	 								<fmt:formatDate value="${review.modyDate}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/>
	 							</td>
 						</tr>
 						</c:if>
			</table>
			<br />
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<tr><th class="content">내용</th>	</tr>
					<tr><td>${review.content}</td></tr>
			</table>
				<br />
			<br />
		<!-- 이전글 다음글 -->
			<div>
			<hr style="border: 0.3px solid ##d2d2d2; ">
				<span>다음 글</span>
				<c:choose>
					<c:when test="${prevNext.nextNum == 0}">
						<span style="color: gray;">다음 글이 없습니다.</span>
					</c:when>
					<c:otherwise>
						<span class="nextTitle"><a href="getReview.do?idx=${prevNext.nextNum}">${prevNext.nextTitle}</a></span>
					</c:otherwise>
				</c:choose>
			</div>
			<div>
			<hr style="border: 0.3px solid ##d2d2d2; ">
				<span>이전 글</span>
				<c:choose>
					<c:when test="${prevNext.prevNum == 0}">
						<span style="color: gray;">이전 글이 없습니다.</span>
					</c:when>
					<c:otherwise>
						<span class="prevTitle"><a href="getReview.do?idx=${prevNext.prevNum}">${prevNext.prevTitle}</a></span>
					</c:otherwise>
				</c:choose>
			</div>
			<hr style="border: 0.3px solid ##d2d2d2; margin-bottom: 30px;">
			
			<!-- 버튼 -->
			<div align="right">
				<a href="insertReview.do"><button type="button" class="btn btn-success btn-icon-split">새글</button></a>
				<a href="#" onclick="event.preventDefault(); checkPasswordAndRedirect('updateReview.do', ${review.idx})">
		        <button type="button" class="btn btn-warning btn-icon-split">수정</button></a>
			    <a href="getReviewList.do"><button type="button" class="btn btn-light btn-icon-split">목록</button></a>
			    <a href="#" onclick="event.preventDefault(); checkPasswordAndRedirect('deleteReview.do', ${review.idx})">
		        <button type="button" class="btn btn-danger btn-icon-split">삭제</button></a>
			</div>
			<br />
			<!-- 댓글 -->
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<tr>
					<th class="reply_writer" width="15%" style="vertical-align: middle">여기오개</th>
					<td class="reply_text" style="vertical-align: middle">
					${review.reply}</td>
				</tr>
			</table>
		</div>
	</div>
</div>
	</form>
	<br><br><br>
<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>

</html>