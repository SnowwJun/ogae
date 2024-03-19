<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import = "java.net.URLEncoder" %>
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
<link rel="stylesheet" type="text/css"
	href="/resources/css/admin/admin_roomview.css">

<!-- 공지글 삭제 -->

	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script type="text/javascript">
	$(document).ready(function () {
	    // 서버에서 이미지 정보를 비동기적으로 가져오는 함수
	    function loadImages() {
	        $.ajax({
	            type: 'GET',
	            url: '/getServiceView.ado', // 컨트롤러의 URL
	            dataType: 'json',
	            success: function (data) {
	                // 이미지 경로를 가져와서 이미지 태그에 설정
	                var imagePath = data.img.path;
	                console.log('이미지 경로:', imagePath);

	                // 이미지 경로가 존재하는 경우에만 이미지를 설정
	                if (imagePath) {
	                    $('#serviceImage').attr('src', imagePath);
	                } else {
	                    console.warn('이미지 경로가 존재하지 않습니다.');
	                }
	            },
	            error: function () {
	                console.error('이미지를 불러오는데 실패했습니다.');
	            }
	        });
	    }

	    // 페이지 로딩 시 이미지를 불러오도록 호출
	    loadImages();
	});
	var serviceIdx = ${service.service_idx};
	function confirmServiceDelete() {
		var result = confirm("정말로 삭제하시겠습니까?");
		if (result) {
			// 'Yes'를 선택한 경우, 삭제를 실행할 URL로 리다이렉트
			console.log("삭제가 진행됩니다.");
		
			window.location.href = "deleteService.ado?service_idx=" + serviceIdx;
		} else {
			// 'No'를 선택한 경우, 아무 작업도 하지 않음
			console.log("삭제가 취소되었습니다.");
		}
	}

	function confirmUpdate() {
		var result = confirm("정말로 수정하시겠습니까?");
		if (result) {
			// 'Yes'를 선택한 경우, 수정을 실행할 URL로 리다이렉트
			window.location.href = "updateService.ado?service_idx=${service.service_idx}";
		}
		// 'No'를 선택한 경우, 아무 작업도 하지 않음
	}
	
	</script>


<title>여기오개</title>
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

         <h1 class="h3 mb-2 text-gray-800" style="margin: 100px 0 0 280px;">서비스 관리</h1>
         <br>
				<!-- DataTales Example -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">Service</h6>
					</div>
					<div class="card-body">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<tr>
								<th class="name" width="15%">제목</th>
								<td colspan="2">${service.service_name}</td>
							</tr>
							<tr>
								<th class="name" width="15%">작성자</th>
								<td colspan="2">여기오개</td>
							</tr>
							

						</table>
						<br />

					 	<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<tr>
								<th class="title" width="15%">사용 이미지</th>
								<td class="image-container">
								<c:forEach var="serviceImg" items="${getServiceImgList }">
									<div class="image-item">
										<img src="https://ogae-dog.s3.ap-northeast-2.amazonaws.com/${serviceImg.img_path}" alt="Selected Image">

									</div>
									</c:forEach>
									<div class="image-popup">
										<img src="" alt="Popup Image" id="popup-image"> <span
											class="close-popup">&times;</span>
									</div>
							</tr>
							<tr>
								<th class="info">View info</th>
								<td colspan="2" style="white-space: pre-line;" >${service.service_info}</td>
							</tr>
						</table>
						<br />
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<tr>
								<th width="15%">서비스 상품 가격</th>
								<td colspan="2" style="white-space: pre-line;" >${service.service_price}</td>
							</tr>
							</table>
						<br> <br>


						<!-- 버튼 -->
						<div align="right">
							<a href="insertServiceBoard.ado">
								<button type="button" class="btn btn-success btn-icon-split">새글</button>
							</a> <a
								href="updateServiceBoard.ado?service_idx=${service.service_idx}">
								<button type="button" class="btn btn-warning btn-icon-split">수정</button>
							</a> <a href="getServiceList.ado">
								<button type="button" class="btn btn-light btn-icon-split">목록</button>
							</a>

							<!-- <a href="getServiceList.ado">  -->
							<button type="button" class="btn btn-danger btn-icon-split"
								onclick="confirmServiceDelete()">삭제</button>
							<!-- </a>  -->

						</div>
						<br> <br>
					</div>
				</div>
			</div>
			<br />

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