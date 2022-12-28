package biz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import biz.vo.UserVO;

public class UserDAO {
	Connection conn;
	PreparedStatement stmt;
	ResultSet rs;
	   
	// 커넥션 풀 사용 메서드
	public void dbConn() {
	   try {
	      Context initctx = new InitialContext();
	      System.out.println("1.Context 생성 성공!!");
	      Context envctx = (Context)initctx.lookup("java:comp/env");
	      System.out.println("2.Context 환경생성 성공!!");
	      DataSource ds = (DataSource)envctx.lookup("jdbc/pool");
	      System.out.println("3.DataSource 찾기 성공!!");
	      conn = ds.getConnection();
	      System.out.println("4. DB접속 성공!!");
	   } catch (Exception e) {
	      e.printStackTrace();
	   }
	}
	   
	public void insertMember(UserVO bean) {
	   // DB 접속
	   dbConn();
	   try {
	      // sql
	      String sql = "insert into project_member values((select nvl(max(seq),0)+1 from project_member),?,?,?,?,?)";
	      // ?
	      stmt = conn.prepareStatement(sql);
	      // ? 매핑
	      stmt.setString(1, bean.getId());
	      stmt.setString(2, bean.getPassword());
	      stmt.setString(3, bean.getName());
	      stmt.setString(4, bean.getEmail());
	      stmt.setString(5, bean.getRole());
	         
	      // 실행
	      stmt.executeUpdate();
	      // 자원반납
	      stmt.close();
	      conn.close();
	         
	         
	   } catch (Exception e) {
	      e.printStackTrace();
	   }
	   System.out.println("DB 데이터 처리완료!!");
	}
	
}
