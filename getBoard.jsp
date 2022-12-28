<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
   
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>글 읽기 페이지</title>
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/getBoard.css?ver=1">
    <link rel="stylesheet" href="./css/index.css">
    <link rel="stylesheet" href="./css/index02.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
</head>
<body>
    <div id="wrap">
    <!-- Header -->
        <header class="w1440">
				<jsp:include page="/include/header.jsp"/>
        </header>
    <!-- /Header -->
        <!-- 글 정보 -->
        <section class="contents w1440">
            <h3>소비자 의견</h3>
            <div class="boardList">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th width="20%">${board.num }</th>
                            <th width="80%" colspan="2">${board.subject }</th>     
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td width="20%">${board.writer }</td>
                            <td>
                                <div class="board_info">
                                    <p>${board.reg_date }</p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <p>조회수&nbsp;&nbsp;&nbsp;
                                        <span style="color:blue">${board.readcount }</span>
                                    </p>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="board_content">${board.content }</div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <div class="board_button">
                                    <div>
                                        추천
                                        <button class="like_button">
                                            <img src="./images/img_icon_like.PNG" alt="img">
                                        </button>
                                        <span style="color:red">0</span>
                                    </div>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <div>
                                        반대
                                        <button class="dislike_button">
                                            <img src="./images/img_icon_dislike.png" alt="img">
                                        </button>
                                        <span>0</span>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
        <!-- /글 정보 --> 

        <!-- 버튼목록 -->
        <section class="all_button_list w1440">
            <div class="update_button">
                <button onclick = "location.href = 'BoardUpdateCon.do?num=${board.num}' ">수정</button>
                <button onclick = "location.href = 'BoardDeleteCon.do?num=${board.num}' ">삭제</button>
            </div>
            <div class="button_list">
                <button onclick = "location.href = './board_write.jsp' ">
                    글쓰기&nbsp;&nbsp;
                    <img src="./images/img_icon_write.png" alt="img">
                </button>
                <button onclick = 'location.href ="BoardReWriteCon?num=${board.num}&ref=${board.ref }&re_step=${board.re_step }&re_level=${board.re_level }"'>답글</button>
                
                <button onclick = "location.href = 'GetBoardListCtrl' ">
                    목록&nbsp;&nbsp;
                    <img src="./images/img_icon_list.png" alt="img">
                </button>
            </div>
        </section>
        <!-- /버튼목록 -->
        <!-- Footer -->
        <footer >
            <jsp:include page="/include/footer.jsp"/>
        </footer>
        <!-- /Footer -->
    </div>
</body>
</html>
