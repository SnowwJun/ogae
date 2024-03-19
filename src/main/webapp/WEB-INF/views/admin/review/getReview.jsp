<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/css/admin/admin_roomview.css">
<link href="/resources/css/star.css" rel="stylesheet" />
<title>여기오개</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script defer src="/resources/js/review.js"></script>
<script type="text/javascript">
function confirmDelete() {
   var result = confirm("정말로 삭제하시겠습니까?");
   if (result) {
      // 'Yes'를 선택한 경우, 삭제를 실행할 URL로 리다이렉트
      var idx = ${review.idx}; // 사용후기 idx를 가져옴
      window.location.href = "deleteReview.ado?idx=" + idx;
   } else {
      // 'No'를 선택한 경우, 아무 작업도 하지 않음
   }
}
function confirmAndUpdate() {
   var result = confirm("정말로 수정하시겠습니까?");
   if (result) {
      // 'Yes'를 선택한 경우, 수정을 실행할 URL로 리다이렉트
      var idx = ${review.idx};
      window.location.href = "updateReview.ado?idx=" + idx;
   }
   // 'No'를 선택한 경우, 아무 작업도 하지 않음
}

 function confirmInsertReply() {
        // 댓글 내용 가져오기
        var replyContent = document.getElementById("replyContent").value;

        // 댓글 객체 생성
        var reply = {
        		idx: ${review.idx},
        		reply: replyContent
        		};

        // Ajax를 사용하여 서버에 댓글 등록 요청
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "insertReply.ado",
            data: JSON.stringify(reply),
            success: function (response) {
                alert("댓글이 등록되었습니다."); // 성공 또는 실패 메시지 표시
                location.reload(); // 페이지 새로고침
            },
            error: function (error) {
                alert("댓글 등록에 실패하였습니다.");
                
            }
        });
    }
 <!-- 댓글 삭제 함수 -->
 function confirmDeleteReply(reply) {
     var result = confirm("정말로 삭제하시겠습니까?");
     if (result) {
         // 'Yes'를 선택한 경우, 삭제를 실행할 URL로 Ajax 요청
         $.ajax({
             type: "GET",
             url: "deleteReply.ado?reply=" + reply,
             success: function (response) {
                 alert("댓글이 삭제되었습니다.");
                 location.reload(); // 페이지 새로고침
             },
             error: function (error) {
                 alert("댓글 삭제에 실패하였습니다.");
             }
         });
     } else {
         // 'No'를 선택한 경우, 아무 작업도 하지 않음
     }
 }
</script>
</head>
<body id="page_top"> 
<div id="wrapper">
	<div id="sidebar">
		<%@ include file="../sidebar.jsp" %>
	</div>
	<div id="topbar">
		<%@ include file="../topbar.jsp" %>
		<form action="getReview.ado" method="post">
		<div id="content-wraaper" class="d-flex flex-column">
			<div class="container-fluid">
			
			 <!-- Page Heading -->
			    <h1 class="h3 mb-2 text-gray-800">Review</h1>
		        <br>
		         <!-- DataTales Example -->
		         <div class="card shadow mb-4">
		            <div class="card-header py-3">
		               <h6 class="m-0 font-weight-bold text-primary">리뷰</h6>
		          	</div>
		       		 <div class="card-body">
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
						<tr>
							<th class="title" width="20%" class="input-box">제목</th>
							<td colspan="2">${review.title}</td>
						</tr>
						<tr>
							<th class="cnt">조회수</th>
							<td colspan="2">${review.count}</td>
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
							<td colspan="2">${review.regDate}</td>
						</tr>
						<tr>
							<th class="modyDate">최근 수정일</th>
							<td colspan="2">${review.modyDate}</td>
						</tr>
					</table>
					<br />
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
						<tr><th class="content">내용</th>	</tr>
						<tr><td>${review.content}</td></tr>
					</table>
						<br />
					<br />
					<!-- 이전 글 다음 글 -->
					<div>
					<hr>
						<span>다음 글</span>
						<c:choose>
							<c:when test="${prevNext.nextNum == 0}">
								<span style="color: gray;">다음 글이 없습니다.</span>
							</c:when>
							<c:otherwise>
								<span class="nextTitle"><a href="getReview.ado?idx=${prevNext.nextNum}">${prevNext.nextTitle}</a></span>
							</c:otherwise>
						</c:choose>
					</div>
					<div>
					<hr>
						<span>이전 글</span>
						<c:choose>
							<c:when test="${prevNext.prevNum == 0}">
								<span style="color: gray;">이전 글이 없습니다.</span>
							</c:when>
							<c:otherwise>
								<span class="prevTitle"><a href="getReview.ado?idx=${prevNext.prevNum}">${prevNext.prevTitle}</a></span>
							</c:otherwise>
						</c:choose>
					</div>
					<hr>
					
					<div>
					<br />
					<!-- 버튼 -->
					<div align="right">
						<a href="getReviewList.ado"><button type="button" class="btn btn-light btn-icon-split">목록</button></a>
					</div>
					<br />
					<!-- 댓글 목록 -->
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<tr>
								<th class="reply_writer" width="20%" style="vertical-align: middle;">답글</th>
								<th class="reply_text" width="70%">${review.reply}</th>
								<td><input type="submit" class="btn btn-danger btn-sm" value="삭제" onclick="confirmDeleteReply(${review.idx})"/></td>
							</tr>
						</table>
					<!-- 댓글 등록 -->
							<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
								<tr>
									<th class="reply_writer" width="20%" style="vertical-align: middle;">여기오개</th>
									<td class="reply_text" width="70%" style="vertical-align: middle;">
									<textarea type="text" name="reply" placeholder="내용을 입력해주세요." rows="5" oninput='this.style.height = "";
									this.style.height = this.scrollHeight + "px"' style="resize: none; width: 100%;  max-height: 200px" id="replyContent"></textarea></td>
									<td style="vertical-align: middle; text-align: center">
										<input type="submit" class="btn btn-success pull-right btn-icon-split" value="댓글 등록" onclick="confirmInsertReply()"/>
									</td>
								</tr>
							</table>
							</div>
						</div>
					</div>
					<br/>
				</div>
			</div>
		</form>
	</div>
<br><br><br>
<div id="footer">
	<%@include file="../footer.jsp"%>
</div>
</div>

</body>
<br><br><br>
</html>