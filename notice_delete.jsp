<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
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
    <script type="text/javascript" src="./se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
    <!-- 기본 코딩 파일 -->
    <!-- 기본 코딩 파일 -->
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/notosans_Kr_CDN.css">
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/index.css">
    <link rel="stylesheet" href="./css/index02.css">
    <link rel="stylesheet" href="./css/board_write.css">
</head>
<body>
 <div id="wrap" class="card-body">
<!-- Header -->
     <header class="w1440">
            <jsp:include page="/include/header.jsp"/>
        </header>
        <!-- /Header -->
        <!-- Content -->
     <main role="main" class=" wrap w1440">
      <!-- Content -->
        <h3>공지사항(글 삭제)</h3>
        <form action="NoticeDeleteProcCon.do" method="post">
          <table>
            <tr>
              <td colspan="2" class="comment">
                <p>내용 입력란에서 Alt+0을 누르면 접근성 도움말을 확인할 수 있습니다.</p>
                <p>ALT+. 를 누르면 스마트 에디터 다음 요소로 ALT+, 를 누르면 스마트에디터 이전 요소로 빠져나갈 수 있습니다.</p>
              </td>
            </tr>
            <tr>
              <th>작성자</th>
              <td  style="font-size: 18px; ">
                	${bean.writer }
              </td>
            </tr>
            <tr class="btn_tr">
              <td colspan="2">
                <button class="btn"><img src="./images/exclamation.png" alt="import">&nbsp;게시판 운영원칙</button>
              </td>
            </tr>
            <tr class="title">
              <th>제목</th>
              <td  style="font-size: 18px; ">
               		${bean.subject }
              </td>
            </tr>
            <tr>
              <th>내용</th>
              <td style="padding: 11px 30px 11px 20px; font-size: 18px;">
					${bean.content }         
              </td>
            </tr>
            <tr>
              <th>비밀번호</th>
              <td style="padding: 11px 30px 11px 20px;">
				 <input type="password" name="password" size="40" class="form-control" required="required">
              </td>
            </tr>
          </table>
          <div class="btn_submit">
          <!-- 폼처리 컨트롤러에 값 넘겨줌 -->
			<input type="hidden" name="num" value="${bean.num }">
			<input type="hidden" name="pass" value="${bean.password }">
            <button type="submit" class="submit">삭제</button>
            <button class="back" onclick = "location.href = 'NoticeDeleteCon.do' " >취소</button>
          </div>
        </form>
        <!-- /Content -->
        </main>
        <!-- /Content -->
        <!-- Footer -->
        <footer>
            <jsp:include page="/include/footer.jsp"/>
        </footer>
        <!-- /Footer -->

 </div>

</body>
</html>