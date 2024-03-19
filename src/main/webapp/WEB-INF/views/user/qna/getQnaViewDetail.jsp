<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap"
	rel="stylesheet">
<!-- <link href="/resources/css/admin/sb-admin-2.css" rel="stylesheet" /> -->
<link rel="stylesheet" type="text/css" href="/resources/css/user/qna.css">
<title>여기오개</title>

<!-- 공지글 삭제 -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
    function confirmDelete() {
        var result = confirm("정말로 삭제하시겠습니까?");
        if (result) {
            // 'Yes'를 선택한 경우, 삭제를 실행할 URL로 리다이렉트
//             var qnaIdx = ${qna.qnaIdx}; // 공지사항의 notice_idx를 가져옴
            window.location.href = "deleteQna.do?QnaIdx=" + qnaIdx;
        } else {
            // 'No'를 선택한 경우, 아무 작업도 하지 않음
        }
    }
    function confirmAndUpdate() {
        var result = confirm("정말로 수정하시겠습니까?");
        if (result) {
            // 'Yes'를 선택한 경우, 수정을 실행할 URL로 리다이렉트
            window.location.href = "updateQna.do?QnaIdx=${qna.qnaIdx}";
        }
        // 'No'를 선택한 경우, 아무 작업도 하지 않음
    }
    
    function checkPasswordAndRedirect(action, qnaIdx) {
    	  var inputPass = prompt("해당 글에 맞는 비밀번호를 입력하세요.");
    	  console.log(inputPass); // 로그 출력
    	  
    	  $.ajax({
    	     type: "POST",
    	     url: "/checkQnaPassword.do",
    	     data: {
    	       qnaIdx: qnaIdx,
    	       inputPass: encodeURIComponent(inputPass)
    	     },
    	     dataType: "text",
    	     success: function (response) {
    	          // 성공적으로 응답을 받았을 때 실행되는 콜백 함수
    	          console.log("Response:", response); // 서버 응답을 로그에 출력

    	          // 비밀번호가 일치할 경우에만 동작 수행
    	          if (response === "success") {
    	              // 수정 버튼 클릭 시
   	              if (action === 'updateQna.do') {
    	                window.location.href = "updateQna.do?QnaIdx=" + qnaIdx;
    	              }
    	              // 삭제 버튼 클릭 시
    	              else if (action === 'deleteQna.do') {
    	                window.location.href = "deleteQna.do?QnaIdx=" + qnaIdx;
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

<%@ include file="../header.jsp" %>
<div class="main-wrap main-swiper">
<div class="main-img">


</div>

<div class="text-wrap">
<h2>Q&A</h2>
</div>
</div>
<div class="container-fluid" style="margin-top: 100px;">
		<!-- Page Heading -->
		<br>
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">문의하기</h6>
			</div>
			<div class="card-body">
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<tr>
						<th class="title" width="15%">제목</th>
						<td colspan="2">${qna.qnaTitle}</td>
					</tr>
					<tr>
						<th class="writer">작성자</th>
						<td colspan="2">${qna.qnaWriter}</td>
					</tr>
					
					<tr>
						<th class="writedate">작성일</th>
	             		<td><fmt:formatDate value="${qna.qnaRegDate}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/></td>
					</tr>
					
					<c:if test="${not empty qna.qnaModyDate}">
						<tr>
               			<th class="re_writedate">최근 수정일</th>
               			<td colspan="2">
 						<fmt:formatDate value="${qna.qnaModyDate}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/>            				</td>
 						</tr>
 						</c:if>
					
				</table>
				<br />
				<table class="table table-bordered" id="dataTable" width="100%"
					cellspacing="0">
					<tr>
						<th class="content">내용</th>
					</tr>
					<tr>
						<td>${qna.qnaContent}</td>
					</tr>
				</table>
				<br /> <br />
				<!-- 이전글 다음글 -->
							<div>
								<hr style="border: 0.3px solid ##d2d2d2; ">
								<span>다음 글</span>
								<c:choose>
									<c:when test="${prevNext.nextNum == 0}">
										<span style="color: gray;"></span>
									</c:when>
									<c:otherwise>
										<span class="nextTitle"><a
											href="getQnaViewDetail.do?QnaIdx=${prevNext.nextNum}">${prevNext.nextTitle}</a></span>
									</c:otherwise>
								</c:choose>
							</div>
							<div>
								<hr style="border: 0.3px solid ##d2d2d2; ">
								<span>이전 글</span>
								<c:choose>
									<c:when test="${prevNext.prevNum == 0}">
										<span style="color: gray;"></span>
									</c:when>
									<c:otherwise>
										<span class="prevTitle"><a
											href="getQnaViewDetail.do?QnaIdx=${prevNext.prevNum}">${prevNext.prevTitle}</a></span>
									</c:otherwise>
								</c:choose>
							</div>
							<hr style="border: 0.3px solid ##d2d2d2; margin-bottom: 30px;">
				<!-- 버튼 -->
				<div align="right">
					<a href="insertQna.do"><button type="button"
							class="btn btn-success btn-icon-split">새글</button></a>
<a href="updateQna.do?qnaIdx=${qna.qnaIdx}" onclick="confirmAndUpdate()">
 <a href="#" onclick="event.preventDefault(); checkPasswordAndRedirect('updateQna.do', ${qna.qnaIdx})">
   <button type="button" class="btn btn-warning btn-icon-split">수정</button>
</a>

</a>					<a href="getQnaList.do"><button type="button"
							class="btn btn-light btn-icon-split">목록</button></a>		 
<!-- 					 <a href="getQnaList.do"> -->
					  <a href="#" onclick="event.preventDefault(); checkPasswordAndRedirect('deleteQna.do', ${qna.qnaIdx})">
					  
                  <button type="button" class="btn btn-danger btn-icon-split" onclick="confirmDelete()">삭제</button>
                  </a>
				</div>

				<br />
				<!-- 답글 -->
				<!-- 댓글 목록 -->
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<tr>
									<th class="reply_writer" width="15%"
										style="vertical-align: middle;">여기오개</th>
									<th class="reply_text" width="70%">${qna.qnaReply}</th>
									<td>
				</table>
			</div>
		</div>
	</div>
	</form>
	<br />
<%@ include file="../footer.jsp" %>
</body>
</html>