package include;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//mapping-url : /one
public class OneServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//사용자가 one을 호출하면 one이 shared를 호출
			
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String dev = request.getParameter("dev");
		out.println("<h1>OneServlet</h1>");
		
		RequestDispatcher rd = request.getRequestDispatcher("shared");
		// rd.include(request,response); // include는 one 뒤에 share 붙이란 의미  
		
		request.setAttribute("devname",dev);
		rd.include(request,response); // forward는 oneservlet 결과는 없어지고 forward 만 
		out.println("<h1> show? </h1>");
		
	}

}
