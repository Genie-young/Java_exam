package forward;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String userid = (String)request.getAttribute("userid");
		String pw = (String)request.getAttribute("pw");
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(" <h1>일반 유저용 화면입니다. </h1>");
		out.println(" <h1>" + userid+ " 회원님 환영합니다. </br> 암호는"+pw+"입니다.</h1>");
		
	}

}
