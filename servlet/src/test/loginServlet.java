package test;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class loginServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//get일 때는 한글 처리 자동으로
		//post일 때는 한글을 인코딩 처리를 해야 보여짐
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String hobby[] = request.getParameterValues("hobby");
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<h1>입력한 아이디는" + id + "이고");
		out.println("입력한 암호는" + pw + "이고");
		String total = ""; 
		for(String s : hobby)
			total += " "+s;
		
		out.println("취미는" +total+ "입니다.");
	}
}
