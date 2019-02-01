package DAO;


import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Scanner;

import VO.BoardVO;

public class BoardDAO_test {
	public void insertBoard(int seq, String title, String contents, int viewcount) { // throw

		Scanner sc = new Scanner(System.in);
		try {
			// 0.jdbc driver 호출
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			//db 연결
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
			System.out.println("연결성공");
			
			//sql 전송
			String sql = "insert into member values(?,?,?,?)";
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setInt(1, seq);
			pt.setString(2,title);
			pt.setString(3, contents);
			pt.setInt(4, viewcount);
			
			//결과 전송
			int insertRow = pt.executeUpdate();
			System.out.println("삽입행의 갯수 : " + insertRow);
			
			//연결해제
			con.close();
			System.out.println("연결해제 성공");
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
	}

	// FILE READER 로 읽어옴.
	// 게시물 번호를 받아서 조회수 리턴 1번 게시물을 boardVO타입으로 리턴
	public BoardVO selectBoard(int seq) throws IOException {
		FileReader fr = new FileReader("board1.txt");

		int readData;
		String str = "";
		ArrayList<String> al = new ArrayList<>();
		while ((readData = fr.read()) != -1) {
			if ((char) readData == '\n') {
				al.add(str);
				str = "";
			} else
				str += (char) (readData);
		}
		for (int i = 0; i < al.size(); i++) {
			String token[] = al.get(i).split("=");
			BoardVO vo = new BoardVO(Integer.parseInt(token[0]), token[1], token[2], Integer.parseInt(token[3]));
			if (vo.getSeq() == seq)
				return vo;
		}
		return null;
	}

	
	Scanner sc= new Scanner(System.in);

}
