<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	// 줄바꿈
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="/resources/css/admin/admin_roomview.css">
<title>여기오개</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
$(document).ready(function () {
    // 서버에서 이미지 정보를 비동기적으로 가져오는 함수
    function loadImages() {
        $.ajax({
            type: 'GET',
            url: '/getEvent.ado', // 컨트롤러의 URL
            dataType: 'json',
            success: function (data) {
                // 이미지 경로를 가져와서 이미지 태그에 설정
                var imagePath = data.img.path;
                console.log('이미지 경로:', imagePath);

                // 이미지 경로가 존재하는 경우에만 이미지를 설정
                if (imagePath) {
                    $('#eventImage').attr('src', imagePath);
                } else {
                    console.warn('이미지 경로가 존재하지 않습니다.');
                }
            }
        });
    }

    // 페이지 로딩 시 이미지를 불러오도록 호출
    loadImages();
});
</script>
</head>
<body id="page_top">
<div id="wrapper">
	<div id="sidebar">
		<%@ include file="../sidebar.jsp" %>
	</div>
	<div id="topbar">
		<%@ include file="../topbar.jsp" %>
		<form action="updateEvent.ado" method="post" enctype="multipart/form-data">
		<input name="idx" type="hidden" value="${event.idx}" />
			<div id="content-wraaper" class="d-flex flex-column">
			<div class="container-fluid">
			
			 <!-- Page Heading -->
		        <h1 class="h3 mb-2 text-gray-800" style="margin: 100px 0 0 280px;">이벤트 관리</h1>
		        <br>
		         <!-- DataTales Example -->
		         <div class="card shadow mb-4">
		            <div class="card-header py-3">
		               <h6 class="m-0 font-weight-bold text-primary">EVENT</h6>
		          	</div>
		         		 <div class="card-body">
							<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
								<tr>
									<th class="title" width="20%">제목</th>
									<c:choose>
									<c:when test="${event.condition}">
									<td colspan="2">[임시글] ${event.title}</td>
									</c:when>
									<c:otherwise>
									<td colspan="2">${event.title}</td>
									</c:otherwise>
									</c:choose>
								</tr>
								<tr>
									<th class="startDate">시작일</th>
									<td colspan="2"><fmt:formatDate value="${event.startDate}" pattern="yyyy년 MM월 dd일"/></td>
								</tr>
								<tr>
									<th class="endDate">종료일</th>
									<td colspan="2"><fmt:formatDate value="${event.endDate}" pattern="yyyy년 MM월 dd일"/></td>
								</tr>
								<tr>
									<th class="regDate">등록일</th>
									<td colspan="2"><fmt:formatDate value="${event.regDate}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/></td>
								</tr>
								<tr>
									<th class="modyDate">최근 수정일</th>
									<td colspan="2"><fmt:formatDate value="${event.modyDate}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/></td>
								</tr>
							</table>
							<br />
							<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
								<tr>
									<th class="content">내용</th>
								</tr>
								<tr>
									<td>${fn:replace(event.content, cn, br)}<br/>
									<div id="imageContainer" align= "center">
									    <!-- 이미지가 여러 개일 경우에는 반복문으로 처리 -->
									    <img id="eventImage" src="https://ogae-dog.s3.ap-northeast-2.amazonaws.com/${img.path}" onerror="this.style.display='none'" alt="Event Image"/>
									</div></td>
								</tr>
							</table>
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
										<span class="nextTitle"><a href="getEvent.ado?idx=${prevNext.nextNum}">${prevNext.nextTitle}</a></span>
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
										<span class="prevTitle"><a href="getEvent.ado?idx=${prevNext.prevNum}">${prevNext.prevTitle}</a></span>
									</c:otherwise>
								</c:choose>
							</div>
							<hr>

							<!-- 버튼 -->
							<div align="right">
								<a href="insertEvent.ado"><button type="button" class="btn btn-success btn-icon-split">새글</button></a>
								<a href="updateEvent.ado?idx=${event.idx}"><button type="button" class="btn btn-warning btn-icon-split">수정</button></a>
								<a href="getEventList.ado"><button type="button" class="btn btn-light btn-icon-split">목록</button></a>
								<a href="deleteEvent.ado?idx=${event.idx}"><button type="button" class="btn btn-danger btn-icon-split">삭제</button></a>
							</div>
						</div>
					</div>
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