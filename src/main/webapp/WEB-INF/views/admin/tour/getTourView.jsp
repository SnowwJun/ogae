<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap"
	rel="stylesheet">
<link href="/resources/css/sb-admin-2.css" rel="stylesheet" />
<link href="/resources/css/star.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="/resources/css/admin/admin_roomview.css">

<!-- 글 삭제 -->
<script type="text/javascript">
    function confirmDelete() {
        var result = confirm("정말로 삭제하시겠습니까?");
        if (result) {
            // 'Yes'를 선택한 경우, 삭제를 실행할 URL로 리다이렉트
            var tour_idx = ${tour.tour_idx}; // 여행의 tour_idx를 가져옴
            window.location.href = "deleteTour.ado?tour_idx=" + tour_idx;
        } else {
            // 'No'를 선택한 경우, 아무 작업도 하지 않음
        }
    }
    
    function confirmUpdate() {
        var result = confirm("정말로 수정하시겠습니까?");
        if (result) {
            // 'Yes'를 선택한 경우, 수정을 실행할 URL로 리다이렉트
            window.location.href = "updateTour.ado?tour_idx=${tour.tour_idx}";
        }
        // 'No'를 선택한 경우, 아무 작업도 하지 않음
    }

</script>



<title>여기오개</title>
</head>

<body id="page-top">
<div id="wrapper">
	<div id="sidebar">
		<%@ include file="../sidebar.jsp" %>
	</div>
	<div id="topbar">
		<%@ include file="../topbar.jsp" %>
		<div id="content-wraaper" class="d-flex flex-column">
			<div class="container-fluid">
<!-- 				Page Heading -->
				 <h1 class="h3 mb-2 text-gray-800" style="margin: 100px 0 0 280px;">여행지 관리</h1>
         	
		<br>
			<!-- DataTales Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">Tour</h6>
				</div>
				<div class="card-body">
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
						<tr>
							<th class="title" width="15%">제목</th>
							<td colspan="2">${tour.tour_title}</td>
						</tr>
						<tr>
						</tr>
					</table>
					<br />
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<tr>
							<th class="cnt" width="15%">내용</th>
							<td colspan="2">${tour.tour_content}</td>
						</tr>
						<tr>
							<th class="cnt" width="15%">주소</th>
							<td colspan="2">${tour.tour_addr1}</td>
						</tr>
						<tr>
							<th class="cnt" width="15%">위도</th>
							<td colspan="2">${tour.tour_mapx}</td>
						</tr>
						<tr>
							<th class="cnt" width="15%">경도</th>
							<td colspan="2">${tour.tour_mapy}</td>
						</tr>
					</table>
					<br>
					<br>


					<!-- 버튼 -->
					<div align="right">
					
						<a href="updateTour.ado?tour_idx=${tour.tour_idx}">
							<button type="button" class="btn btn-warning btn-icon-split">수정</button>
						</a> 
						<a href="TourList.ado">
							<button type="button" class="btn btn-light btn-icon-split">목록</button>
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
<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> 
		<i class="fas fa-angle-up"></i>
	</a>

	
</body>
<br><br><br>
</html>