$(document).ready(function(){
    $(function() {
        // 보이기 | 숨기기
        $(window).scroll(function() {
            if ($(this).scrollTop() > 800) { //1000 넘으면 버튼이 보여짐
                    $('#top').fadeIn();
                    } else {
                    $('#top').fadeOut();
            }
        });
        // 버튼 클릭시
        $("#top").click(function() {   
        $('html, body').animate({
            scrollTop : 0    
            }, 200);     
            return false;
            });
        });
    
        /* 스크롤 값 확인  */
    /*     $(window).scroll(function () { 
        var scrollValue = $(document).scrollTop(); 
        console.log(scrollValue); 
    }); */
});
