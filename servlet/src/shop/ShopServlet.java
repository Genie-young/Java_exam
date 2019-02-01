package shop;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import VO.ProductVO;

public class ShopServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//
		String file = "";
		if(request.getParameter("menu") == null)
		{	
			file="jsp/start.jsp";
		}
		else {
			file = "jsp/"+request.getParameter("menu") +".jsp";
		}
		//10개 상품 저장 배열 생성 
		//int code, String name, int price, int balance
		ArrayList<ProductVO> list = new ArrayList<ProductVO>();
		
		list.add(new ProductVO(1000,"삼성 에어컨", 100000, 10));
		list.add(new ProductVO(2000,"엘지 에어컨", 110000, 20));
		list.add(new ProductVO(3000,"멀티컴퓨터", 100000, 10));
		list.add(new ProductVO(4000,"멀티라면", 100000, 1000));
		list.add(new ProductVO(5000,"멀티맥주", 2000, 100));
		request.setAttribute("productlist",list);
		RequestDispatcher rd = request.getRequestDispatcher(file); 
		rd.forward(request, response);
	}

}
