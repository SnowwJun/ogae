    $(document).ready(function () {
        $('.popup-image').on('click', function () {
            const imageSrc = $(this).attr('src');
            $('#popup-image').attr('src', imageSrc);
            $('.image-popup').show();
        });

        $('.close-popup').on('click', function () {
            $('.image-popup').hide();
        });
    });
