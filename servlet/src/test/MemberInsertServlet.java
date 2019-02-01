package test;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// response.getWriter().append("Served at: ").append(request.getContextPath());
		// request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String result = ""; 
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			// 1.DB연결
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "hr", "hr");
			System.out.println("연결성공");
			String sql = "insert into member values(?,?,?,?,sysdate,?)";

			PreparedStatement pt = con.prepareStatement(sql);
			pt.setString(1, id);
			pt.setInt(2,Integer.parseInt(password));
			pt.setString(3, name);
			pt.setString(4, phone);
			pt.setString(5, email);	
			
			int row =pt.executeUpdate();
			
			if(row==1)
				out.println("<h2>회원가입 완료되었습니다.<h2>");
			con.close();
			System.out.println("연결해제 성공");
			//ResultSet rs = pt.executeQuery();  - select 문일 때
			//int result = pt.executeUpdate();  - insert/ update 문일때 
			
		} catch (Exception e) {
			out.println("<h2>회원가입 미완료되었습니다.<h2>");
			e.printStackTrace();
		}
	}

}
