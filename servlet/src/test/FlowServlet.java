package test;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//main은 콘솔에서 출력할 때 ,
//main(x): 브라우저 서블릿 실행
//tomcat +jdk : 웹어플리케이션 서버(=sevlet container)
//객체생성 및 어떤 메소드 실행순서 제어를 container에서 해줌  
//객체생성(자동) -> init()오버라이딩 필요하면 함  -> doGet() 정의 -> destroy 정의  
public class FlowServlet extends HttpServlet {

	@Override
	public void init() throws ServletException {
		System.out.println("수정 init 메소드 호출");//최초실행시 한번만 생성
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet 메소드 호출");//재실행하면 doGet만 멀티쓰레드로 운영
	}
	@Override
	public void destroy() {
		System.out.println("destroy 메소드 호출");
	}

}
