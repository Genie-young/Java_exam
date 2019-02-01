package forward;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StartServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		for (int i = 0; i < pw.length(); i++) {
			pw = pw.replace(pw.charAt(i), '*');
		}
		System.out.println(pw);

		RequestDispatcher rd;
		if (id.equalsIgnoreCase("admin") || id.equalsIgnoreCase("system")) {
			rd = request.getRequestDispatcher("AdminServlet");
			
		} else {
			request.setAttribute("userid", id);
			request.setAttribute("pw", pw);
			rd = request.getRequestDispatcher("UserServlet");
		}
		rd.forward(request, response);
	}

}
