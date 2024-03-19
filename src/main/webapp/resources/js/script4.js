var previewButton = document.getElementById('previewButton');
var previewContainer = document.getElementById('previewContainer');

// 미리보기 버튼 클릭 시 창 열기
previewButton.addEventListener('click', function() {
    previewContainer.style.display = 'block';
});

// 창 이외의 영역을 클릭하면 창 닫기
document.addEventListener('click', function(event) {
    if (event.target !== previewButton && event.target !== previewContainer) {
        previewContainer.style.display = 'none';
    }
});

