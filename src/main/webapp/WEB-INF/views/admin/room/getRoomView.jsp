<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<link href="/resources/css/sb-admin-2.css" rel="stylesheet" />
<link href="/resources/css/star.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="/resources/css/admin/admin_roomview.css">
	
<title>여기오개</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
$(document).ready(function () {
    // 서버에서 이미지 정보를 비동기적으로 가져오는 함수
    function loadImages() {
        $.ajax({
            type: 'GET',
            url: '/getRoomView.ado', // 컨트롤러의 URL
            dataType: 'json',
            success: function (data) {
                // 이미지 경로를 가져와서 이미지 태그에 설정
                var imagePath = data.img.path;
                console.log('이미지 경로:', imagePath);

                // 이미지 경로가 존재하는 경우에만 이미지를 설정
                if (imagePath) {
                    $('#roomImage').attr('src', imagePath);
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

<script type="text/javascript">
    function confirmDelete() {
        var result = confirm("정말로 삭제하시겠습니까?");
        if (result) {
            // 'Yes'를 선택한 경우, 삭제를 실행할 URL로 리다이렉트
            var roomIdx = ${room.room_idx}; // room의 room_idx를 가져옴
            alert("객실인덱스" + roomIdx)
            window.location.href = "deleteRoom.ado?room_idx=" + roomIdx;
        } else {
            // 'No'를 선택한 경우, 아무 작업도 하지 않음
        }
    }
    
    function confirmUpdate() {
        var result = confirm("수정하겠습니까?");
        if (result) {
            // 'Yes'를 선택한 경우, 수정을 실행할 URL로 리다이렉트
            window.location.href = "updateRoom.ado?room_idx=${room.room_idx}";
        }
        // 'No'를 선택한 경우, 아무 작업도 하지 않음
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
		<div id="content-wraaper" class="d-flex flex-column">
		
		<div class="container-fluid">

			<h1 class="h3 mb-2 text-gray-800" style="margin: 100px 0 0 280px;">${room.room_name}</h1>
			<br>

			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">객실 상세보기</h6>
				</div>
				<div class="card-body">
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
						<tr>
							<th width="15%">객실명</th>
							<td colspan="2">${room.room_name}</td>
						</tr>
						<tr>
							<th width="15%">객실 금액</th>
							<td colspan="2">${room.room_price}원</td>
						</tr>
						<tr>
							<th class="writer">작성자</th>
							<td colspan="2">여기오개</td>
						</tr>
						<tr>
							<th class="writedate">작성일</th>
							<td colspan="2"><fmt:formatDate value="${room.room_regdate}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/></td>
						</tr>
<!-- 						<tr> -->
<!-- 							<th class="re_writedate">최근 수정일</th> -->
<%-- 							<td colspan="2"><fmt:formatDate value="${room.room_modydate}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/></td> --%>
<!-- 						</tr> -->
					</table>
					<br />
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
						<tr>
							<th class="content" colspan="4" style="text-align: center; background-color: #f2f2f2;">객실 설명</th>
						</tr>
						<tr>
							<td colspan="4" style="text-align: center; padding: 30px; white-space: pre-line;">${room.room_info }</td>
						</tr>
						<tr>
							<th class="content" colspan="4"
								style="text-align: center; background-color: #f2f2f2;">객실정보</th>
						</tr>
						<tr>
							<th class="cnt" width="15%">기준인원</th>
							<td colspan="1" style="width: 35%;"> 최대 ${room.person_num } 명</td>
							<th class="cnt" style="width: 15%;">반려견 수</th>
							<td colspan="1" style="width: 35%;"> 최대 ${room.dog_num } 마리</td>
						</tr>	
						
						<tr>
							<th class="cnt">유형/형태</th>
							<td colspan="1" style="width: 35%;">${room.room_category }</td>
							<th class="cnt" style="width: 15%;">크기</th>
							<td colspan="1">${room.room_size } 평형</td>
						</tr>
						<tr>
							<th class="cnt">체크인</th>
							<td colspan="1"> ${room.room_checkin}</td>
							<th class="cnt">체크아웃</th>
							<td colspan="1"> ${room.room_checkout}</td>
						</tr>
						
						<tr>
							<th class="content" colspan="4" style="text-align: center; background-color: #f2f2f2;">구비시설</th>
						</tr>
						<tr>
<%-- 							<td colspan="4" id="itemListTd" style="text-align: center; padding:30px;">${room.room_item_idx}</td> --%>
								<td colspan="4" id="itemListTd" style="text-align: center; padding:30px;"> ${roomItemIdx}</td>
						</tr>
						<tr>
							<th class="content" colspan="4" style="text-align: center; background-color: #f2f2f2;">기간안내</th>
						</tr>
						<tr>
							<th class="cnt">주중</th>
							<td colspan="1">일요일~목요일<br>금요일, 공휴일 전날 : 요금 별도 표시
							</td>

							<th class="cnt">주말</th>
							<td colspan="1">토요일,공휴일 전날</td>
						</tr>

						<!-- 11.21(추가) -->
						<tr>
							<th class="content" colspan="4" style="text-align: center; background-color: #f2f2f2;">이용 시 주의사항</th>
						</tr>
						<tr>
							<td colspan="4" style="text-align: center;">${room.room_guide }</td>
						</tr>
					</table>
					<br><br>
					
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
						<tr>
							<th class="title" width="15%">사용 이미지</th>
							<td class="image-container" id="imageFields" style="border: none; position: relative;">
								<c:forEach var="roomImg" items="${getRoomImgList }">
									<div class="image-item"> 	
										<img src="https://ogae-dog.s3.ap-northeast-2.amazonaws.com/${roomImg.img_path}" alt="Room Image" onclick="openPopup('${roomImg.img_path}')">
									</div>
								</c:forEach>
							</td>
						</tr>
					</table>
					
					<c:forEach var="roomImg" items="${getRoomImgList }">
					<div class="image-popup">
						<img src="https://ogae-dog.s3.ap-northeast-2.amazonaws.com/${roomImg.img_path}" alt="Popup Image" id="popup-image"> 
						<span class="close-popup">&times;</span>
					</div>
					</c:forEach>

					<br /> <br />
					<!-- 버튼 -->
					<div align="right">
						<a href="insertRoom.ado">
							<button type="submit" class="btn btn-success btn-icon-split">새글</button>
						</a> 
						<a href="updateRoom.ado?room_idx=${room.room_idx}">
							<button type="button" class="btn btn-warning btn-icon-split" onclick="confirmUpdate()">수정</button>
						</a> <a href="getRoomList.ado">
							<button type="submit" class="btn btn-light btn-icon-split">목록</button>
						</a> 
						<a href="getRoomList.ado">
							<button type="button" class="btn btn-danger btn-icon-split" onclick="confirmDelete()">삭제</button>
						</a>
					</div>
					<br>
					<br>

				</div>
			</div>
		</div>
	<br />

	<script src="/resources/js/room/imagePopUp.js"></script>
	<script>
		//선택된 아이템을 표시할 함수
		function updateSelectedItmes() {
			//객실 아이템을 나타낼 <td> 요소
			var itemListTd = document.getElementById('itemListTd');

			//선택된 항목을 문자열로 변환하여 <td>에 설정
			itemListTd.innerHTML = '${param.selectedItems}';
		}
	</script>
	
	<div id="footer">		
		<%@ include file="../footer.jsp" %>
	</div>

</body>
</html>