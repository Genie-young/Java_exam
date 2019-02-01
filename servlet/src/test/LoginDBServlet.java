package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginDBServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		int pw = Integer.parseInt(request.getParameter("pw"));
		
		DbApproach da = new DbApproach();
		int result = da.identifyUser(id, pw);
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		switch(result) {
		case -1: out.println("<h1> 에러 발생 </h1>");
				break;
		case 0: out.println("<h1>회원이 아닙니다. </h1> <a href ='insertform_db.html'> 회원가입 </a>");
				break;
		case 1: out.println("<h1>정상 사용자입니다.</h1>");
				break;
		case 2: out.println("<h1>정상 사용자입니다.</h1>");
				break;
		}

	}

}
