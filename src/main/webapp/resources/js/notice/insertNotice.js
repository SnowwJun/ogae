// autoFillAdminName.js

// 함수를 만들어서 필요한 기능을 구현
function fillAdminName() {
    // 관리자 이름을 서버에서 가져옴
    // 서버와의 통신 또는 DB에서 데이터를 가져어옴
    var adminName = "ADMIN_NAME"; // 실제로는 서버에서 동적으로 가져온 값일 것

    // HTML 페이지가 로드될 때 실행
    window.onload = function() {

        // JavaScript를 사용하여 관리자 이름 필드에 자동으로 설정
        var nameInput = document.getElementById('notice_writer');
        if (nameInput) {
            nameInput.value = adminName;
        }
    };
}

// 함수를 실행하여 자동으로 이름을 채우기
fillAdminName();