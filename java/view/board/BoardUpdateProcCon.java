package view.board;

import java.io.IOException;

import javax.print.attribute.PrintRequestAttributeSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import biz.dao.BoardDAO;
import biz.vo.BoardVO;


@WebServlet("/BoardUpdateProcCon.do")
public class BoardUpdateProcCon extends HttpServlet {

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
		String password = request.getParameter("password");
		String pass = request.getParameter("pass");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		
		// 패스워드 비교
		if(password.equals(pass)) { // 입력받은 비밀번호와 DB의 비밀번호 비교
			BoardDAO bdao = new BoardDAO();
			bdao.updateBoard(num,subject,content);
			request.setAttribute("msg", "11");
			RequestDispatcher dis = request.getRequestDispatcher("GetBoardListCtrl");
			dis.forward(request, response);		
		}else {
			request.setAttribute("msg","1");
			RequestDispatcher dis = request.getRequestDispatcher("GetBoardListCtrl");
			dis.forward(request, response);
		}
		
	}

}
