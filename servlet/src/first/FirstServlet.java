package first;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FirstServlet extends HttpServlet {
	//private static final long serialVersionUID = 1L; // eclipse가 servlet을 관리하기 위해 만든 id 


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		response.setContentType("text/html;charset=utf-8"); // 태그type ;인코딩방식 
		// 결과문 전송 방법 
		PrintWriter out = response.getWriter();
		out.println("<h1>hello 서블릿 실행 결과입니다.</h1>"); //body 내부 먼저 사용가능 
		out.println("<h3>hello wervlet complete</h3>");
	}

}
