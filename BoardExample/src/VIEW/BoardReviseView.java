package VIEW;

import java.util.Scanner;

import DAO.BoardDAO;

public class BoardReviseView {

	public void input() {
		Scanner sc = new Scanner(System.in);
		System.out.print("변경전 이름:변경후 이름을 입력 =");
		String updatinginfo = sc.next(); 
		String token[] = updatinginfo.split(":");
		BoardDAO dao = new BoardDAO();
		dao.updateBoard(token[0], token[1]);
	}
}
