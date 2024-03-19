<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import ="java.util.Date"%>
<%@ page import ="java.sql.Time"%>
<%@ page import ="java.text.SimpleDateFormat" %>	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- 11.21 추가 -->
<%@ page import = "java.net.URLEncoder" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="/resources/css/admin/admin_roomview.css">
<title>관리자-객실등록</title>
</head>
<body id="page_top">
	<div id="sidebar">
		<%@ include file="../sidebar.jsp"%>
	</div>
	<div id="topbar">
		<%@ include file="../topbar.jsp"%>
		<div id="content-wraaper" class="d-flex flex-column">
			<div class="list-page">
				<!-- Page Heading -->
				<h1 class="h3 mb-2 text-gray-800" style="margin: 100px 0 0 320px;">객실등록</h1>
				<br>
				<!-- DataTales Example -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">객실 등록하기</h6>
					</div>
					
					<form id="insertRoomRegForm"  action="insertRoomReg.ado" method="post" onsubmit="registerAndRedirect()" enctype="multipart/form-data">
					<!-- 11.21.추가 -->
					<div class="card-body">
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							
							<tr>
								<th class="title" width="15%">객실명</th>
								<td colspan="3"><input type="text" name="room_name" placeholder="객실명을 입력하세요" class="input-box"></td>
							</tr>
							
							<tr>
								<th class="writer">작성자</th>
								<td colspan="3">여기오개</td>
							</tr>
							<tr>
								<th class="price" style="color: black;">객실 금액(원)</th>
								<td colspan="3"><input type="text" name="room_price" placeholder="객실금액을 입력하세요" class="input-box"></td>
							</tr>
							<tr>
								<th class="content" colspan="4" style="text-align: center; background-color: #f2f2f2;">객실정보</th>
							</tr>
							<tr>
								<th class="cnt">수용인원</th>
								<td colspan="1" style="width: 35%;">
										최대 <select id="personNumSelect" name="person_num " onchange="personNum()" class="input-box" style="width: 20%; border: 1px solid #dddddd;">
												
												<%
													for(int i=2; i<=5; i++){
														if(i<=5){%>
												<option value="<%=i %>"><%=i %> </option> <%}
													else{%>
												<option value="<%=i%>"><%= i %></option>
													<%}
												}%>		
										</select> 명
									</td>
								<th class="cnt" style="width: 15%;">수용가능 반려견 수</th>
									<td colspan="1">
										최대 <select id="dogNumSelect" name="dog_num " onchange="dogNum()" class="input-box" style="width: 20%; border: 1px solid #dddddd;">
												<%
													for(int i=1; i<=3; i++){
														if(i<=3){%>
												<option selected value="<%=i %>"><%=i %> </option><%}
														else{%>
												<option value="<%=i%>"><%=i %></option>
													<%}
													}
												%>
										</select> 마리
									</td>
							</tr>
							
							<tr>
								<th class="cnt">유형/형태</th>
									<td colspan="1" style="width: 35%;">
<!-- 										분리형(더블침대, 거실, 화장실) -->
										<select id="roomTypeSelect" name="room_category" onchange="roomType()" class="input-box" style="width: 80%; border: 1px solid #dddddd;">
											<option selected value="roomType">유형선택</option>
											<option value="원룸형">원룸형</option>
											<option value="분리형">분리형</option>
											<option value="복층형">복층형</option>
										</select>
									</td>
								<th class="cnt" style="width: 15%;">크기</th>
									<td colspan="1">
										<input type="text" name="room_size" placeholder="객실의 크기를 작성해 주세요" class="input-box" style="text-align: left;"></td>
									</td>
							</tr>
							<tr>
								<th class="cnt">체크인</th>
								<td colspan="1"> 
									<select name="room_checkin" id="checkinTimeSelect" onchange="checkinTime()" class="input-box" style="width: 80%; border: 1px solid #dddddd;">
									<option value="" selected>시간선택</option>

											<% for(int i=0; i<=23; i++){ %>
												<% for(int j=0; j<=59; j+=60){ %>
													<option value = "<%= String.format("%02d: %02d", i, j) %>">
														<%= String.format("%02d: %02d", i, j) %>
													</option>
												<% } %>
											<% } %>			
									</select>
								</td>
								<th class="cnt">체크아웃</th>
								<td colspan="1">
									<select name="room_checkout" id="checkoutTimeSelect" onchange="checkoutTime()" class="input-box" style="width: 80%; border: 1px solid #dddddd;">
										<option value="" selected>시간선택</option>
											<% for(int i=0; i<=23; i++){ %>
												<% for(int j=0; j<=59; j+=60){ %>
													<option value = "<%= String.format("%02d: %02d", i, j) %>">
														<%= String.format("%02d: %02d", i, j) %>
													</option>
												<% } %>
											<% } %>	
									</select>
								</td>
							</tr>
							
							<script src="/resources/js/room/roomItemList.js"></script>	
							<tr>
								<th class="content" colspan="4" style="text-align: center; background-color: #f2f2f2;">구비시설</th>
							</tr>
							<tr>
								<td colspan="4" style="text-align: center; padding: 30px; vertical-align: middle;">
									<!-- 11.20 추가 -->
									<!-- 메인 JSP의 HTML, 입력한 아이템들 체크박스로 소환 -->
									<div id="checkboxContainer">
										<c:forEach var="item" items="${roomItemList}">
											<label>
												<input type="checkbox" id="roomCheckbox_${item.room_item_idx}" name="room_item_idx" value="${item.room_item_idx}" onclick="updateSelectedItems()">${item.room_item_name}
											</label>
										</c:forEach>	
									</div>
									
<!-- 								선택한 아이템을 hidden필드로 업데이트, 이 값을 폼데이터로 서버에 전송하고 서버는 해당값을 받아 DB에 저장-->
									<input type="hidden" id="selectedItems" name="selectedItems">
									
									<br>
									<div style="text-align: right;">
										<button type="button" class="insertItem" onclick="openItemManagementPopup()">아이템 관리</button>
									</div>
								</td>

							</tr>
							
						
							<tr>
								<th class="content" colspan="4" style="text-align: center; background-color: #f2f2f2;">기간안내</th>
							</tr>
							<tr>
								<th class="cnt">주중</th>
									<td colspan="1">일요일~목요일<br>금요일, 공휴일 전날 : 요금 별도 표시</td>
						
								<th class="cnt">주말</th>
								<td colspan="1">토요일,공휴일 전날</td>
							</tr>
							
							<!-- 11.21(추가) -->
							<tr>
								<th class="content" colspan="4" style="text-align: center; background-color: #f2f2f2;">이용 시 주의사항</th>
							</tr>
							<tr>
								<td colspan="4">
								<input type="text" name="room_guide" placeholder="주의사항을 작성해주세요" class="input-box" style="text-align: center;"></td>
							</tr>
						</table>
						<br><br>
						
						
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<tr>
								<th class="title" width="15%">사용 이미지</th>
								<td class="image-container" id="imageFields" style="border: none; position: relative;">
									
									<!-- 추가 이미지 항목을 위한 박스와 + 버튼 -->
									<div class="image-item new-image-box">
										<div class="add-image-button" onclick="openImageUploader()">이미지 추가하기
										</div>
									</div>
								</td>
							</tr>
						</table>
						
						<br /> <br />
						<!-- 버튼 -->
						<div align="right">
					
								<button type="submit" class="btn btn-success btn-icon-split" onclick="submitForm()">등록</button>
							
							<a href="getRoomList.ado">
								<button type="button" class="btn btn-light btn-icon-split">취소</button>
							</a>
						</div>
						<br><br>					
						
						</form>
						<!-- 이전글 다음글 -->
						<div class="list">
							<table class="table table-bordered" id="contentTable" width="100%" cellspacing="0">
								<tr>
									<th class="before" width="20%">이전 글</th>
									<td colspan="5">이전 글</td>
								</tr>
								<tr>
									<th class="after">다음 글</th>
									<td colspan="5">다음 글</td>
								</tr>
							</table>
						</div>
					</div>
				</div>
			</div>
			<br />
		</div>
	</div>
	
<!-- 	<script src="/resources/js/room/imagePopUp.js"></script> -->

<script>
document.querySelector('input[name="room_name"]').addEventListener("change", function() {
    console.log("room_name 값: ", this.value);
});

document.querySelector('input[name="room_size"]').addEventListener("change", function() {
    console.log("room_size 값: ", this.value);
});
</script>

	<!-- 객실 아이템 데이터 소환(11.20 작업) -->
	<script>
		//서버에서 가져온 객실 아이템 목록을 저장할 배열
		var roomItems = [];
		
		//페이지 로딩 시 서버에서 객실 아이템 목록을 가져와서 초기화
		window.onload = function(){
			getRoomItemsFromServer();
		};

		
		//서버에서 객실 아이템 목록을 가져오는 함수
		function getRoomItemsFromServer(){
			//서버로 요청
			$.ajax({
				url: '/getRoomItems.ado',
				method: 'GET',
				dataType: 'json',
				contentType: 'application/json',
				success: function(data){
					//성공시
					roomItems = data;
					
					//객실 아이템 목록 업데이트
					updateDataInMain();
				},
				error: function(error){
					console.error('Error fetching room itmes: ', error);
				}
			});
		}
		
		<!-- 팝업에서 추가한 아이템 리스트를 메인 화면으로 전송(11.20) -->
	    // 기존의 체크박스 업데이트 함수
	     function updateDataInMain() {
	         var checkboxContainer = document.getElementById('checkboxContainer');
	        checkboxContainer.innerHTML = '';

	        // 추가된 아이템을 기반으로 체크박스 생성
	        for (var i = 0; i < roomItems.length; i++) {
	            var checkbox = document.createElement('input');
	            checkbox.type = 'checkbox';
	            checkbox.name = 'roomItems';
	            checkbox.value = roomItems[i].room_item_idx;

	            var textNode = document.createTextNode(roomItems[i].room_item_name);

	            var div = document.createElement('div');
	            div.appendChild(checkbox);
	            div.appendChild(textNode);

	            checkboxContainer.appendChild(div);
	        }
	    }
	    	

 	    function getSelectedItems() {
 	        // 선택된 체크박스의 값을 저장할 배열
 	        var selectedItems = [];

 	        // 모든 체크박스에 대해 반복
 	        //var checkboxes = document.getElementsByName("room_item_idx");
 	        var checkboxes = document.getElementsByName("roomItems");
 	         	        
 	        for (var i = 0; i < checkboxes.length; i++) {
 	            if (checkboxes[i].checked) {
 	                selectedItems.push(checkboxes[i].value);
 	            }
 	        }

 	        // 배열을 문자열로 변환하여 반환 (쉼표로 구분)
 	        return selectedItems.join(',');
 	    }
	</script>

	

	<!-- 이미지 추가 기능(11.16 작업) -->
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<script>
		function openImageUploader() {
			// input 요소 생성
			var input = document.createElement('input');
			input.type = 'file';
			input.name = 'imageFile[]'; //*imageFile[] 파일명 배열로 받기
			input.className = 'imageFile';
			input.style.display = 'none';
 			input.multiple = 'multiple'; //*이미지 멀티선택 가능

			// 파일이 선택되었을 때의 이벤트 처리
			input.addEventListener('change', function() {
			//*이미지 멀티로 선택되었을 경우
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
							var addButton = document.querySelector('.new-image-box');
							addButton.parentNode.insertBefore(newImage, addButton);
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
	
		<!-- 객실 아이템 목록 관리하기(11.17) -->
	<script>
		function openItemManagementPopup(){
			//alert('openItemManagementPopup');
			
			//새 브라우저 열기 ('_blank')는 새 창을 의미
			var newItemManagementWindow = window.open('/getItemList.ado', '_blank', 'width=600, height=450');

			// 기존의 이벤트 핸들러를 제거
		    newItemManagementWindow.onbeforeunload = null;

			 //새 창의 위치 설정
			newItemManagementWindow.moveTo(470, 200);
			
			//새 창이 닫힐때 이벤트 설정(11.20)
			newItemManagementWindow.onbeforeunload = function() {

		            // 팝업에서 추가한 아이템을 메인 JSP로 전송
		            sendAddedItemsToServer();
		     };
		     		     
		}
	</script>
	
	<script>
		function registerAndRedirect(){
			alert("registerAndRedirect");
		    // 페이지 이동 막기 해제
		    window.onbeforeunload = null;

			//객실명과 필수 데이터 가져오기
			var roomName = document.forms["insertRoomRegForm"]["room_name"].value;
			var roomCategory = document.forms["insertRoomRegForm"]["room_category"].value;

			var selectedPersonNum = personNum();

			//document.forms["insertRoomRegForm"]["person_num"].value = personNum;

			var selectedDogNum = dogNum();
			//document.forms["insertRoomRegForm"]["dog_num"].value = dogNum;

			var roomSize = document.forms["insertRoomRegForm"]["room_size"].value;
			
			var roomguide = document.forms["insertRoomRegForm"]["room_guide"].value;
			
			var checkInTime = checkinTime();
			
 			var checkOutTime = checkoutTime();

 		   	// 선택된 체크박스 값 가져오기
	        var selectedItems = getSelectedItems();
 		   	alert(selectedItems);
// 			var selectedItems = Array.from(document.querySelectorAll('input[name="roomItems"]:checked')).map(item => item.value).join(', ');
// 			alert(slectedItems);
// 			document.getElementById('selectedItems').value = selectedItems;


			//getRoomView.jsp로 파마리터와 함께 리다이렉트
			var redirectURL = 'getRoomView.jsp?&roomName=' + encodeURIComponent(roomName) +
	         '&roomCategory=' + encodeURIComponent(roomCategory) +
	         '&personNum=' + encodeURIComponent(personNum()) +
	         '&dogNum=' + encodeURIComponent(dogNum()) +
	         '&roomSize=' + encodeURIComponent(roomSize) +
	         '$checkInTime=' + encodeURIComponent(checkinTime)+
 	         '$checkOutTime=' + encodeURIComponent(checkoutTime)+
	         '&selectedItems=' + encodeURIComponent(selectedItems) + 
	         '&roomguide=' + encodeURIComponent(roomguide);
			
	        // alert("redirectURL: " + redirectURL);
			window.location.href = redirectURL;
		}
	</script>

 	<!-- 체크인/체크아웃 시간 넘기기 -->
	<script>
 	function checkinTime(){
 		
 		//checkinTimeSelect 엘리먼트에 접근
 		var checkinTime = document.getElementById("checkinTimeSelect");
 		
 		//선택된 옵션 엘리먼트 가져오기
 		var selectedTime = checkinTimeSelect.options[checkinTimeSelect.selectedIndex].value;
		console.log(selectedTime);

		//현재 날짜를 가져옴
		var inTime = new Date();
		console.log(inTime);
		
		//선택된 시간 문자열을 ":" 분리
		var timeParts = selectedTime.split(":");
		var hours = parseInt(timeParts[0], 10);
		var minutes = parseInt(timeParts[1], 10);
		
		console.log("Hours: ", hours);
		console.log("Minutes: ", minutes);
		
		//현재 날짜를 기준으로 시간 설정
		inTime.setHours(hours, minutes, 0, 0);
		console.log(inTime);
		
		//가져온 값을 HH:mm 형식을 변환
		var formattedInTime = inTime.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
		console.log("Formatted Time: ", formattedInTime);
 		
 		return formattedInTime;

 	}	

 	function checkoutTime(){
 		
 		//checkoutTimeSelect 엘리먼트에 접근
 		var checkoutTimeSelect = document.getElementById("checkoutTimeSelect");
 		
 		//선택된 옵션 엘리먼트 가져오기
 		var selectedOutTime = checkoutTimeSelect.options[checkoutTimeSelect.selectedIndex].value;
 		console.log(selectedOutTime);
 		
 		//현재 날짜 가져옴
 		var outTime = new Date();
 		console.log(outTime);
 		
 		//선택된 시간 문자열을 분리
 		var outTimeParts = selectedOutTime.split(":");
 		var outHours = parseInt(outTimeParts[0], 10);
 		var outMinutes = parseInt(outTimeParts[1], 10);
 		
 		console.log("Hours", outHours);
 		console.log("Minutes", outMinutes);
 		
 		//현재 날짜를 기준으로 시간 설정
 		outTime.setHours(outHours, outMinutes, 0, 0);
 		console.log(outTime);
 		
 		//(추가)가져온 값을 HH:mm으로 변환
 		var formatoutTime = outTime.toLocaleTimeString([], {hour:'2-digit', minute:'2-digit'});
		console.log("formatoutTime:", formatoutTime);
		
		return formatoutTime;
 	}
 	</script>
	
	<script>
	 function submitForm(){
			alert("submitForm");
		 // 객실명 필드 값 가져오기
		    var roomName = document.forms["insertRoomRegForm"]["room_name"].value;
			alert("roomName: " + roomName);
		    // 객실명이 비어 있는지 확인
		    if (roomName.trim() === "") {
		      alert("객실명을 입력하세요.");
		      return false; // 폼 전송 중지
		    }

		    var person = document.getElementById("personNumSelect");
	        var dog = document.getElementById("dogNumSelect");
	        
	        document.getElementById("personNumSelect").value = person.options[person.selectedIndex].value;
	        alert("손님 수: " + person.options[person.selectedIndex].value + "명");
	        document.getElementById("dogNumSelect").value = dog.options[dog.selectedIndex].value;
	        alert("강아지 수: " + dog.options[dog.selectedIndex].value + "마리");
	               
	        var roomSize = document.forms["insertRoomRegForm"]["room_size"].value;
	        alert("roomSize: " + roomSize);
	        
	        var checkin = document.getElementById("checkinTimeSelect");
	        document.getElementById("checkinTimeSelect").value = checkin.options[checkin.selectedIndex].value;
	        alert("체크인 시간: " + checkin.options[checkin.selectedIndex].value);
	        
	      	var checkout = document.getElementById("checkoutTimeSelect");
	      	document.getElementById("checkoutTimeSelect").value = checkout.options[checkout.selectedIndex].value;
	      	alert("체크아웃 시간: " + checkout.options[checkout.selectedIndex].value);
	      	
	        // 폼 제출
	        document.forms["insertRoomRegForm"].submit();
	 }
	</script>
	
		<!-- 객실 유형 select박스 값과 크기 전달(11.22) -->
	<script>
		function roomType(){
			//선택한 값 가져오기(select 박스값)
			var selectedRoomType = document.getElementById("roomTypeSelect").value;
	
	        console.log(selectedRoomType);
		}
	</script>
	
	<!-- 수용가능 인원 / 강아지 수 (11.23 추가)--> 
	<script>
		function personNum(){
		
// 			//personNumSelect 엘리먼트에 접근
 			var personNumSelect = document.getElementById("personNumSelect");
			
// 			//선택된 옵션 엘리먼트의 값 가져오기
 			var selectedValue = personNumSelect.options[personNumSelect.selectedIndex].value;
// 			//가져온 값을 정수로 변환
 			var selectedPersonNum = parseInt(selectedValue);

// 			//정수값 사용
 			console.log(selectedPersonNum);

	     // 함수의 반환값으로 정수값을 반환
	        return selectedPersonNum;
		}
		
		function dogNum(){
			//dogNumSelect 엘리먼트에 접근
			var dogNumSelect = document.getElementById("dogNumSelect");
			
			//선택된 옵션 엘리먼트의 값 가져오기
			var selectedValue = dogNumSelect.options[dogNumSelect.selectedIndex].value;
			
			//가져온 값을 정수로 변환
			var selectedDogNum = parseInt(selectedValue);
			
			//정수값 사용
			console.log(selectedDogNum);
			   
	        return selectedDogNum;
		}
		
		function getCheckboxValue()  {
			//선택된 체크박스의 값을 저장할 배열
			var selectedItems = [];
			
			//모든 체크박스에 대해 반복
			var checkboxes = document.getElementsByName("room_item_idx");
			for(var i=0; i<checkboxes.length; i++){
				if(checkvoxes[i].checked){
					selectedItems.push(checkboxes[i].value);
				}
			}
			
			//배열을 문자열로 변환하여 hidden필드에 할당
			document.getElementById("result").value=selectedItems.join(',');
			console.log("Selected Items: ", selectedItems);
			return selectedItems;
		}	 
</script>
	
</body>
</html>