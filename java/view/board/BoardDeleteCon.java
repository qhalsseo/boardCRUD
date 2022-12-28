package view.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.dao.BoardDAO;
import biz.vo.BoardVO;


@WebServlet("/BoardDeleteCon.do")
public class BoardDeleteCon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request, response);
	}
	
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글처리
		request.setCharacterEncoding("utf-8");
		// 데이터 받기
		int num = Integer.parseInt(request.getParameter("num"));
		// DAO
		BoardDAO bdao=new BoardDAO();
		// 조회수 증가 없는 하나의 게시판 글 가져오는 메서드
		BoardVO bean = bdao.getOneUpdateBoard(num);
		
		// 바인딩,포워딩
		request.setAttribute("bean", bean);
		// 포워딩
		RequestDispatcher dis = request.getRequestDispatcher("board_delete.jsp");
		dis.forward(request, response);
	}

}
