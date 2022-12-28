<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 페이지</title>
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/index.css">
    <link rel="stylesheet" href="./css/index02.css">
    <link rel="stylesheet" href="./css/join.css">
    
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
            <h2>회원가입</h2>
        </div>
        <form action="JoinCtrl.do" method="post" >
            <table>
                <tr>
                    <td class="line">아이디</td>
                    <td class="line">
                        <input type="text" name="id" id="id">
                    </td>
                </tr>
                <tr>
                   <td class="line pt">비밀번호</td>
                   <td class="line">
                      <input type="password" name="password">
                   </td>
                </tr>
                <tr>
                   <td class="line pt">비밀번호 확인</td>
                   <td class="line">
                      <input type="password" name="password2" placeholder="비밀번호 확인">
                   </td>
                </tr>
                <tr>
                   <td class="line pt">이름</td>
                   <td class="line">
                      <input type="text" name="name">
                   </td>
                </tr>
                <tr>
                    <td class="line pt">이메일</td>
                    <td class="line">
                       <input type="email" name="email">
                    </td>
                 </tr>
                 <tr>
					<td class="line pt">유형</td>
					<td class="line">
						<select name="role">
							<option value="User">User</option>
							<option value="Admin">Admin</option>
						</select>
					</td>
				</tr>
                <tr>
                   <td colspan="2">
                      <input type="submit" value="회원가입" class="b_join">
                   </td>
                </tr>
            </table>
            </form>
    	</section>
        <!-- Footer -->
        <footer>
            <jsp:include page="/include/footer.jsp"/>
        </footer>
        <!-- /Footer -->
    </div>
</body>
</html>