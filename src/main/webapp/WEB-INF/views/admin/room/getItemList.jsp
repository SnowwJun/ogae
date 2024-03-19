<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 11.17 추가 -->
<link rel="stylesheet" type="text/css" href="/resources/css/admin/roomItemMange.css">

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script>
        var isSubmitting = false; // 중복 제출 방지 변수
        var items = []; // 현재 화면에 표시된 아이템 목록을 저장하는 배열

        $(document).ready(function() {
            // 페이지 로드 시 서버에서 아이템 목록을 가져와 화면에 표시
            $.ajax({
                type: 'get',
                url: '/getRoomItems.ado', // 실제로는 해당 URL을 서버에서 구현해야 합니다.
                success: function(response) {
                    // 서버에서 받은 아이템 목록을 화면에 표시
                    displayItems(response);
                },
                error: function(error) {
                    console.error(error);
                }
            });
        });

        function displayItems(itemsFromServer) {
            $(".itemContainer").remove();
            items = itemsFromServer;
            
            for (var i = 0; i < items.length; i++) {
            	//console.log( items[i].room_item_idx);
                var newItemHtml = '<div class="itemContainer" data-item-id="' + items[i].room_item_idx + '">' +
                    '   <span>' + items[i].room_item_name + '</span>' +
//                     '   <button type="button" class="update" onClick="updateItem()">수정</button>' +
                    '   <button type="button" class="deleteRoomItem" data-item-id="' + items[i].room_item_idx + '"  onClick="deleteButton(this)">삭제</button>' +
                    '</div>';
                $("#itemContainer").before(newItemHtml);
            }
        }
        
        function deleteButton(button) {
            var itemId = $(button).data('item-id');
            console.log(itemId);
            // 사용자에게 삭제 여부 확인
            if (confirm("정말로 이 항목을 삭제하시겠습니까?")) {
                // 서버에서 항목을 삭제하기 위한 AJAX 요청 수행
                $.ajax({
                    type: 'GET',
                    url: '/deleteRoomItem.ado', 
                    data: { room_item_idx: itemId },
                    success: function(response) {
                        // 성공 시 UI 업데이트 또는 항목 목록 재로드
         
                        console.log('항목이 성공적으로 삭제되었습니다');
                        // 삭제 후 아이템 목록 갱신(11.20 추가)
                        refreshItemList();
                    },
                    error: function(error) {
                        console.error('항목 삭제 오류:', error);
                    }
                });
            }
        }
</script>
<title>객실 아이템 관리</title>
</head>
<body>
	<h3>객실 아이템 관리</h3>
	<hr>
	<br>
	<form id="itemForm" action="/insertRoomItem.ado" method="post">
	<div id="itemContainer">
		<input type="text" name="room_item_name" class="inputBox">
		<button type="button" class="insert" onClick="insertButton()">등록</button>
		<button type="button" class="plus" onClick="plusButton()">+</button>
		<button type="button" class="delete" onClick="deleteBox(this)">-</button>
	</div>
	
	</form>
	
	
	<script>
	var isSubmitting = false; // 중복 제출 방지 변수
	var items = []; // 현재 화면에 표시된 아이템 목록을 저장하는 배열
	
    $(document).ready(function() {
        // 페이지 로드 시 서버에서 아이템 목록을 가져와 화면에 표시
        $.ajax({
            type: 'get',
            url: '/getRoomItems.ado', // 실제로는 해당 URL을 서버에서 구현해야 합니다.
            success: function(response) {
                // 서버에서 받은 아이템 목록을 화면에 표시
                displayItems(response);
            },
            error: function(error) {
                console.error(error);
            }
        });
    });
    

 
//  function updateItem() {
// 	  // 선택된 아이템 컨테이너
//      var selectedItem = $(event.target).closest('.itemContainer');

//      // 아이템 ID 가져오기
//      var itemId = selectedItem.attr('data-item-id');

//      // 현재 아이템의 이름 가져오기
//      var itemName = selectedItem.find('span').text();

//      // 이름을 수정 가능한 input 박스로 변경
//      var inputHtml = '<input type="text" id="editItem_' + itemId + '" value="' + itemName + '">';
//      selectedItem.find('span').html(inputHtml);

//      // '수정' 버튼을 '완료' 버튼으로 변경
//      var updateButtonHtml = '<button type="button" class="update" onClick="saveItem(\'' + itemId + '\')">완료</button>';
//      selectedItem.find('.update').replaceWith(updateButtonHtml);
//  }

// 	function saveItem(itemId) {
// 		 // 수정된 데이터를 서버로 전송하는 로직 추가
//         var updatedName = $('#editItem_' + itemId).val();

//         $.ajax({
//             type: 'POST',
//             url: '/updateRoomItem.ado',
//             contentType: 'application/json',
//             data: JSON.stringify({ room_item_idx: itemId, room_item_name: updatedName }),
//             success: function(response) {
//                 console.log(response); // 서버에서의 응답 출력
//                 alert("수정 성공");

//                 // 성공 시 아이템 목록 갱신
//                 refreshItemList();
//             },
//             error: function(error) {
//                 console.error(error); // 에러 발생 시 에러 내용 출력
//             }
//         });
//     }

	
    
    <!-- 등록 후 아이템 목록 갱신(11.20 추가) -->
      	function refreshItemList(){
    		$.ajax({
    			type: 'get',
    			url: '/getRoomItems.ado',
    			success: function(response){
    				//서버에서 받은 아이템 목록 화면에 표시
    				displayItems(response);
    			},
    			error: function(error){
    				console.error(error);
    			}
    		});
    	}
    	
    
	//1206    
      function plusButton() {
    	  console.log("아이템박스 추가");

    	    var newItemHtml = '<div class="itemContainer">' +
    	        '   <input type="text" name="room_item_name" class="inputBox">' +
    	        '   <button type="button" class="insert" onClick="insertButton()">등록</button>' +
    	        '   <button type="button" class="plus" onClick="plusButton()">+</button>' +
    	        '   <button type="button" class="delete" onClick="deleteBox(this)">-</button>' +
    	        '</div>';

    	    $("#itemContainer").after(newItemHtml);
        }

 	   <!--11.20 추가-->
        function insertButton() {
			 var itemValue = $("input[name='room_item_name']").val();
			 
			 if (!itemValue) {
                alert("아이템 이름을 입력하세요.");
               	return;
            }

            $.ajax({
                type: 'POST',
                url: '/insertRoomItem.ado',
                data: { room_item_name: itemValue }, // 서버에 전송할 데이터
                success: function(response) {
                    console.log(response); // 서버에서의 응답 출력
                    alert("등록성공");
                    
                    //11.20추가
                    // 성공 시 아이템 목록 갱신
                    refreshItemList();
                },
                error: function(error) {
                    console.error(error); // 에러 발생 시 에러 내용 출력
                }
            });
        }
        
      
        function deleteBox(button) {
            console.log("input 박스 삭제");

            var itemContainers = $(".itemContainer");
            
            if (itemContainers.length >0) {
                // 현재 버튼을 포함하는 컨테이너를 찾아서 삭제
                $(button).closest(".itemContainer").remove();
            
             }else {
                console.log("더 이상 삭제할 항목이 없습니다.");
                alert("더이상 삭제할 수 없습니다");
            }
        }
</script>
</body>
</html>