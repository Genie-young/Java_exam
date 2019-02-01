package VIEW;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Scanner;
import DAO.BoardDAO;
import VO.BoardVO;

public class BoardInsertView{
public void input() {

		Scanner sc = new Scanner(System.in);
		
		System.out.print("제목 :");
		String title = sc.next();
		
		System.out.print("내용 :");
		String contents =sc.next();
		
		System.out.print("조회수 :");
		int viewcount = sc.nextInt();
		
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO(0, title,contents, viewcount);  
		dao.insertBoard(vo);
		

	}

}
