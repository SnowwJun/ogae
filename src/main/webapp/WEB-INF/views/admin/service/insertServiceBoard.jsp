<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="/resources/css/common.css" />
<link rel="stylesheet" href="/resources/css/admin/insertservice.css">
<title>여기오개</title>
<script type ="text/javascript">
function check() { 
	//form 의 요소를 가지고 올 때에는 form의 이름을 사용하여 가져와야 한다
 	var title = document.create.title;
    var name = document.create.name;
    var text = document.create.text;
    
    if (title.value == "") {
        alert("제목을 입력해주세요.");
        title.focus();
        return false;
    } else if (name.value == "") {
        alert("이름을 입력해주세요.");
        name.focus();
        return false;
    } else if (text.value == "") {
        alert("내용을 입력해주세요.");
        text.focus();
        return false;
    } else {
        alert("글이 등록됩니다!");
        return true;
    }
	document.getElementById("insert").submit();	
}
</script>

	<script src="/resources/js/room/imagePopUp.js"></script>

	<!-- 이미지 추가 기능(11.16 작업) -->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
		function openImageUploader() {
			// input 요소 생성
			var input = document.createElement('input');
			input.type = 'file';
			input.name = 'imageFile[]';	// 231123 수정 권유진 -> 이미지 파일명 배열로 받기
			input.className = 'imageFile';
			input.style.display = 'none';
			input.multiple = 'multiple';	// 231123 수정 권유진 -> 이미지 멀티 선택 가능

			// 파일이 선택되었을 때의 이벤트 처리
			input.addEventListener('change', function() {
				// 231123 수정 권유진 -> 멀티로 선택된 경우도 처리하기 위해
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
<body id="page-top">
<div id="wrapper">
	<div id="sidebar">
		<%@ include file="../sidebar.jsp" %>
	</div>
	<div id="topbar">
		<%@ include file="../topbar.jsp" %>
		<div id="content-wraaper" class="d-flex flex-column">
			<div class="list-page">
				<!-- Page Heading -->
				   <div class="container-fluid">

			         <h1 class="h3 mb-2 text-gray-800" style="margin: 100px 0 0 280px;">서비스 관리</h1>
			         <br>
				<br>

				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">Service</h6>
					</div>
					
		<div class="card-body">
			<form action="insertService.ado" id="insert" method="post" enctype="multipart/form-data">
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<tr>
					  <th class="service_name" width="15%">서비스명</th>
					  	<td><input type="text"	name="service_name" placeholder="서비스 이름을 입력하세요." class="input-box"></td>
					</tr>
					<tr>
						<th class="writer">작성자</th>
						<td colspan="2">여기오개</td>
					</tr>	
					<tr>
						<th class="service_price" >서비스 가격</th>
						<td colspan="2">
						<input type="text" id="service_price" name="service_price" placeholder="서비스 가격을 입력하세요" class="input-box">
						</td>
					</tr>	
					</table>
					<br>
			
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<tr>
						<th class="content" colspan="4" style="text-align: center; background-color: #f2f2f2;">서비스 설명</th>
						</tr>
					<tr>
						<td colspan="4">
					<textarea id="service_info"  id="service_info" name="service_info" placeholder="서비스 내용을 입력하세요" class="input-box" style="text-align: center;"></textarea>
				</tr>
				<tr>
					<th class="content" colspan="4" style="text-align: center; background-color: #f2f2f2;">서비스 이미지</th>
				</tr>
				</table>
				
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
								<tr>
									<th class="title" width="15%">사용 이미지</th>
									<td class="image-container" id="imageFields" style="border: none; position: relative;">
										
										<!-- 추가 이미지 항목을 위한 박스와 + 버튼 -->
										<div class="image-item new-image-box">
											<div class="add-image-button" onclick="openImageUploader()">이미지 추가하기</div>
										</div>
									</td>
								</tr>
							</table>
							<!--  
							<div class="image-popup">
								<img src="" alt="Popup Image" id="popup-image"> 
								<span class="close-popup">&times;</span>
							</div>
							-->
							<br /> <br />
				

		</div>
		
		
  			<!-- 작성 버튼 -->
    		
         
			<!-- 버튼 -->
							<div align="right">
								<button type="submit" class="btn btn-success btn-icon-split" onclick="return check()">등록</button>
								
								<a href="getServiceList.ado">
									<button type="button" class="btn btn-light btn-icon-split" style="margin-right: 10px;">취소</button>
								</a>
							</div>
							<br><br>
		
         
        
         
		</form>
	</div>
</div>
	</div>
</div>
	<div id="footer">		
		<%@ include file="../footer.jsp" %>
	</div>

<script src="/resources/js/notice/insertNotice.js"></script>
</body>
<%-- <%@ include file="../footer.jsp" %> --%>
</html>