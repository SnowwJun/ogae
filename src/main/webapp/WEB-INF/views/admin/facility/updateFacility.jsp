<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="java.util.Date"%>
<%@ page import ="java.text.SimpleDateFormat" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css"
	href="/resources/css/admin/admin_getFac.css">
<title>여기오개</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>

$(document).ready(function () {
    // 서버에서 이미지 정보를 비동기적으로 가져오는 함수
    function loadImages() {
        $.ajax({
            type: 'GET',
            url: '/updateFacility.ado', // 컨트롤러의 URL
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
<script type="text/javascript">
	function check() {
		var name = document.getElementById("FACILITY_NAME").value;
		var content = document.getElementById("FACILITY_INFO").value;

		if (title.value == "") {
			alert("제목을 입력해주세요.");
			return false;
		
		} else if (content.value == "") {
			alert("내용을 입력해주세요.");
			return false;
		}
		
		alert("글이 수정됩니다!");
		document.getElementById("updateForm").submit();
	}
</script>
</head>
<body id="page_top">
	<div id="sidebar">
		<%@ include file="../sidebar.jsp"%>
	</div>
	<div id="topbar">
		<%@ include file="../topbar.jsp"%>
		<form action="/updateFacility.ado" method="post" enctype="multipart/form-data">

		<div id="content-wraaper" class="d-flex flex-column">
		 <input type="hidden" name="facility_idx" value="${Facility.facility_idx}" />
			<div class="list-page">
				<div class="container-fluid">
<!-- 				Page Heading -->
				 <h1 class="h3 mb-2 text-gray-800" style="margin: 100px 0 0 280px;">시설 관리</h1>
         		<br>
				<!-- DataTales Example -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">Facility</h6>
					</div>
					<div class="card-body">
						<form action="updateFacility.ado" method="post" enctype="multipart/form-data">
							<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
								<tr>
									<th class="title" width="15%">부가시설명</th>
									<td><input type="text" name="facility_name" placeholder="부가시설명을 입력하세요" class="input-box" value="${Facility.facility_name}"></td>
								</tr>
								<tr>
									<th class="writer">작성자</th>
									<td colspan="2">여기오개</td>
								</tr>
								
								
							</table>
							<br />
							<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
								<tr>
									<th class="content" colspan="4" style="text-align: center; background-color: #f2f2f2;">부가시설 설명</th>
								</tr>
								<tr>
									<td colspan="4">
										<textarea id="facility_info"  name="facility_info" class="input-box" style="text-align: center;" >${Facility.facility_info}</textarea>
								
								</tr>
							
								<tr>
									<th class="content" colspan="4" style="text-align: center; background-color: #f2f2f2;">부가시설 이미지</th>
								</tr>
								
							</table>
							<br><br>
							
							<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
								<!-- 추가 이미지 항목을 위한 박스와 + 버튼 -->
									<tr>
									    <th class="title" width="15%">사용 이미지</th>
									    <td class="image-container" id="imageFields" style="border: none; position: relative;">
									    
									      
									        <!-- 이미지가 동적으로 추가될 자리 -->
									        <c:forEach var="image" items="${getFacImgList}">
									            <div class="image-item">
									                <img src="https://ogae-dog.s3.ap-northeast-2.amazonaws.com/${image.img_path}">
									                <div class="delete-button" onclick="deleteImageItem(this)">삭제</div>
									            </div>
									        </c:forEach>
									         <div class="image-item new-image-box">
									            <div class="add-image-button" onclick="openImageUploader()">이미지 추가하기</div>
									        </div>
									    </td>
									</tr>

							</table>
							<div class="image-popup">
								<img src="" alt="Popup Image" id="popup-image"> 
								<span class="close-popup">&times;</span>
							</div>
							<br /> <br />
							<!-- 버튼 -->
							<div align="right">
								<button type="submit" class="btn btn-success btn-icon-split">등록</button>
								<a href="getFacList.ado">
									<button type="button" class="btn btn-light btn-icon-split">취소</button>
								</a>
							</div>
							<br><br>						
						</form>
						

					</div>
				</div>
			</div>
			<br />
		</div>
	</div>
	
<!-- 	<script src="/resources/js/room/imagePopUp.js"></script> -->

<div id="footer">		
	<%@ include file="../footer.jsp" %>
</div>

<!-- 이미지를 출력할 부분 -->
<div id="image-container" class="image-container">
    <!-- 이미지가 동적으로 추가될 자리 -->
</div>

	<!-- 이미지 추가 기능(11.16 작업) -->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    function openImageUploader() {
        // input 요소 생성
        var input = document.createElement('input');
        input.type = 'file';
        input.name = 'imageFile[]';
        input.className = 'imageFile';
        input.style.display = 'none';
        input.multiple = 'multiple';

        // 파일이 선택되었을 때의 이벤트 처리
        input.addEventListener('change', function() {
            for (var i = 0; i < this.files.length; i++) {
                if (this.files && this.files[i]) {
                    var reader = new FileReader();

                    reader.onload = function (e) {
                    	// 이미지를 생성하여 해당 위치에 추가
                    	var newImage = document.createElement('div');
                    	newImage.className = 'image-item';
                    	newImage.innerHTML = '<img src="' + e.target.result + '" alt="Selected Image">';
                    	
                    	 // 이미지에 마우스를 올렸을 때 삭제 버튼이 나타나도록 설정
                        newImage.addEventListener('mouseover', function() {
                           deleteButton.style.display = 'block';
                        });

                        // 이미지에서 마우스가 벗어났을 때 삭제 버튼이 사라지도록 설정
                        newImage.addEventListener('mouseout', function() {
                           deleteButton.style.display = 'none';
                        });

                        newImage.innerHTML = '<img src="' + e.target.result + '" alt="Selected Image">';

                        // 삭제 버튼 추가
                        var deleteButton = document.createElement('div');
                        deleteButton.className = 'delete-button';
                        deleteButton.innerHTML = '삭제';
                        deleteButton.style.display = 'none'; // 처음에는 숨김 처리
                        deleteButton.onclick = function() {
                           newImage.remove();
                     };
                        newImage.appendChild(deleteButton);

                        // '+' 이미지 앞에 추가
                        var addButton = document.querySelector('.new-image-box');
                        addButton.parentNode.insertBefore(newImage, addButton);
                     };


                    // 선택된 파일의 내용을 읽어옴
                    reader.readAsDataURL(this.files[i]);
                }
            }
        });

        // input 요소를 body에 추가
        document.getElementById('imageFields').appendChild(input);

        // input 요소를 클릭하여 파일 선택 다이얼로그 열기
        input.click();
    }

    // 이미지 항목 삭제 함수
    function deleteImageItem(element) {
        var imageItem = element.parentNode;
        imageItem.remove();
    }
</script>

	
	
</body>
</html>