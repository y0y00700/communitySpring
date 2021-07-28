<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
LoginSuccess Page
<button onclick="location.href='/user/userInfo'" id='info'>회원정보보기</button>
<button id='logout'>LogOut</button>
</body>
<script>
	$(document).ready(function(){
		var message="${message}";
		var id="${id}";
		if(message!=""){
			alert(id+"님"+message);
		}
		$("#logout").on("click",function(){
			var result=confirm("로그아웃하시겠습니까?");
			if(result===true){
				location.href='/user/logout';
				console.log("true");
			}else{
				return;
				console.log("false");
			}
		});
	});
</script>
</html>