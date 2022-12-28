package biz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import biz.common.JDBCConnection;
import biz.vo.BoardVO;
import biz.vo.NoticeVO;

public class BoardDAO {
	Connection conn = null;
	PreparedStatement stmt = null;
	ResultSet rs = null;
	
	
	/* ---------------------------------------------------------------------- */
	/* ----------------------       문의게시판        -------------------------- */
	/* ---------------------------------------------------------------------- */
	
	// 문의게시판 목록 불러오기
	public ArrayList<BoardVO> getBoardList() {
		ArrayList<BoardVO> boardList = null;
		try {
			// DB연결
			conn = JDBCConnection.getConnection();
			// sql
			String sql= "SELECT * FROM project_board order by ref desc, re_step asc";
			// ?
			stmt = conn.prepareStatement(sql);
			// 실행
			rs = stmt.executeQuery();
			// 사용
			boardList = new ArrayList<BoardVO>();
			while(rs.next()) {
				
				BoardVO board = new BoardVO();
				
				board.setNum(rs.getInt(1));
				board.setWriter(rs.getString(2));
				board.setEmail(rs.getString(3));
				board.setSubject(rs.getString(4));
				board.setPassword(rs.getString(5));
				board.setReg_date(rs.getString(6));
				board.setRef(rs.getInt(7));
				board.setRe_step(rs.getInt(8));
				board.setRe_level(rs.getInt(9));
				board.setReadcount(rs.getInt(10));
				board.setContent(rs.getString(11));
				
				boardList.add(board);
			}
			
		}  catch(ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs,stmt, conn);
		}
		
		return boardList;
	}
	
	// 문의게시판 글쓰기 메서드
		public void insertBoard(BoardVO bean) {
			int ref = 0; // 글그룹
			int re_step = 1; // 새글 
			int re_level = 1; // 댓글
			
			try {
				// DB연결
				conn = JDBCConnection.getConnection();
				// sql
				String refSQL = "select max(ref) from project_board";
				// ?
				stmt = conn.prepareStatement(refSQL);
				// 실행
				rs = stmt.executeQuery();
				if(rs.next()) {
					ref = rs.getInt(1)+1; // 최댓값에 1을 더해 새 그룹 만들기
				}
				
				
				// b. 글쓰기 내용 DB 저장 = 시퀀스 사용
				String sql = "insert into project_board VALUES((select nvl(max(num),0)+1 from project_board),?,?,?,?,sysdate,?,?,?,0,?)";
				// ?
				stmt = conn.prepareStatement(sql);
				// ? 매핑
				stmt.setString(1, bean.getWriter());
				stmt.setString(2, bean.getEmail());
				stmt.setString(3, bean.getSubject());
				stmt.setString(4, bean.getPassword());
				stmt.setInt(5, ref);
				stmt.setInt(6, re_step);
				stmt.setInt(7, re_level);
				stmt.setString(8, bean.getContent());
				// 실행
				stmt.executeUpdate();
				// 자원반납
				stmt.close();
				conn.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	
	
	// 문의게시판 글 읽기 메서드
	public BoardVO getBoard(BoardVO vo) {
		BoardVO board = null;
		try {
			// DB 접속
			conn = JDBCConnection.getConnection();
			// sql
			String sql = "UPDATE project_board SET readcount = (select readcount + 1 from project_board where num = ?) where num = ?";
			// ?
			stmt = conn.prepareStatement(sql);
			// ? 매핑
			stmt.setInt(1, vo.getNum());
			stmt.setInt(2, vo.getNum());
			// 실행
			stmt.executeUpdate();
			stmt.close();
			
			// sql = 글 읽기
			sql = "SELECT * FROM project_board where num=?";
			// ?
			stmt = conn.prepareStatement(sql);
			// ? 매핑
			stmt.setInt(1, vo.getNum());
			// 실행
			// rs에 모든 컬럼들이 받아진 상태
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				board = new BoardVO();
				board.setNum(rs.getInt(1));
				board.setWriter(rs.getString(2));
				board.setEmail(rs.getString(3));
				board.setSubject(rs.getString(4));
				board.setPassword(rs.getString(5));
				board.setReg_date(rs.getString(6));
				board.setRef(rs.getInt(7));
				board.setRe_step(rs.getInt(8));
				board.setRe_level(rs.getInt(9));
				board.setReadcount(rs.getInt(10));
				board.setContent(rs.getString(11));
				
			}
			
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs,stmt, conn);
		}
		
		return board;
	}
	
	
	// 문의게시판 하나의 글 불러오기
   public BoardVO getOneUpdateBoard(int num) {
     
      BoardVO bean = null;
      try {
    	// DB연결
    	  conn = JDBCConnection.getConnection();
         // SQL
         String sql = "select * from project_board where num=?";
         // ?
         stmt = conn.prepareStatement(sql);
         // ? 매핑
         stmt.setInt(1, num);
         // 실행
         rs = stmt.executeQuery();
         // 사용
         while(rs.next()) {
              bean = new BoardVO();
              
              bean.setNum(rs.getInt(1));
              bean.setWriter(rs.getString(2));
              bean.setEmail(rs.getString(3));
              bean.setSubject(rs.getString(4));
              bean.setPassword(rs.getString(5));
              bean.setReg_date(rs.getString(6));
              bean.setRef(rs.getInt(7));
              bean.setRe_step(rs.getInt(8));
              bean.setRe_level(rs.getInt(9));
              bean.setReadcount(rs.getInt(10));
              bean.setContent(rs.getString(11));   
         }
         // 반납
         stmt.close();
         rs.close();
         conn.close();
         
      } catch (Exception e) {
         e.printStackTrace();
      }
      
      // 리턴
      return bean;
   }
	
	
	// 문의게시판 수정 
	public void updateBoard(int num, String subject, String content) {
		
		try {
			// DB연결
			conn = JDBCConnection.getConnection();
			// sql
			String sql="UPDATE project_board SET subject = ? , content = ? where num = ? ";
			// ? 
			stmt=conn.prepareStatement(sql);
			// ? 매핑	
			stmt.setString(1, subject);
			stmt.setString(2, content);
			stmt.setInt(3, num);
			// 실행
			stmt.executeUpdate();
			// 자원반납
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 문의게시판 삭제 
	public void deleteBoard(int num) {
		
	      try {
	    	  // DB연결
	    	  conn = JDBCConnection.getConnection();
	          // sql
	          String sql = "delete from project_board where num = ?";
	          // ?
	          stmt = conn.prepareStatement(sql);
	          // ? 매핑
	          stmt.setInt(1, num);
	          // 실행
	          stmt.executeUpdate();
	          // 자원반납
	          stmt.close();
	          conn.close();
	          
	       } catch (Exception e) {
	          e.printStackTrace();
	       }
		
	}
	
	// 문의게시판 댓글쓰기
	public void rewriteBoard(BoardVO bean) {
		int ref = bean.getRef();
		int re_step = bean.getRe_step();
		int re_level = bean.getRe_level();
		try {
			conn = JDBCConnection.getConnection();
			String resql = "update project_board set re_level = re_level+1 where ref = ? and re_level > ?";
			stmt = conn.prepareStatement(resql);
			stmt.setInt(1, ref);
			stmt.setInt(2, re_level);
			stmt.executeUpdate();
			//답글 삽입
			String sql = "insert into project_board VALUES((select nvl(max(num),0)+1 from project_board),?,?,?,?,sysdate,?,?,?,0,?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, bean.getWriter());
			stmt.setString(2, bean.getEmail());
			stmt.setString(3, bean.getSubject());
			stmt.setString(4, bean.getPassword());
			stmt.setInt(5, ref);
			stmt.setInt(6, re_step+1);
			stmt.setInt(7, re_level+1);
			stmt.setString(8, bean.getContent());
			
			stmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
	         e.printStackTrace();
	    } catch (SQLException e) {
	         e.printStackTrace();
	    } finally {
	         JDBCConnection.close(rs,stmt,conn);
	    }	
		
	}

	
	/* ---------------------------------------------------------------------- */
	/* ----------------------       공지게시판        -------------------------- */
	/* ---------------------------------------------------------------------- */
	
	// 공지게시판 목록 불러오기
	public ArrayList<NoticeVO> getNoticeList() {
		ArrayList<NoticeVO> noticeList = null;
		try {
			// DB연결
			conn = JDBCConnection.getConnection();
			// sql
			String sql= "SELECT * FROM project_notice ORDER by ref desc, re_step asc";
			// ?
			stmt = conn.prepareStatement(sql);
			// 실행
			rs = stmt.executeQuery();
			// 사용
			noticeList = new ArrayList<NoticeVO>();
			while(rs.next()) {
				NoticeVO notice = new NoticeVO();
				notice.setNum(rs.getInt("num"));
				notice.setWriter(rs.getString("writer"));
				notice.setEmail(rs.getString("email"));
				notice.setSubject(rs.getString("subject"));
				notice.setPassword(rs.getString("password"));
				notice.setReg_date(rs.getString("reg_date"));
				notice.setRef(rs.getInt("ref"));
				notice.setRe_step(rs.getInt("re_step"));
				notice.setRe_level(rs.getInt("re_level"));
				notice.setReadcount(rs.getInt("readcount"));
				notice.setContent(rs.getString("content"));
				
				noticeList.add(notice);
			}
			
		}  catch(ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs,stmt, conn);
		}
		
		return noticeList;
	}

	// 공지게시판 글 읽기 메서드
	public NoticeVO getNotice(NoticeVO vo) {	
		NoticeVO notice = null;
		try {
			// DB 접속
			conn = JDBCConnection.getConnection();
			// sql = 조회수 증가
			String sql = "UPDATE project_notice SET readcount = (select readcount + 1 from project_notice where num = ?) where num = ?";
			// ?
			stmt = conn.prepareStatement(sql);
			// ? 매핑
			stmt.setInt(1, vo.getNum());
			stmt.setInt(2, vo.getNum());
			// 실행
			stmt.executeUpdate();
			stmt.close();
			
			// sql = 글 읽기
			sql = "SELECT * FROM project_notice where num=?";
			// ?
			stmt = conn.prepareStatement(sql);
			// ? 매핑
			stmt.setInt(1, vo.getNum());
			// 실행
			// rs에 모든 컬럼들이 받아진 상태
			rs = stmt.executeQuery();
			
			while(rs.next()) {
				notice = new NoticeVO();
				notice.setNum(rs.getInt(1));
				notice.setWriter(rs.getString(2));
				notice.setEmail(rs.getString(3));
				notice.setSubject(rs.getString(4));
				notice.setPassword(rs.getString(5));
				notice.setReg_date(rs.getString(6));
				notice.setRef(rs.getInt(7));
				notice.setRe_step(rs.getInt(8));
				notice.setRe_level(rs.getInt(9));
				notice.setReadcount(rs.getInt(10));
				notice.setContent(rs.getString(11));
				
			}
			
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCConnection.close(rs,stmt, conn);
		}
		
		return notice;
	}


	// 공지게시판 글쓰기 메서드
	public void insertnotice(NoticeVO nbean) {	
	      int ref = 0;
	      int re_step = 1;
	      int re_level = 1;
	      try {
	    	  conn = JDBCConnection.getConnection();
	         // sql = 글번호 올리기
	         String refSql = "select max(ref) from project_notice";
	         // ?
	         stmt = conn.prepareStatement(refSql);
	         // 실행
	         rs = stmt.executeQuery();
	         if(rs.next()) {
	            ref = rs.getInt(1)+1; // 가장 큰 글번호인 최댓값에 +1 하기
	         }
	         
	         
	         // sql = 데이터 추가
	         String sql = "insert into project_notice VALUES((select nvl(max(num),0)+1 from project_notice),?,?,?,?,sysdate,?,?,?,0,?)";
	         // ?
	         stmt = conn.prepareStatement(sql);
	         // ? 매핑
	         stmt.setString(1, nbean.getWriter());
	         stmt.setString(2, nbean.getEmail());
	         stmt.setString(3, nbean.getSubject());
	         stmt.setString(4, nbean.getPassword());
	         stmt.setInt(5, ref);
	         stmt.setInt(6, re_step);
	         stmt.setInt(7, re_level);
	         stmt.setString(8, nbean.getContent());
	         // 실행
	         stmt.executeUpdate();
	         // 자원반납
	         stmt.close();
	         conn.close();
	         
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
		
	}

	// 공지게시판 하나의 글 불러오기
	public BoardVO getOneUpdateNotice(int num) {
		 BoardVO bean = null;
	      try {
	    	// DB연결
	    	  conn = JDBCConnection.getConnection();
	         // SQL
	         String sql = "select * from project_notice where num=?";
	         // ?
	         stmt = conn.prepareStatement(sql);
	         // ? 매핑
	         stmt.setInt(1, num);
	         // 실행
	         rs = stmt.executeQuery();
	         // 사용
	         while(rs.next()) {
	              bean = new BoardVO();
	              
	              bean.setNum(rs.getInt(1));
	              bean.setWriter(rs.getString(2));
	              bean.setEmail(rs.getString(3));
	              bean.setSubject(rs.getString(4));
	              bean.setPassword(rs.getString(5));
	              bean.setReg_date(rs.getString(6));
	              bean.setRef(rs.getInt(7));
	              bean.setRe_step(rs.getInt(8));
	              bean.setRe_level(rs.getInt(9));
	              bean.setReadcount(rs.getInt(10));
	              bean.setContent(rs.getString(11));   
	         }
	         // 반납
	         stmt.close();
	         rs.close();
	         conn.close();
	         
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	      
	      // 리턴
	      return bean;
	}


	// 공지게시판 수정
	public void updateNotice(int num, String subject, String content) {
		try {
			// DB연결
			conn = JDBCConnection.getConnection();
			// sql
			String sql="UPDATE project_notice SET subject = ? , content = ? where num = ? ";
			// ? 
			stmt=conn.prepareStatement(sql);
			// ? 매핑	
			stmt.setString(1, subject);
			stmt.setString(2, content);
			stmt.setInt(3, num);
			// 실행
			stmt.executeUpdate();
			// 자원반납
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 공지게시판 삭제
	public void deleteNotice(int num) {
		 try {
	    	  // DB연결
	    	  conn = JDBCConnection.getConnection();
	          // sql
	          String sql = "delete from project_notice where num = ?";
	          // ?
	          stmt = conn.prepareStatement(sql);
	          // ? 매핑
	          stmt.setInt(1, num);
	          // 실행
	          stmt.executeUpdate();
	          // 자원반납
	          stmt.close();
	          conn.close();
	          
	       } catch (Exception e) {
	          e.printStackTrace();
	       }
	}
	
	// 문의게시판 댓글쓰기
	public void rewriteNotice(BoardVO bean) {
		int ref = bean.getRef();
		int re_step = bean.getRe_step();
		int re_level = bean.getRe_level();
		try {
			conn = JDBCConnection.getConnection();
			String resql = "update project_notice set re_level = re_level+1 where ref = ? and re_level > ?";
			stmt = conn.prepareStatement(resql);
			stmt.setInt(1, ref);
			stmt.setInt(2, re_level);
			stmt.executeUpdate();
			//답글 삽입
			String sql = "insert into project_notice VALUES((select nvl(max(num),0)+1 from project_notice),?,?,?,?,sysdate,?,?,?,0,?)";
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, bean.getWriter());
			stmt.setString(2, bean.getEmail());
			stmt.setString(3, bean.getSubject());
			stmt.setString(4, bean.getPassword());
			stmt.setInt(5, ref);
			stmt.setInt(6, re_step+1);
			stmt.setInt(7, re_level+1);
			stmt.setString(8, bean.getContent());
			
			stmt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
	         e.printStackTrace();
	    } catch (SQLException e) {
	         e.printStackTrace();
	    } finally {
	         JDBCConnection.close(rs,stmt,conn);
	    }	
		
	}

	
	/* ---------------------------------------------------------------------- */
	/* ----------------------      페이지넘버링       -------------------------- */
	/* ---------------------------------------------------------------------- */
	
		// 문의게시판 전체글의 (갯수)를 가져오는 메서드
		/*
		 * public int getAllCount() { int count = 0; try { conn =
		 * JDBCConnection.getConnection();
		 * 
		 * String sql = "select count(*) from project_board"; stmt =
		 * conn.prepareStatement(sql); rs = stmt.executeQuery(); while(rs.next()) {
		 * count = rs.getInt(1); }
		 * 
		 * } catch (ClassNotFoundException e) { e.printStackTrace(); } catch
		 * (SQLException e) { e.printStackTrace(); } finally {
		 * JDBCConnection.close(rs,stmt,conn); }
		 * 
		 * return count; }
		 * 
		 * 
		 * // 문의게시판 최신글 10개를 기준으로 게시판 글 가져오는 메서드 public ArrayList<BoardVO>
		 * getAllBoard(int start, int end) { ArrayList<BoardVO> v = new ArrayList<>();
		 * try { conn = JDBCConnection.getConnection(); String sql =
		 * "select * from (select A.*,Rownum Rnum from (select * from project_board order by ref desc,re_step asc)A)"
		 * + " where Rnum > = ? and Rnum <= ?";
		 * 
		 * stmt = conn.prepareStatement(sql);
		 * 
		 * stmt.setInt(1, start); stmt.setInt(2, end);
		 * 
		 * rs = stmt.executeQuery();
		 * 
		 * while(rs.next()) { BoardVO bean = new BoardVO(); bean.setNum(rs.getInt(1));
		 * bean.setWriter(rs.getString(2)); bean.setEmail(rs.getString(3));
		 * bean.setSubject(rs.getString(4)); bean.setPassword(rs.getString(5));
		 * bean.setReg_date(rs.getString(6)); bean.setRef(rs.getInt(7));
		 * bean.setRe_step(rs.getInt(8)); bean.setRe_level(rs.getInt(9));
		 * bean.setReadcount(rs.getInt(10)); bean.setContent(rs.getString(11));
		 * 
		 * // 패키징 v.add(bean); }
		 * 
		 * 
		 * } catch (ClassNotFoundException e) { e.printStackTrace(); } catch
		 * (SQLException e) { e.printStackTrace(); } finally {
		 * JDBCConnection.close(rs,stmt,conn); }
		 * 
		 * return v; }
		 * 
		 */
	
}
