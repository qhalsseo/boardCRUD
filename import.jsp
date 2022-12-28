<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인 X -> 로그인 창으로 이동
	String name = (String) session.getAttribute("name");
	if(name==null){
		response.sendRedirect("login.jsp");
	} 

%>
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
   <script type="text/javascript" src="./smarteditor2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
	<script type="text/javascript" src="./js/jquery-1.11.0.min.js"></script>
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
     <main role="main">
        <h3>공지사항 등록</h3>
        <form action="NoticeWriteCon.do" method="post">
          <table>
            <tr>
              <td colspan="2" class="comment">
                내용 입력란에서 Alt+0을 누르면 접근성 도움말을 확인할 수 있습니다.<br>
                ALT+. 를 누르면 스마트 에디터 다음 요소로 ALT+, 를 누르면 스마트에디터 이전 요소로 빠져나갈 수 있습니다.
              </td>
            </tr>
            <tr>
              <th>작성자</th>
              <td>
                <input type="text" name="writer" class="form-control">
              </td>
            </tr>
            <tr class="title">
              <th>제목</th>
              <td>
                <input type="text" name="subject" required="required" class="form-control">
              </td>
            </tr>
            <tr class="btn_tr">
              <td colspan="2">
                <select name="import">
                  <option value="import">Import&nbsp;&nbsp;&nbsp;중요&nbsp;공지사항</option>
                  <option value="normal">Normal&nbsp;&nbsp;&nbsp;일반&nbsp;공지사항</option>
                </select>
              </td>
            </tr>
            <tr>
              <th>내용</th>
              <td colspan="2" style="padding: 11px 30px 11px 20px;">
               	<textarea name="content" id="content" rows="10" cols="100" class="form-control"></textarea>
              </td>
            </tr>
            <tr class="title">
              <th>비밀번호</th>
              <td>
                <input type="password" name="password" required="required" class="form-control">
              </td>
            </tr>
          </table>
          <div class="btn_submit">
            <button type="submit" class="submit" >등록하기</button>
            <button class="back">다시작성</button>
            <button type="button" class="submit" onclick="location.href='GetNoticeListCtrl'">전체글목록</button>
          </div>
        </form>
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