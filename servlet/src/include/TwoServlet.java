package include;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TwoServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		RequestDispatcher rd = request.getRequestDispatcher("shared");
		// rd.include(request,response); // include는 one 뒤에 share 붙이란 의미  
		rd.include(request,response); // forward는 oneservlet 결과는 없어지고 forward 만 
		//rd.forward(request,response); 
		out.println("<h1> show? </h1>");
	}
		
}
