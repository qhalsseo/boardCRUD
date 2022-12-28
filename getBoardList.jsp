<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>게시판 페이지</title>
    <link rel="stylesheet" href="./css/reset.css">
    <link rel="stylesheet" href="./css/font.css">
    <link rel="stylesheet" href="./css/index.css">
    <link rel="stylesheet" href="./css/index02.css">
    <link rel="stylesheet" href="./css/getBoardList.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://unpkg.com/bootstrap@3.3.7/dist/css/bootstrap.min.css">
</head>
<body>
    <div id="wrap">
    	  <!-- 수정시 비번이 맞으면, 스코프 영역 request에 할당된 11이 넘어옴 -->
       <c:if test="${msg == 11 }">
          <script>
             alert('수정완료');
          </script>
       </c:if>
       <!-- 수정시 비번이 틀리면 스코프 영역 request에 할당된 1이 넘어옴 -->
       <c:if test="${msg == 1 }">
          <script>
             alert("비밀번호 다릅니다. 다시 입력해주세요.");
             history.go(-1);
          </script>
       </c:if>
    
       <!-- 삭제시 비번이 맞으면, 스코프 영역 request에 할당된 22이 넘어옴 -->
       <c:if test="${msg == 22 }">
          <script>
             alert('삭제완료');
          </script>
       </c:if>
       <!-- 삭제시 비번이 틀리면 스코프 영역 request에 할당된 2이 넘어옴 -->
       <c:if test="${msg == 2 }">
          <script>
             alert("비밀번호 다릅니다. 다시 입력해주세요.");
             history.go(-1);
          </script>
       </c:if>
    
    

    
    	<!-- Header -->
        <header class="w1440">
				<jsp:include page="/include/header.jsp"/>
        </header>
    <!-- /Header -->
        <section class="contents w1440">
            <h3>소비자 의견</h3>
            <div class="boardList">
                <div class="board_button">
                    <!-- 게시판 운영 원칙 -->
                    <button onclick="location.href='#';">
                        <img src="./images/img_icon_rule.png" alt="img">&nbsp;
                        게시판 운영 원칙
                    </button>
                    <!-- /게시판 운영 원칙 -->
                    <!-- 게시판 글쓰기 -->
                    <button onclick="location.href='board_write.jsp';">
                        글쓰기&nbsp;
                        <img src="./images/img_icon_write.png" alt="img">
                    </button>
                    <!-- /게시판 글쓰기 -->
                </div>
                <!-- 게시판 목록 -->
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th width=200>번호</th>
                            <th>제목</th>
                            <th width=150>작성자</th>
                            <th width=150>작성일</th>
                            <th width=150>조회</th>	
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="board" items="${boardList }" varStatus="status">
                        <tr>
                            <td>${status.count }</td>
                            <td>
                            	<!-- 댓글은 무조건 부모글 보다 크니까 크면 댓글이 있다는 것 -->
								<c:if test="${board.re_step > 1 }">
									<!-- 5칸씩 들여쓰기 로직, 즉 댓글 레벨에 따라 5칸씩 증가 -->
									<c:forEach var="j" begin="1" end="${(board.re_step-1)*3 }">
										&nbsp;
									</c:forEach>
									<img alt="img" src="./images/img_icon_reply.png">
								</c:if>
								
                                <a href="GetBoardCtrl?num=${board.num }">${board.subject }</a>
                            </td>
                            <td>${board.writer }</td>
                            <td>${board.reg_date }</td>
                            <td>${board.readcount }</td>	
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <!-- /게시판 목록 -->

                <!-- 게시판 이동 -->
                <div class="board_page">
                    <a class="first_page" href="#"></a>
                    <a class="prev_page" href="#"></a>

                    <a class="number_page" href="#">1</a>

                    <a class="next_page" href="#"></a>
                    <a class="last_page" href="#"></a>
                </div>
                <!-- /게시판 이동 -->

                <!-- 게시판 검색 -->
                <div class="board_search">
                    <form action="#" method="post">
                        <ul>
                            <li class="search_select">
                                <select id="searchType">
                                    <option value="subject">제목</option>
                                    <option value="subject">제목+내용</option>
                                    <option value="content">내용</option>
                                    <option value="writer">작성자</option>
                                    <option value="id">아이디</option>
                                </select>
                            </li>
                            <li class="search_input">
                                <input type="text" name="">
                            </li>
                            <li class="search_submit">
                                <button type="submit">검색</button>
                            </li>
                        </ul>
                    </form>
                </div>
                <!-- /게시판 검색 -->
            </div>
        </section>
        <!-- Footer -->
        <footer >
            <jsp:include page="/include/footer.jsp"/>
        </footer>
        <!-- /Footer -->
    </div>
</body>
</html>