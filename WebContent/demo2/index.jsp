<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="jquery-2.1.4.js"></script>
<!--

3.获取#city所选择的值，若该值为"",即选择的 是"请选择..."不需要发ajax，若不为就准备发ajax
4.url:EmployeeServlet?method=listDepartments
4.1args:locationId,time
5.返回的是JSON数组，若元素为0：提示"当前城市没有部门"，若不为0，遍历，创建<option value='departmentId'>departmentName</option>,
并把新创建的option节点加为#department的子节点
 -->
<script type="text/javascript">
   $(function(){
	   //获取#city添加响应函数
	   $("city").change(function(){
		   //使#department只保留第一个option子节点
		   $("#department option:not(:first)").remove();
		   var city = $(this).val();
		   
		   if(city !=""){
			   var url = "EmployeeServlet?method=listDepartments";
			   var args = {"locationId":city,"time":new Date()};
			   
			   $.getJSON(url ,args,function(data){
				  
				   if(data.length == 0){
					   alert("当前城市没有部门");
				   }else{
					   for(var i=0;i<data.length;i++){
						   var depId = data[i].departmentId;
						   var depName = data[i].departmentName;
						   
						   $("#department").append("<option value='" + depId + "'>" + depName + "</option>");
					   }
				   }
			   })
		   }
	   });
   })
</script>
</head>
<body>
 <img alt="" src="" style="display: none;">
 <center>
       <br><br>
       City:
       <select id="city">
              <option>请选择...</option>
              <c:forEach items="${location }" var="Location">
                       <option value="${locationId }">${location.city }</option>
              </c:forEach>
       </select>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
       Department:
       <select id="department">
              <option value="">请选择...</option>
       </select>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        Employee:
         <select id="employee">
              <option value="">请选择...</option>
       </select>
       <br><br>
       <table id="empdetails" border="1" cellpadding="5" cellspacing="0" style="display: none;">
             <tr>
                <th>Id</th>
                <th>Name</th>
                <th>Email</th>
                <th>Salary</th>
             </tr>
             <tr>
                <td id="id"></td>
                <td id="name"></td>
                <td id="email"></td>
                <td id="salary"></td>
             </tr>
             
       </table>
 </center>
</body>
</html>