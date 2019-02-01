package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.io.*;
import VO.BoardVO;
public class BoardDAO {
	
	//리스트 qul 이용 메소드 
	public ArrayList<BoardVO> getBoardList(){
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","board","board");
			System.out.println("연결성공");
			String sql = "select boardseq, boardtitle,  boardwriter,to_char(boardtime,'yyyy-mm-dd hh24:mi:ss') as boardtime from board order by boardtime desc";
			PreparedStatement pt = con.prepareStatement(sql);
			ResultSet rs = pt.executeQuery();  // - select 문일 때
			while(rs.next())
			{
				int boardseq =rs.getInt("boardseq"); 
				String boardtitle =rs.getString("boardtitle");  
				String boardwriter =rs.getString("boardwriter");  
				String boardtime =rs.getString("boardtime");  
				list.add(new BoardVO(boardseq, boardtitle,boardwriter,boardtime));
				
			}
			con.close(); 
			System.out.println("연결해제성공");

		} catch (Exception e) {
			e.printStackTrace();}

		
		return list; 
		
	}
	
	//상세 내용 조회 메소드 
	public BoardVO getBoardDetail(int seq){
		BoardVO vo = new BoardVO();
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","board","board");
			String sql = "select boardseq, boardtitle, boardcontents,boardviewcount, boardwriter,to_char(boardtime,'yyyy-mm-dd hh24:mi:ss') as boardtime from board where boardseq =?";
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setInt(1, seq);
			ResultSet rs = pt.executeQuery();  //- select 문일 때
			//int result = pt.executeUpdate();  - insert/ update 문일때 
			
			if(rs.next())
			{
				int boardseq = rs.getInt("boardseq");
				String boardtitle =rs.getString("boardtitle");  
				String boardcontents =rs.getString("boardcontents");  
				String boardwriter =rs.getString("boardwriter");  
				String boardtime =rs.getString("boardtime");  
				int boardviewcount =rs.getInt("boardviewcount"); 
				vo = new BoardVO(boardseq, boardtitle, boardcontents, boardwriter, boardtime, boardviewcount);
			}
			else  {
				vo =null;
			}
			con.close(); 

		} catch (Exception e) {
			e.printStackTrace();}

		
		return vo; 
		
	}
	
	//게시물 저장 sql 메소드 
	public int insertBoard(BoardVO vo){
		int seq = -1;
		try {
/*			boardseq number(10) primary key,
			boardtitle varchar2(100) not null,
			boardcontents varchar2(4000),
			boardwriter varchar2(100),
			boardtime date,
			boardviewcount number(10)*/
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","board","board");
			System.out.println("연결 성공");
			String sql = "insert into board values((select max(boardseq)+1 from board), ?, ?, ?, sysdate, 0)";
			PreparedStatement pt = con.prepareStatement(sql);
	
			System.out.println("title은 "+ vo.getBoardtitle());
			pt.setString(1, vo.getBoardtitle());
			pt.setString(2, vo.getBoardcontents());
			pt.setString(3, vo.getBoardwriter());
			int result = pt.executeUpdate();  //- insert/ update 문일때 
			
			sql ="select max(boardseq) as seq from board";
			pt = con.prepareStatement(sql);
			ResultSet rs = pt.executeQuery();
			
			if(rs.next()) {
				seq = rs.getInt("seq");
				System.out.println(seq);
			}
			con.close(); 
			System.out.println("연결 성공");
		} catch (Exception e) {
			e.printStackTrace();}

		return seq; 
	}
	
	//수정 메소드 
	public void updateBoard(){
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","board","board");
			String sql = "select * from ";
			PreparedStatement pt = con.prepareStatement(sql);
			//ResultSet rs = pt.executeQuery();  - select 문일 때
			//int result = pt.executeUpdate();  - insert/ update 문일때 

			con.close(); 

		} catch (Exception e) {
			e.printStackTrace();}

	}
	
	//삭제 메소드
	public void deleteBoard(){
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","board","board");
			String sql = "select * from ";
			PreparedStatement pt = con.prepareStatement(sql);
			//ResultSet rs = pt.executeQuery();  - select 문일 때
			//int result = pt.executeUpdate();  - insert/ update 문일때 

			con.close(); 

		} catch (Exception e) {
			e.printStackTrace();}

		
	}
}
