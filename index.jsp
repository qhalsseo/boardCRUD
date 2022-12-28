<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>웹 애플리케이션</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <!-- 제이쿼리 플러그인 파일 -->
    <script src="./js/jquery-1.12.4.min.js"></script>
    <script src="./js/jquery-3.3.1.min.js"></script>
    <!-- prefix 자동설정 -->
    <script src="./js/prefixfree.min.js"></script>
    <!-- JS 파일 추가 -->
    <script src="./js/index.js"></script>	
    <!-- 기본 코딩 파일 -->
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/notosans_Kr_CDN.css">
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/index.css">
    <link rel="stylesheet" href="./css/index02.css">
</head>
<body>
    <div id="wrap" class="card-body">
        <!-- Header -->
        <header class="w1440">
				<jsp:include page="/include/header.jsp"/>
        </header>
        <!-- /Header -->
        <!-- Content -->
        <main role="main">
            <section class="frame ">
            <!-- 중간 배너 -->
                 <div class="text-wrap w1440">
                    <strong class="frank">Welstroy.</strong>
                   <h3>더 나은 <br> 푸드 라이프를 만듭니다.</h3>
                   <div class="wrap-img">
                       <p>
                        식음서비스부터 식자재공급까지 <br>
                         국내외 고객의 건강한 푸드라이프를 위해<br>
                         최고의 상품과 서비스를 준비합니다.
                        </p>
                        <img src="./images/bg_quotes.png" alt="따옴표">
                   </div>
                </div>
            </section>
            <!-- 컨텐츠 01 부분 -->
            <section class="content01 w1440">
                <div class="content-text-wrap">
                    <strong class="frank">Welstroy.</strong>
                    <h3>식음 서비스의 모든 <br> 솔루션을 제공합니다.</h3>
                    <p>
                        삼성웰스토리는 푸드서비스를 시작으로 <br>
                        식자재 유통 서비스 뿐만 아니라, <br> 
                        글로벌 식음서비스까지 제공합니다. 
                    </p>
                </div>
                <div class="content01-img">
                    <img src="./images/thumb_01.jpg" alt="삼성웰스토리">
                </div>
            </section>
            <!-- 컨텐츠02부분 -->
            <section class="content02 w1440">
                <div class="content02-img">
                    <img src="./images/thumb_02.jpg" alt="삼성웰스토리">
                </div>
                <div class="content-text-wrap">
                    <strong class="frank">Vision.</strong>
                    <h3>더 건강하고 행복한 <br>세상을 만듭니다.</h3>
                    <p>
                        삼성웰스토리는 글로벌 식음 기업으로서 <br>
                        건강한 식문화를 선도하며 삶의 질을 <br>
                        높이겠습니다. <br>
                    </p>
                </div>
            </section>
            <!-- 컨텐츠04 -->
            <div class="main_sec04 w1440">
                <img src="./images/img4.jpg" alt="메인이미지4">
                <div id="main04" class="cf">
                    <div id="main04_01">
                        <h2>Sustainability.</h2>
                        <h3>
                            지역사회와 상생하고 <br>
                            환경을 생각합니다.
                        </h3>
                    </div>
                    <div id="main04_02">
                        <p> 고객,임직원,파트너와  <br>
                            지역사회가 건강할 수 있도록<br>
                            노력합니다.
                        </p>
                    </div>
                </div>
            </div>
            <!-- 컨텐츠 05 -->
            <div class="main_sec05">
                <div class="main_div">
                    <div id="main05_01">
                        <h2>Location</h2>
                        <h3>
                            국내외 사업장에 <br>
                            방문을 원하시나요?
                        </h3>
                        <p>
                            삼성웰스토리 본사 및 물류센터, <br>
                            해외 사업장을 안내해 드립니다. 
                        </p>
                        <button id="view_h2">VIEW MORE</button>
                    </div>
                    <div id="main05_02">
                        <img src="./images/img5.jpg" alt="메인이미지5">
                    </div>
                </div>
            </div>
            <aside >
                <div class="aside_01">
                    <p>온라인으로 무엇이든 물어보세요. 맛있는 일상을 위해 언제나 함께합니다</p>
                    <p><a href="#"> 브랜드 스토리북 ↓</a></p>
                    <p><a href="#"> ESG보고서↓</a></p>
                </div>
            </aside>
        </main>
        <!-- /Content -->
        <!-- TOP button  -->
        <a href="#" id="top" class="w1440"><img src="./images/top.png" alt="top bottom"></a>
        <!-- Footer -->
        <footer>
            <jsp:include page="/include/footer.jsp"/>
        </footer>
        <!-- /Footer -->
        
    </div>
</body>
</html>