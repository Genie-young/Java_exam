package jdbc;

import java.util.ArrayList;
import DAO.MemberDAO;
import vo.MemberVO;

public class Test {
	public static void main(String[] args) {
		MemberDAO dao = new MemberDAO();
		ArrayList<MemberVO> list = dao.selectMember();
		for (MemberVO vo : list)
			System.out.println(vo);
	}
}
