<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
   window.onload = function(){
	 //获取a节点，并为其添加onclick相应函数
	   document.getElementsByTagName("a")[0].onclick = function(){
		   //创建一个XMLHttpRequest对象
		   var request = new XMLHttpRequest();
		   //准备发送亲求的数据url,添加一个时间戳，起到禁用缓存的目的
		   var url = this.href;
		   var method = "POST";
		   //调用XMLHttpRequest对象的open方法
		   request.open(method,url);
		   request.setRequestHeader("Content-type","application/x-www-form-urlencoded");
		 //调用XMLHttpRequest对象的send方法
		   request.send("fname=Henry&lname=Ford");
		   //为XMLHttpRequest对象添加onreadystatechange响应函数
		   request.onreadystatechange = function(){
			   //判断响应是否完成：XMLHttpRequest对象的readyState属性值为4的时候
			   if(request.readyState==4){
				   //判断响应是否可用：XMLHttpRequest对象status属性值为200
				   if(request.status == 200 || request.status == 304){
					  /*  status常用状态码和含义：
					            1.404没有找到页面(not found)
					            2.403表示禁止访问(forbidden)
					            3.200一切都正常
					            4.304没有被修改(not modified)
					  */
					   alert(request.responseText);
				   }
			   }
		   }
		  //取消默认属性
		   return false;
	   }
   }
</script>
</head>
<body>

<a href="post.txt">HelloAjax</a>
</body>
</html>