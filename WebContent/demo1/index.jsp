<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js">
</script>
<script type="text/javascript">
       $(function(){
    	   var isHasCart = "${sessionScope.sc == null}";
    	   if(isHasCart == "true"){
    		   $("#cartstatus").hide();
    	   }else{
    		   $("#cartstatus").show();
    		   $("#bookName").text("${sessionScope.sc.bookName}");
			   $("#totalBookNumber").text("${sessionScope.sc.totalBookNumber}");  /* text一定不能大写不然会报错 */
			   $("#totalMoney").text("${sessionScope.sc.totalMoney}");
    	   };
    	   $("a").click(function(){
    		   $("#cartstatus").show();
    		   var url = this.href;
    		   var args = {"time":new Date()};
    		   $.getJSON(url,args,function(data){
    			   $("#bookName").text(data.bookName);
    			   $("#totalBookNumber").text(data.totalBookNumber);
    			   $("#totalMoney").text(data.totalMoney);
    		   });
    		   return false;
    	   });
       })
   </script>
</head>
<body>
<div id="cartstatus">
    您已经将&nbsp;<span id="bookName"></span>&nbsp;加入到了购物车中，
    购物车中的书有&nbsp;<span id="totalBookNumber"></span>&nbsp;本，
    总价格是&nbsp;<span id="totalMoney"></span>&nbsp;
</div>    
    <br><br>
    Java&nbsp;<a href="${pageContext.request.contextPath }/addToCart?id=Java&price=100">加入购物车</a>
    <br><br>
    Oracle&nbsp;<a href="${pageContext.request.contextPath }/addToCart?id=Oracle&price=200">加入购物车</a>
    <br><br>
    Struts2&nbsp;<a href="${pageContext.request.contextPath }/addToCart?id=Struts2&price=100">加入购物车</a>
    <br><br>
</body>
</html>