package session;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//  mapping-url : /mypagesession
public class MyPageSessionServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession(); 
		System.out.println(session.isNew());
		String sessionid = (String)session.getAttribute("sessionid");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();	
		String html =sessionid +" 회원님 페이지입니다." +
					"<ul class = 'myPageList'>" +
						"<li>암호 변경</li>"+
						"<li>구매 목록</li>"+
						"<li>쿠폰</li>"+
					"</ul>";
		out.println(html);
	}

}
