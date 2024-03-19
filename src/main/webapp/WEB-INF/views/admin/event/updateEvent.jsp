<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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

<script src="/resources/js/room/imagePopUp.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	$(document).ready(function(){
	    $("#submitButton").click(function(){
	  
	       // 체크박스의 값 가져오기
	       var checkboxValue = $(".temp-save").val();
	  
	       var title = document.getElementsByName("title")[0].value;
	   
	       var content = document.getElementsByName("content")[0].value;
	       
	       var startDate = document.getElementsByName("startDate")[0].value;
	
	       var endDate = document.getElementsByName("endDate")[0].value;
	
		    console.log("전송할 데이터:", { title, content, condition: true, startDate, endDate });
	
	   $.ajax({
	       type: "POST",
	       url: "/saveTempEventUpdate.ado",
	       contentType: "application/json", // Content-Type 명시
	     data: JSON.stringify ({condition: checkboxValue, title, content, startDate, endDate}),
	       success: function(response){
	           // 서버에서 응답을 받으면 추가 동작 수행
	           console.log("서버응답: ", response);
	       },
	       error: function(error){
	           console.error("에러발생: ", error);
	       }
	   });
	});
});


$(document).ready(function () {
    // 서버에서 이미지 정보를 비동기적으로 가져오는 함수
    function loadImages() {
        $.ajax({
            type: 'GET',
            url: '/updateEvent.ado', // 컨트롤러의 URL
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

function openImageUploader() {
    // input 요소 생성
    var input = document.createElement('input');
    input.type = 'file';
    input.name = 'imageFile[]'; // 이미지 파일명 배열로 받기
    input.className = 'imageFile';
    input.style.display = 'none';
    input.multiple = 'multiple'; // 이미지 멀티 선택 가능

    // 파일이 선택되었을 때의 이벤트 처리
    input.addEventListener('change', function() {
        // 멀티로 선택된 경우도 처리하기 위해
        for(var i=0; i<this.files.length; i++) {
            if (this.files && this.files[i]) {
                var reader = new FileReader();

                reader.onload = function(e) {
                	
                    // 이미지를 생성하여 해당 위치에 추가
                    var newImage = document.createElement('div');
                    newImage.className = 'image-item';
                    newImage.innerHTML = '<img src="' + e.target.result + '" alt="Selected Image">';
                    newImage.innerHTML += '<div class="delete-button" onclick="deleteImageItem(this)">삭제</div>';
                    
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
					var addButton = document
							.querySelector('.new-image-box');
					addButton.parentNode.insertBefore(
							newImage, addButton);
					
					// 이미지가 동적으로 추가될 자리인 image-container에 직접 추가
                    var imageContainer = document.querySelector('.imageContainer');
                    imageContainer.appendChild(newImage);
				};

                // 선택된 파일의 내용을 읽어옴
                reader.readAsDataURL(this.files[i]);
            }
        }
    });

    // input 요소를 form 안에 추가
    document.getElementById('imageFields').appendChild(input);

    // input 요소를 클릭하여 파일 선택 다이얼로그 열기
    input.click();
}

// 이미지 항목 삭제 함수
function deleteImageItem(element) {
    var imageItem = element.parentNode;
    imageItem.remove();
}

function check() {
	var title_text = document.getElementById("title_text").value;
	var context_text = document.getElementById("context_text").value;
	
	if(title_text.value == "") {
		alert("제목을 입력해주세요.");
		return false;
	} else if(context_text.value == "") {
		alert("내용을 입력해주세요.");
		return false;
	}
	
	alert("정상적으로 수정되었습니다.")
	document.getElementById("updateForm").submit();
}

function closeImagePopup() {
    document.querySelector('.image-popup').style.display = 'none';
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
		<form action="/updateEvent.ado" method="post" enctype="multipart/form-data">
		<div id="content-wraaper" class="d-flex flex-column">
			<input type="hidden" name="idx" value="${event.idx}" />
				<div class="container-fluid">
				 <!-- Page Heading -->
            <h1 class="h3 mb-2 text-gray-800" style="margin: 100px 0 0 280px;">이벤트 관리</h1>
            <br>
            <!-- DataTales Example -->
            <div class="card shadow mb-4">
               <div class="card-header py-3">
                  <h6 class="m-0 font-weight-bold text-primary" >EVENT</h6>
               </div>
               <div class="card-body">
                  <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                  	<tr>
                        <th class="content" colspan="4" style="text-align: center; background-color: #f2f2f2;">이벤트 정보</th>
                     </tr>
                     <tr>
                        <th class="title" width="15%">제목</th>
                        <td><input type="text" name="title" placeholder="제목을 입력하세요." class="input-box" value="${event.title}"/>
                     </tr>
                     <tr>
                        <th class="writer">작성자</th>
                        <td colspan="2">여기오개</td>
                     </tr>
                     <tr>
                  </table>
                  <br />
                  <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                     <tr>
                        <th class="date">시작일</th>
                        <td>
                           <input type="date" name="startDate" value="<fmt:formatDate value='${event.startDate}' pattern='yyyy-MM-dd'/>" />
                        </td>
                        <th class="date">종료일</th>
                        <td>
							<input type="date" name="endDate" value="<fmt:formatDate value='${event.endDate}' pattern='yyyy-MM-dd'/>" />
						</td>
                     </tr>
                     <tr>
                        <th class="content" colspan="4" style="text-align: center; background-color: #f2f2f2;">내용</th>
                     </tr>
                     <tr>
                        <td colspan="4">
                           <textarea type="text" id="content_text" name="content" placeholder="내용을 입력해주세요."
							rows="5" oninput='this.style.height = ""; this.style.height = this.scrollHeight + "px"'
							style="resize: none; width: 80%; margin-left: 10px; max-height: 300px" class="input-box" required>${event.content}</textarea>
						</td>
                     </tr>
                     <tr>
                     	<th class="content" colspan="4" style="text-align: center; background-color: #f2f2f2;">이벤트 이미지</th>
                    </tr>
                  </table>
                  <br><br>
                  
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                <!-- 추가 이미지 항목을 위한 박스와 + 버튼 -->
                    <tr>
                        <th class="title" width="15%">사용 이미지</th>
                        <td class="image-container" id="imageFields" style="border: none; position: relative;">
                        
                        	<!-- 이미지가 동적으로 추가될 자리 -->
                        	<div class="image-item">
                                <img src="https://ogae-dog.s3.ap-northeast-2.amazonaws.com/${img.path}">
                                <div class="delete-button" onclick="deleteImageItem(this)">삭제</div>
                            </div>
                        	
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
                  <c:set var="event" value="${event}" />
                  <input type="checkbox" class="temp-save" name="condition" style="float: left; margin: 17px 10px 0 0;" 
                  value="true" data-target="condition" ${event.condition ? 'checked' : ''}>
	             	<button type="submit" class="temp-save" id="submitButton">임시저장</button>
                    <button type="submit" class="btn btn-warning btn-icon-split">등록</button>
                     <a href="getEventList.ado"><button type="button" class="btn btn-light btn-icon-split">취소</button>
                     </a>
                  </div>
                  <br><br>
                
               </div>
            </div>
         </div>
         <br />
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