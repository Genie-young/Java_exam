package DAO;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Scanner;

import VO.BoardVO;

public class BoardDAO {
	public void insertBoard(BoardVO vo) { // throw

		Scanner sc = new Scanner(System.in);
		try {
			// 0.jdbc driver 호출
			Class.forName("oracle.jdbc.driver.OracleDriver");

			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
			System.out.println("연결성공");
			

			String sql = "insert into board values(?,?,?,?)";
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setInt(1, vo.getSeq());
			pt.setString(2, vo.getTitle());
			pt.setString(3, vo.getContents());
			pt.setInt(1, vo.getViewcount());
			
			int insertRow = pt.executeUpdate(); 
			System.out.println("삽입행의 갯수 : "+ insertRow);
			
			con.close();
			System.out.println("연결해제 성공");

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	// FILE READER 로 읽어옴.
	// 게시물 번호를 받아서 조회수 리턴 1번 게시물을 boardVO타입으로 리턴
	public BoardVO selectBoard(int seq) {
		try {
			// 0.jdbc driver 호출
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// 1.DB연결
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
			System.out.println("연결성공");

			// 2.SQL전송
			String sql = "select * from board where seq like ?";
			PreparedStatement pt = con.prepareStatement(sql);

			pt.setInt(1, seq);

			// 3.SQL결과 검색
			ResultSet rs = pt.executeQuery();
			BoardVO vo;
			if (rs.next()) {
				int seq2 = rs.getInt("seq");
				String title = rs.getString("title");
				String contents = rs.getString("contents");
				int viewcount = rs.getInt("viewcount");
				vo = new BoardVO(seq2, title, contents, viewcount);
			} else {
				return null;
			}
			// 4.DB 연결해제
			con.close();
			System.out.println("연결해제 성공");
			return vo;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public void updateBoard(String oldStr, String newStr) {

		try {
			// 0.jdbc driver 호출
			Class.forName("oracle.jdbc.driver.OracleDriver");

			// 1.DB연결
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
			System.out.println("연결성공");

			// 2.SQL전송
			String sql = "update board set title = UPPER(?) where title = ?";

			PreparedStatement pt = con.prepareStatement(sql);
			pt.setString(1, newStr);
			pt.setString(2, oldStr);

			// 3.SQL결과 검색
			int insertRow = pt.executeUpdate();
			sql = "update board set contents = UPPER(?) where contents = ?";

			pt = con.prepareStatement(sql);
			pt.setString(1, newStr);
			pt.setString(2, oldStr);

			// 3.SQL결과 검색
			insertRow += pt.executeUpdate();
			
			System.out.println("삽입행의 갯수 : " + insertRow);

			// con.close();
			System.out.println("연결해제 성공");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

}
