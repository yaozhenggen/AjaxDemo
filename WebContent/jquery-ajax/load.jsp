<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="jquery-2.1.4.js"></script>
<script type="text/javascript">
    $(function(){
    	$("a").click(function(){
    		//var url = this.href + "h2 a"后面跟的是选择器，选择自己想要的部分内容
    		var url = this.href;
    		//缓存，起到处理特殊符号的作用
    		var args = {"time" : new Date()};
    		//使用load处理ajax函数
    		$("#content").load(url,args);
    		return false;
    	});
    });
</script>
</head>
<body>
<a href="HelloAjax.txt">HelloAjax</a>
<div id="content"></div>
</body>
</html>