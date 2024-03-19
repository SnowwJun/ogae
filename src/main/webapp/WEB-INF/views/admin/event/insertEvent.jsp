<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import ="java.util.Date"%>
<%@ page import ="java.text.SimpleDateFormat" %>   
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/admin/admin_roomview.css">
<title>여기오개</title>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script src="/resources/js/room/imagePopUp.js"></script>
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
	        url: "/saveTempEvent.ado",
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
					};

					// 선택된 파일의 내용을 읽어옴
					reader.readAsDataURL(this.files[i]);
				}
			}
		});
		
		// 231123 수정 권유진 -> form 태그 안에 input 태그 요소 추가
		// input 요소를 body에 추가
		// document.body.appendChild(input);
		document.getElementById('imageFields').appendChild(input);
		
		// input 요소를 클릭하여 파일 선택 다이얼로그 열기
		input.click();

		// 231123 수정 권유진 -> input 요소를 제거하면 파일 리스트가 controller로 전송되지 않음
		// input 요소 제거
		//input.remove();
	}

	// 이미지 항목 삭제 함수
	function deleteImageItem(element) {
		var imageItem = element.parentNode;
		imageItem.remove();
	}
</script>
</head>
<body id="page_top">
<div id="wrapper">
<div id="sidebar">
	<%@ include file="../sidebar.jsp"%>
   </div>
   <div id="topbar">
      <%@ include file="../topbar.jsp"%>
      <form action="insertEvent.ado" method="post" enctype="multipart/form-data">
      <div id="content-wraaper" class="d-flex flex-column">
         <div class="list-page">
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
                        <th class="content" colspan="4" style="text-align: center; background-color: #f2f2f2;">이벤트 정보</th>
                     </tr>
                     <tr>
                        <th class="title" width="15%">제목</th>
                        <td><input type="text" name="title" placeholder="제목을 입력하세요." class="input-box"></td>
                     </tr>
                     <tr>
                        <th class="writer">작성자</th>
                        <td colspan="2">여기오개</td>
                     </tr>
                  </table>
                  <br />
                  <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                     <tr>
                        <th class="date">시작일</th>
                        <td>
                           <input type="date" name="startDate"/>
                        </td>
                        <th class="date">종료일</th>
                        <td>
                          <input type="date" name="endDate"/>
                        </td>
                     </tr>
                     <tr>
                        <th class="content" colspan="4" style="text-align: center; background-color: #f2f2f2;">내용</th>
                     </tr>
                     <tr>
                        <td colspan="4">
                           <textarea type="text" id="content_text" name="content" placeholder="내용을 입력해주세요."
									 rows="5" oninput='this.style.height = ""; this.style.height = this.scrollHeight + "px"'
									style="resize: none; width: 80%; margin-left: 10px; max-height: 300px" class="input-box" required></textarea></td>
                     </tr>
                  </table>
                  <br><br>
                  
                  <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				    <tr>
				        <th class="title" width="15%">사용 이미지</th>
				        <td class="image-container" id="imageFields" style="border: none; position: relative;">
				            <input type="file" name="file" multiple style="display: none;" onchange="handleImageSelection(this)">
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
                   <!-- 임시저장 -->   
                   	<input type="checkbox" class="temp-save" name="condition" style="float: left; margin: 17px 10px 0 0;" 
                   	value="true" data-target="condition">
	             	<button type="submit" class="temp-save" id="submitButton">임시저장</button>
                    <button type="submit" class="btn btn-success btn-icon-split">등록</button>
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
</body>
<br><br><br>
</html>