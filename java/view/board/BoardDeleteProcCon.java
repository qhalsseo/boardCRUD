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
 * Servlet implementation class BoardDeleteProcCon
 */
@WebServlet("/BoardDeleteProcCon.do")
public class BoardDeleteProcCon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGetPost(request, response);
	}
	protected void doGetPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 한글처리
		request.setCharacterEncoding("utf-8");
		// 데이터 처리
		int num = Integer.parseInt(request.getParameter("num"));
		String password =request.getParameter("password");
		String pass =request.getParameter("pass");
		
		// 패스워드 비교
	      if(password.equals(pass)) { // 입력받은 비밀번호와 DB의 비밀번호 비교 
	    	  BoardDAO bdao = new BoardDAO();
		      bdao.deleteBoard(num);

	         request.setAttribute("msg","22");
	         RequestDispatcher dis = request.getRequestDispatcher("GetBoardListCtrl");
	         dis.forward(request, response); 
	         
	      } else {
	         request.setAttribute("msg","2");
	         RequestDispatcher dis = request.getRequestDispatcher("GetBoardListCtrl");
	         dis.forward(request, response);
	      }
	}

}
