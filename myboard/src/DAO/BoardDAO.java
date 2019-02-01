package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import VO.BoardVO;
import VO.MemberVO;
public class BoardDAO {
	
	
	public int getTotalBoard(){
		int total =0;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","board","board");
			System.out.println("연결성공");
			String sql = "select count(*) as cnt from board";
			PreparedStatement pt = con.prepareStatement(sql);
			ResultSet rs = pt.executeQuery();  // - select 문일 때
			if(rs.next())
			{
				total =rs.getInt("cnt"); 
			}
			con.close(); 
			System.out.println("연결해제성공");

		} catch (Exception e) {
			e.printStackTrace();}
		return total;
		
				

	}
	
	public ArrayList<BoardVO> getBoardList(int page){
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		//select r, boardseq, boardtime from (select rownum r, boardseq, boardtime from(select boardseq,boardtime from board order by boardseq desc)) where r >=1 and r <=3
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","board","board");
			System.out.println("연결성공");
			String sql = "select r, boardseq, boardtime, boardwriter from (select rownum r, boardseq, boardtime, boardtitle, boardwriter from(select * from board order by boardseq desc)) where r >= ? and r <= ?";
			PreparedStatement pt = con.prepareStatement(sql);
			
			int start=(page-1)*3+1;
				int end = (page)*3;
				pt.setInt(1, start);
				pt.setInt(2, end);
				ResultSet rs = pt.executeQuery(); 

				ResultSet rs = pt.executeQuery();  // - select 문일 때
			while(rs.next())
			{
				int boardseq =rs.getInt("boardseq"); 
				String boardtitle =rs.getString("boardtitle");  
				String boardcontents = rs.getString("boardcontents");
				String boardwriter =rs.getString("boardwriter");  
				String boardtime =rs.getString("boardtime");  
				int boardviewcount = rs.getInt("boardviewcount");
				list.add(new BoardVO(boardseq, boardtitle,boardcontents, boardwriter,boardtime,boardviewcount));
				
			}
			con.close(); 
			System.out.println("연결해제성공");

		} catch (Exception e) {
			e.printStackTrace();}

		
		return list; 
	}
	
	
	//리스트 qul 이용 메소드 
	public ArrayList<BoardVO> getBoardList(){
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","board","board");
			System.out.println("연결성공");
			String sql = "select boardseq, boardtitle, boardcontents,boardviewcount, boardwriter,to_char(boardtime,'yyyy-mm-dd hh24:mi:ss') as boardtime from board order by boardtime desc";
			PreparedStatement pt = con.prepareStatement(sql);
			ResultSet rs = pt.executeQuery();  // - select 문일 때
			while(rs.next())
			{
				int boardseq =rs.getInt("boardseq"); 
				String boardtitle =rs.getString("boardtitle");  
				String boardcontents = rs.getString("boardcontents");
				String boardwriter =rs.getString("boardwriter");  
				String boardtime =rs.getString("boardtime");  
				int boardviewcount = rs.getInt("boardviewcount");
				list.add(new BoardVO(boardseq, boardtitle,boardcontents, boardwriter,boardtime,boardviewcount));
				
			}
			con.close(); 
			System.out.println("연결해제성공");

		} catch (Exception e) {
			e.printStackTrace();}

		
		return list; 
	}
	

	public ArrayList<BoardVO> getBoardTopList(){
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","board","board");
			System.out.println("연결성공");
			String sql = "select boardseq, boardtitle, boardcontents,boardviewcount, boardwriter, boardimage, to_char(boardtime,'yyyy-mm-dd hh24:mi:ss') as boardtime from board order by boardviewcount desc";
			PreparedStatement pt = con.prepareStatement(sql);
			ResultSet rs = pt.executeQuery();  // - select 문일 때
			while(rs.next())
			{
				int boardseq =rs.getInt("boardseq"); 
				String boardtitle =rs.getString("boardtitle");  
				String boardcontents = rs.getString("boardcontents");
				String boardwriter =rs.getString("boardwriter");  
				String boardtime =rs.getString("boardtime");  
				int boardviewcount = rs.getInt("boardviewcount");
				String boardimage = rs.getString("boardimage");
				list.add(new BoardVO(boardseq, boardtitle,boardcontents, boardwriter,boardtime,boardviewcount,boardimage));
				System.out.println(boardimage);
			}
			con.close(); 
			System.out.println("연결해제성공");

		} catch (Exception e) {
			e.printStackTrace();}

		
		return list; 
	}
	public int accountCheck(String id, String pw) {
		int result=-1; 
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","board","board");
			System.out.println("연결성공");
			String sql = "select memberpw from member where memberid = ?"; 
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setString(1, id);
			ResultSet rs = pt.executeQuery();  // - select 문일 때
			if(rs.next()) {
				String dbpw = rs.getString("memberpw");
				System.out.println(dbpw +","+ pw);
				if(dbpw.equals(pw))
					result = 1; 
				else result = 0;
			}
			else
				result =-1; 
			con.close(); 
			System.out.println("연결해제성공");

		} catch (Exception e) {
			e.printStackTrace();}
		return result; 
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
				sql = "update board set boardviewcount = ? where boardseq= ?";
				pt = con.prepareStatement(sql);
				pt.setInt(1, boardviewcount+1);
				pt.setInt(2, boardseq);
				pt.executeUpdate();
				
			}
			else  {
				vo =null;
			}
			

			con.close(); 

		} catch (Exception e) {
			e.printStackTrace();}

		
		return vo; 
		
	}
	
	
	public ArrayList<BoardVO> getMyBoardList(String id){
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","board","board");
			System.out.println("연결성공");
			String sql = "select boardseq, boardtitle, boardcontents,boardviewcount, boardwriter, boardimage, to_char(boardtime,'yyyy-mm-dd hh24:mi:ss') as boardtime from board where boardwriter= ?";
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setString(1, id);
			ResultSet rs = pt.executeQuery();  // - select 문일 때
			while(rs.next())
			{
				int boardseq =rs.getInt("boardseq"); 
				String boardtitle =rs.getString("boardtitle");  
				String boardcontents = rs.getString("boardcontents");
				String boardwriter =rs.getString("boardwriter");  
				String boardtime =rs.getString("boardtime");  
				int boardviewcount = rs.getInt("boardviewcount");
				String boardimage = rs.getString("boardimage");
				list.add(new BoardVO(boardseq, boardtitle,boardcontents, boardwriter,boardtime,boardviewcount,boardimage));
				System.out.println(boardimage);
			}
			con.close(); 
			System.out.println("연결해제성공");

		} catch (Exception e) {
			e.printStackTrace();}

		
		return list; 
	}
	
	public MemberVO getMyInfo(String id){
		MemberVO vo=null;
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","board","board");
			System.out.println("연결성공");
			String sql = "select memberid, membername,totalcontents from member where memberid= ?";
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setString(1, id);
			ResultSet rs = pt.executeQuery();  // - select 문일 때
			while(rs.next())
			{
				String memberid =rs.getString("memberid");  
				String membername = rs.getString("membername");
				int totalcontents =rs.getInt("totalcontents"); 
				vo = new MemberVO( memberid,  membername, totalcontents);
			}
			con.close(); 
			System.out.println("연결해제성공");
		} catch (Exception e) {
			e.printStackTrace();}
		return vo; 
		
	}
	public int setPw(String id, String newpw){
		int result=0;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","board","board");
			System.out.println("연결성공");
			String sql = "update member set memberpw = ? where memberid= ?";
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setString(1, newpw);
			pt.setString(2, id);
			result = pt.executeUpdate();
			System.out.println("변경행 : "+ result);
			con.close(); 
			System.out.println("연결해제성공");
		} catch (Exception e) {
			e.printStackTrace();}
		return result; 
	}
	
	public int updateboard(int seq, String title, String contents){
		int result=0;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","board","board");
			System.out.println("연결성공");
			String sql = "update board set boardtitle = ?, boardcontents =? where boardseq= ?";
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setString(1, title);
			pt.setString(2, contents);
			pt.setInt(3, seq);
			result = pt.executeUpdate();
			System.out.println("변경행 : "+ result);
			con.close(); 
			System.out.println("연결해제성공");
		} catch (Exception e) {
			e.printStackTrace();}
		return result; 
		
	}
	public int insertBoard(BoardVO vo){
		int seq = -1;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","board","board");
			System.out.println("연결 성공");
			String sql = "insert into board values((select max(boardseq)+1 from board), ?, ?, ?, sysdate, 0,'0')";
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
			}
			sql = "update member set totalcontents = totalcontents+1 where memberid= ?";
			pt = con.prepareStatement(sql);
			pt.setString(1, vo.getBoardwriter());
			result = pt.executeUpdate();
			con.close(); 
			System.out.println("연결 성공");
		} catch (Exception e) {
			e.printStackTrace();}

		return seq; 
	}
	
	
	//삭제 메소드
	public int deleteBoard(int seq,String id){
		ArrayList<BoardVO> list = new ArrayList<BoardVO>();
		int result =0;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","board","board");
			String sql = "delete from board where boardseq = ? ";
			PreparedStatement pt = con.prepareStatement(sql);
			pt.setInt(1, seq);
			result = pt.executeUpdate();
			sql = "update member set totalcontents = totalcontents-1 where memberid= ?";
			pt = con.prepareStatement(sql);
			pt.setString(1, id);
			result = pt.executeUpdate();
			con.close(); 

		} catch (Exception e) {
			e.printStackTrace();
			}
		return result;
		
	}
}
