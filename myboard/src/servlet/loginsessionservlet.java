package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class loginsessionservlet
 */
//<url-pattern>/login</url-pattern>
public class loginsessionservlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		// HttpSession생성, 입력 아이디받아서 1생성 세션 저장 
		HttpSession session = request.getSession();
		System.out.println(session.isNew());
		String html = "";
		if( (session.getAttribute("sessionid")!=null) && ((String)session.getAttribute("sessionid")).equals(request.getParameter("id"))) {
			html = "이미 로그인하셨습니다.";
		}
		else {
			session.setAttribute("sessionid", request.getParameter("id")); // 세선 생성 String name ,Object value 
			html = "아이디를 세션에 저장했습니다.";
		}
		RequestDispatcher rd = request.getRequestDispatcher("../boardlist.jsp");
		rd.forward(request, response);
	}
	
}
