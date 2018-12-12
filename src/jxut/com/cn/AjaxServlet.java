package jxut.com.cn;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                List<String> userNames = Arrays.asList("AAA","bbb","ccc");
                String userName = request.getParameter("username");
                String result = null;
                if (userNames.contains(userName)) {
                	result = "<font color='red'>该用户名已经注册</font>";
				}else {
					result = "<font color='green'>该用户名可以使用</font>";
				}
                response.setContentType("text/html;charset=UTF-8");
                response.setCharacterEncoding("UTF-8");
                response.getWriter().print(result);
	}

}
