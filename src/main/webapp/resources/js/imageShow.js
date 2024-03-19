/**
 * 
 */
 
const images = document.querySelectorAll('.imageShow div');
let currentIndex = 0;
const intervalTime = 3000; // 이미지 전환 간격 (4초)

// 초기 이미지를 표시
images[currentIndex].style.display = 'block';

function nextImage() {
    // 현재 이미지를 숨김
    images[currentIndex].style.display = 'none';

    // 다음 이미지를 표시
    currentIndex = (currentIndex + 1) % images.length;
    images[currentIndex].style.display = 'block';
}

setInterval(nextImage, intervalTime);