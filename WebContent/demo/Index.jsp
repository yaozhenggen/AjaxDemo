<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="jquery-2.1.4.js"></script>
<script type="text/javascript">
/* 现在登录检查步骤
    1.导入jquery库 
    2.获取name="username"的节点
    3.为username添加change响应函数
    4.获取username的value属性值，去除前后空格且不为空，准备发送ajax
    5.发送ajax请求检查username是否可用
    6.在服务端直接返回一个html的片段<font color="red">该用户名已经注册</font>
    7.在客户端浏览器把其直接添加到#message的html中
    
*/
$(function(){
	$(":input[name='username']").change(function(){
		var val = $(this).val();//去除两边的空格
		val = $.trim(val);
		if(val != ""){
			url = "${pageContext.request.contextPath }/AjaxServlet";
			var args = {"username" : val,"time" : new Date()};
			$.post(url,args,function(data){
				$("#message").html(data);
			})
		}
	});
});
</script>
</head>
<body>
<form action="" method="post">
    username : <input type="text" id="username" name="username">
    <br><br>
    <div id="message"></div>
    <br><br>
    <input type="submit" value="submit">
</form>
</body>
</html>