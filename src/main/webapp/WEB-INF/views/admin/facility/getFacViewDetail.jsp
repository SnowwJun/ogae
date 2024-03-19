<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ page import="com.ogae.admin.board.FacilityImgVO" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
<link rel="stylesheet" type="text/css" href="/resources/css/admin/admin_getFac.css">
<script defer src="/resources/javascript/star.js"></script>
	
<title>여기오개</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
$(document).ready(function () {
    // 서버에서 이미지 정보를 비동기적으로 가져오는 함수
    function loadImages() {
        $.ajax({
            type: 'GET',
            url: '/getFacViewDetail.ado', // 컨트롤러의 URL
            dataType: 'json',
            success: function (data) {
                // 이미지 경로를 가져와서 이미지 태그에 설정
                var imagePath = data.img.path;
                console.log('이미지 경로:', imagePath);

                // 이미지 경로가 존재하는 경우에만 이미지를 설정
                if (imagePath) {
                    $('#FacilityImage').attr('src', imagePath);
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
</script>

<!-- 공지글 삭제 -->
 <script type="text/javascript"> 
    function confirmDelete() {
        var result = confirm("정말로 삭제하시겠습니까?");
        if (result) {
            // 'Yes'를 선택한 경우, 삭제를 실행할 URL로 리다이렉트
            var facility_idx = ${Facility.facility_idx}; // 공지사항의 notice_idx를 가져옴
            window.location.href = "deleteFacility.ado?facility_idx=" + facility_idx;
        } else {
            // 'No'를 선택한 경우, 아무 작업도 하지 않음
        }
    }
    function confirmAndUpdate() {
        var result = confirm("정말로 수정하시겠습니까?");
        if (result) {
            // 'Yes'를 선택한 경우, 수정을 실행할 URL로 리다이렉트
            window.location.href = "updateFacility.ado?facility_idx=${Facility.facility_idx}";
        }
        // 'No'를 선택한 경우, 아무 작업도 하지 않음
    }
    
    
</script>

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
				 <h1 class="h3 mb-2 text-gray-800" style="margin: 100px 0 0 280px;">시설 관리</h1>
         <br>
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">Facility</h6>
					</div>
					<div class="card-body"><br>
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<tr>
								<th class="title" width="20%">제목</th>
								<td colspan="2">${Facility.facility_name}</td>
							</tr>
							<tr>
								<th class="writer">작성자</th>
								<td colspan="2">여기오개</td>
							</tr>
						</table><br /><br>
									<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
										    <tr>
										        <th class="title" width="15%">사용 이미지</th>
										        <td class="image-container">
										            <!-- 이미지가 동적으로 추가될 자리 -->
										            <c:forEach var="image" items="${getFacImgList}">
										                <div class="image-item">
										                    <img src="https://ogae-dog.s3.ap-northeast-2.amazonaws.com/${image.img_path}">
										                </div>
										            </c:forEach>
										        </td>
										    </tr>
										    <!-- 나머지 부분 생략 -->
										

                 						<tr>
                 							<th class="title" width="15%">View info</th>
                 							<td colspan="2" style="white-space: pre-line;" class="text-container">
               									<p>${Facility.facility_info}</p>
<!--         										<p class="text" >국내산 참숯기준:<br>1~4인(3만원)<br>4~6인(3만5천원)<br>6인이상(4만원)<br>예약은 객실예약시 옵션을 선택하여 주시기 바랍니다. </p> -->
                 							</td>
                 						</tr>
                 					</table>
                 	
				<br><br><br><br>
				<div align="right">
					<a href="insertFacility.ado"><button type="button" class="btn btn-success btn-icon-split">새글</button></a>
					<a href="updateFacility.ado?facility_idx=${Facility.facility_idx}" onclick="confirmAndUpdate()">
   						<button type="button" class="btn btn-warning btn-icon-split">수정</button>
					</a>
					<a href="getFacList.ado"><button type="button" class="btn btn-light btn-icon-split">목록</button></a>
					<a href="getFacList.ado">
                  		<button type="button" class="btn btn-danger btn-icon-split" onclick="confirmDelete()">삭제</button>
              		</a>
				</div><br />
</div>
<br><br><br>
</div>

<div id="footer">		
	<%@ include file="../footer.jsp" %>
</div>

<!-- 이미지를 출력할 부분 -->
<div id="image-container" class="image-container">
    <!-- 이미지가 동적으로 추가될 자리 -->
</div>


</body>
</html>