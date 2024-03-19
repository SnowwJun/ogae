// 이미지를 클릭했을 때 팝업 함수를 호출하는 이벤트 리스너를 추가합니다.
    const imageItems = document.querySelectorAll('.image-item');
    const popupImage = document.getElementById('popup-image');
    const imagePopup = document.querySelector('.image-popup');

 	 imageItems.forEach(function(imageItem) {
        imageItem.addEventListener('click', function() {
            // 클릭한 이미지의 src 가져와서 팝업 이미지로 설정
            const clickedImage = imageItem.querySelector('img');
            popupImage.src = clickedImage.src;

            // 팝업 창을 표시합니다.
            imagePopup.style.visibility = 'visible';
            imagePopup.style.display = 'block';
        });
    });

    // 팝업 닫기 버튼 클릭 시 팝업 창을 숨깁니다.
    const closePopup = document.querySelector('.close-popup');
    closePopup.addEventListener('click', function() {
        imagePopup.style.visibility = 'hidden';
        imagePopup.style.display = 'none';
    });
 
 function openPopup(imageUrl) {
    // 팝업 창 크기 및 위치 설정
    const width = 800;
    const height = 500;
    const left = window.innerWidth / 2 - width / 2;
    const top = window.innerHeight / 2 - height / 2;
    
    // 새로운 브라우저 창에 팝업 열기
    const popupWindow = window.open('', '', `width=${width},height=${height},left=${left},top=${top}`);
    
    // 팝업 창에 이미지를 표시
    popupWindow.document.write(`<img src="${imageUrl}" style="max-width: 100%; max-height: 100%;">`);
}