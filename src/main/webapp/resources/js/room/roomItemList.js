
function openItemManagementPopup() {
    // 팝업 창 열기 및 아이템 목록 로드
    $.ajax({
        url: 'getItemList.jsp', // 아이템 목록을 로드하는 JSP 페이지의 경로
        type: 'GET',
        success: function (data) {
            // 팝업 창에 로드한 아이템 목록 표시
            $('#itemManagementPopup').html(data);
            $('#itemManagementPopup').show();
        },
        error: function () {
            alert('Failed to load item list.');
        }
    });
}

function deleteItem(itemId) {
    // 아이템 삭제를 처리하는 AJAX 요청
    $.ajax({
        url: 'deleteItem.jsp', // 아이템 삭제를 처리하는 JSP 페이지의 경로
        type: 'POST',
        data: {itemId: itemId},
        success: function () {
            // 아이템 삭제 성공 시 아이템 목록을 다시 로드
            openItemManagementPopup();
        },
        error: function () {
            alert('Failed to delete item.');
        }
    });
}