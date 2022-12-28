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

/**
 * Servlet implementation class GetBoardCtrl
 */
@WebServlet("/GetBoardCtrl")
public class GetBoardCtrl extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request, response);
	}
	
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글처리
		request.setCharacterEncoding("utf-8");
		// 세션 처리
		
		int num = Integer.parseInt(request.getParameter("num"));
		BoardVO vo = new BoardVO();
		vo.setNum(num);
		
		BoardDAO bdao = new BoardDAO();
		BoardVO board = bdao.getBoard(vo);
		
		if(board!=null) {
			request.setAttribute("board", board);
			RequestDispatcher dis = request.getRequestDispatcher("getBoard.jsp");
			dis.forward(request, response);
		}else {
			response.sendRedirect("GetBoardListCtrl");
		}
	}
	
	
}
