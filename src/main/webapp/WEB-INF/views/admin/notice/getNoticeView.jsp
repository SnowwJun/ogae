<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">

<link href="/resources/css/sb-admin-2.css" rel="stylesheet" />
<link href="/resources/css/star.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="/resources/css/admin/admin_roomview.css">

<!-- 공지글 삭제 -->
<script type="text/javascript">
    function confirmDelete() {
        var result = confirm("정말로 삭제하시겠습니까?");
        if (result) {
            // 'Yes'를 선택한 경우, 삭제를 실행할 URL로 리다이렉트
            var noticeIdx = ${notice.notice_idx}; // 공지사항의 notice_idx를 가져옴
            window.location.href = "deleteNotice.ado?notice_idx=" + noticeIdx;
        } else {
            // 'No'를 선택한 경우, 아무 작업도 하지 않음
        }
    }
    
    function confirmUpdate() {
        var result = confirm("정말로 수정하시겠습니까?");
        if (result) {
            // 'Yes'를 선택한 경우, 수정을 실행할 URL로 리다이렉트
            window.location.href = "updateNotice.ado?notice_idx=${notice.notice_idx}";
        }
        // 'No'를 선택한 경우, 아무 작업도 하지 않음
    }

</script>



<title>여기어때</title>
</head>

<body id="page-top">
<div id="wrapper">
	<div id="sidebar">
		<%@ include file="../sidebar.jsp" %>
	</div>
	<div id="topbar">
		<%@ include file="../topbar.jsp" %>
		<div id="content-wraaper" class="d-flex flex-column">

			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-gray-800" style="margin: 100px 0 0 280px;">공지사항 관리</h1>
			<br>
			<!-- DataTales Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">Notice</h6>
				</div>
				<div class="card-body">
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
						<tr>
							<th class="title" width="15%">제목</th>
<%-- 							<td colspan="2">${notice.notice_title}</td> --%>
								<c:choose>
								    <c:when test="${notice.notice_condition}">
								        <td colspan="2">[임시글] ${notice.notice_title}</td>
								    </c:when>
								    <c:otherwise>
								        <td colspan="2">${notice.notice_title}</td>
								    </c:otherwise>
								</c:choose>
						</tr>
						<tr>
							<th class="writer">작성자</th>
							<td colspan="2">${notice.notice_writer}</td>
						</tr>
						<tr>
							<th class="writedate">작성일</th>
							 <td colspan="2"><fmt:formatDate value="${notice.notice_regdate}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/></td>
						</tr>
						
						  <c:if test="${not empty notice.notice_modydate}">
						<tr>
 							<th class="re_writedate">최근 수정일</th> 
	 							<td colspan="2">
	 								<fmt:formatDate value="${notice.notice_modydate}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/>
	 							</td>
 						</tr>
 						</c:if>
 						
					</table>
					<br />
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<tr>
							<th class="cnt" width="15%">내용</th>
							<td colspan="2" style="white-space: pre-line;">${notice.notice_content}</td>
						</tr>
					</table>
					<br>
					<br>


					<!-- 버튼 -->
					<div align="right">
						<a href="insertNoticeBoard.ado">
							<button type="button" class="btn btn-success btn-icon-split">새글</button>
						</a> 
						<a href="updateNoticeBoard.ado?notice_idx=${notice.notice_idx}">
							<button type="button" class="btn btn-warning btn-icon-split">수정</button>
						</a> 
						<a href="getNoticeList.ado">
							<button type="button" class="btn btn-light btn-icon-split">목록</button>
						</a> 
						<a href="getNoticeList.ado">
						<button type="button" class="btn btn-danger btn-icon-split" onclick="confirmDelete()">삭제</button>
						</a>
					</div>
					<br>
					<br>
				</div>
			</div>
		</div>
	<br />

</div>
</div>
	<div id="footer">		
		<%@ include file="../footer.jsp" %>
	</div>

</body>
<br><br><br>
</html>