package jxut.com.cn;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jxut.com.cn.beans.ShoppingCart;

public class addToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bookName = request.getParameter("id");
		int price = Integer.parseInt(request.getParameter("price"));
		//获取购物车对象
		HttpSession session =request.getSession();
		ShoppingCart sc = (ShoppingCart) session.getAttribute("sc");
		if (sc == null) {
			sc = new ShoppingCart();
			session.setAttribute("sc", sc);
		}
		//把点击的选项加入到购物车中
		sc.addToCart(bookName, price);
		//准备响应的JSON对象{"bookName":"","totalBookNumber":1,"totalMoney":1}
		//如从服务器端返回JSON字符串，则属性名必须是双引号
		StringBuffer result = new StringBuffer();
		result.append("{")
		      .append("\"bookName\":\"" + bookName +"\"")
		      .append(",")
		      .append("\"totalBookNumber\":" + sc.getTotalBookNumber())
		      .append(",")
		      .append("\"totalMoney\":" + sc.getTotalMoney())
		      .append("}");
		response.setContentType("text/javascript");
		response.getWriter().print(result.toString());
	}

}
