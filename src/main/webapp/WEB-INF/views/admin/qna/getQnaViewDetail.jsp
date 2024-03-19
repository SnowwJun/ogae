<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- <link rel="stylesheet" -->
<!-- 	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"> -->

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap"
	rel="stylesheet">
<!-- <link href="/resources/css/admin/sb-admin-2.css" rel="stylesheet" /> -->
<!-- <link href="/resources/css/star.css" rel="stylesheet" /> -->
<link rel="stylesheet" type="text/css" href="/resources/css/admin/admin_getFac.css">

<title>여기오개</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"
	integrity="sha256-oP6HI/tZ1oT9fZ5KaL5rZu5cQ5Z5xjcWjYL1+U8hj1k="
	crossorigin="anonymous"></script>
<!-- <link rel="stylesheet" -->
<!-- 	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css"> -->
<!-- 공지글 삭제 -->
<script type="text/javascript">
	function confirmDelete() {
		var result = confirm("정말로 삭제하시겠습니까?");
		if (result) {
			// 'Yes'를 선택한 경우, 삭제를 실행할 URL로 리다이렉트
			var qnaIdx = $
			{
				qna.qnaIdx
			}
			; // 공지사항의 notice_idx를 가져옴
			window.location.href = "deleteQna.ado?QnaIdx=" + qnaIdx;
		} else {
			// 'No'를 선택한 경우, 아무 작업도 하지 않음
		}
	}
	function confirmAndUpdate() {
		var result = confirm("정말로 수정하시겠습니까?");
		if (result) {
			// 'Yes'를 선택한 경우, 수정을 실행할 URL로 리다이렉트
			window.location.href = "updateQna.ado?QnaIdx=${qna.qnaIdx}";
		}
		// 'No'를 선택한 경우, 아무 작업도 하지 않음
	}
	
	 function confirmAddReply() {
	        // 댓글 내용 가져오기
	        var replyContent = document.getElementById("replyContent").value;

	        // 댓글 객체 생성
	        var reply = {
	            qnaIdx: ${qna.qnaIdx},
	            qnaReply: replyContent
	        };

	        // Ajax를 사용하여 서버에 댓글 등록 요청
	        $.ajax({
	            type: "POST",
	            contentType: "application/json",
	            url: "insertQnaReply.ado",
	            data: JSON.stringify(reply),
	            success: function (response) {
	                alert("등록 성공!!"); // 성공 또는 실패 메시지 표시
	                location.reload(); // 페이지 새로고침
	            },
	            error: function (error) {
	                alert("댓글 등록에 실패하였습니다.");
	                
	            }
	        });
	    }
	 <!-- 댓글 삭제 함수 -->
	 function confirmDeleteReply(qnaReply) {
	     var result = confirm("정말로 삭제하시겠습니까?");
	     if (result) {
	         // 'Yes'를 선택한 경우, 삭제를 실행할 URL로 Ajax 요청
	         $.ajax({
	             type: "GET",
	             url: "deleteQnaReply.ado?qnaReply=" + qnaReply,
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
<body id="page-top">
	<div id="wrapper">
		<div id="sidebar">
			<%@ include file="../sidebar.jsp"%>
		</div>
		<div id="topbar">
			<%@ include file="../topbar.jsp"%>
			<div id="content-wraaper" class="d-flex flex-column">

				<div class="container-fluid">
<!-- 				Page Heading -->
				 <h1 class="h3 mb-2 text-gray-800" style="margin: 100px 0 0 280px;">문의 관리</h1>
         		<br>
					<!-- DataTales Example -->
					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">Q&A</h6>
						</div>
						<div class="card-body">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<tr>
									<th class="title" width="20%">제목</th>
									<td colspan="2">${qna.qnaTitle}</td>
								</tr>
								<tr>
									<th class="cnt">조회수</th>
									<td colspan="2">${qna.qnaCount}</td>
								</tr>
								<tr>
									<th class="writer">작성자</th>
									<td colspan="2">${qna.qnaWriter}</td>
								</tr>
								
								<tr>
									<th class="writer">비밀번호</th>
									<td colspan="2">${qna.qnaPass}</td>
								</tr>
								
								<tr>
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
								<hr>
								<span>다음 글</span>
								<c:choose>
									<c:when test="${prevNext.nextNum == 0}">
										<span style="color: gray;">다음 글이 없습니다.</span>
									</c:when>
									<c:otherwise>
										<span class="nextTitle"><a
											href="getQnaViewDetail.ado?QnaIdx=${prevNext.nextNum}">${prevNext.nextTitle}</a></span>
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
										<span class="prevTitle"><a
											href="getQnaViewDetail.ado?QnaIdx=${prevNext.prevNum}">${prevNext.prevTitle}</a></span>
									</c:otherwise>
								</c:choose>
							</div>
							<hr>
							<!-- 버튼 -->
							<div align="right">
								
								
								<a href="getQnaList.ado"><button type="button"
										class="btn btn-warning btn-icon-split" style="margin-right: 30px;">목록</button></a> 
							</div>

							<br />
							<!-- 댓글 목록 -->
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<tr>
									<th class="reply_writer" width="20%"
										style="vertical-align: middle;">답글</th>
									<th class="reply_text" width="70%">${qna.qnaReply}</th>
									<td>
									<div style="text-align: center;">
											<input type="submit" class="btn btn-danger btn-sm" value="삭제"
												onclick="confirmDeleteReply(${qna.qnaIdx})">
									</div>
										
								</tr>
							
							</table>

							<!-- 댓글 등록 -->

							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<tr>
									<th class="reply_writer" width="20%"
										style="vertical-align: middle;">여기오개</th>
									<td class="reply_text" width="70%"
										style="vertical-align: middle;"><textarea type="text"
											name="reply" onclick="this.value = ''"
											placeholder="내용을 입력해주세요." rows="5"
											oninput='this.style.height = ""; this.style.height = this.scrollHeight + "px"'
											style="resize: none; width: 100%; max-height: 200px"
											id="replyContent"></textarea></td>
									<td style="vertical-align: middle; text-align: center">
										<!-- 댓글 등록 버튼 --> <input type="submit"
										class="btn btn-success pull-right" value="댓글 쓰기"
										onclick="confirmAddReply()">
									</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
				<br>
			</div>
		</div>
	</div>
	<div id="footer">
		<%@ include file="../footer.jsp"%>
	</div>

</body>
<br>
<br>
<br>
</html>