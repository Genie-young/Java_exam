package VIEW;

import java.io.IOException;
import java.util.Scanner;
import DAO.BoardDAO;
import VO.BoardVO;

public class BoardSelectView {


	public void input() throws IOException{
		
		System.out.print("조회할 번호 입력하세요 : ");
		Scanner sc = new Scanner(System.in);
		int seq = sc.nextInt(); 
		BoardDAO dao = new BoardDAO();
		BoardVO vo = dao.selectBoard(seq); 
		System.out.println(vo);
		
	}
}
