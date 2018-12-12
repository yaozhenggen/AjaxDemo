package demo2.com.cn.dao;

import java.io.IOException;
import java.lang.reflect.Method;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sun.xml.internal.bind.v2.runtime.Location;

import demo2.com.cn.Department;


public class EmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String methodName = request.getParameter("method");
		 
		 try {
			Method method = getClass().getDeclaredMethod(methodName, HttpServletRequest.class,HttpServletResponse.class);
		    method.invoke(this,request, response);
		 }  catch (Exception e) {
			e.printStackTrace();
		}
	}
	private BaseDao basedao = new BaseDao();
	protected void listLocations(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	     String sql = "";
	     List<Location> locations = basedao(sql,Location.class);
	     request.setAttribute("location", location);
	     
	     request.getRequestDispatcher("/WebContent/demo2/employess.jsp").forward(request, response);
	}
	protected void EmployeeServlet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	     String locationId = request.getParameter("locationId");
	     String sql="";
	     List<Department> departments = basedao.getForList(sql,Department.class,Integer.parseInt(locationId));
	     ObjectMapper mapper = new ObjectMapper();
	     String result = mapper.writeValueAsString(departments);
	     response.setContentType("text/javascript");
	     response.getWriter().print(result);
	}

}
