<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인 페이지</title>
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/index.css">
    <link rel="stylesheet" href="./css/index02.css">
    <link rel="stylesheet" href="./css/login.css">
    
</head>
<body>
    <div id="wrap">
    <!-- Header -->
     <header class="w1440">
            <jsp:include page="/include/header.jsp"/>
        </header>
        <!-- /Header -->
        <section class="contents">
        <div class="logo_area">
            <h2>로그인</h2>
        </div>
        <form action="LoginCtrl.do" method="post">
            <table>
                <tr>
                    <td class="line">아이디</td>
                    <td class="line">
                        <input type="text" name="id">
                    </td>
                </tr>
                <tr>
                   <td class="line pw">비밀번호</td>
                   <td class="line">
                      <input type="password" name="password">
                   </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="로그인" class="b_login">
                        <input type="reset" value="회원가입" class="b_reset" onClick="location.href='./join.jsp'">
                    </td>
                </tr>
            </table>
    	</section>
        <!-- Footer -->
        <footer>
            <jsp:include page="/include/footer.jsp"/>
        </footer>
        <!-- /Footer -->
    </div>
</body>
</html>