<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
	<form action="/user/certifi" method="POST">
	    <div class="form-group">
	        <input type="hidden" class="form-control" id="id" name="id" value="<c:out value='${id}'/>">
	    </div>
	    <div class="form-group">
	        <label for="pw">PW확인</label>
	        <input type="text" class="form-control" id="pw" name="pw" required>
	    </div>
	    <div class="text-center">
	        <input type="submit" class="btn btn-success" value="로그인">
	    </div>
	</form>
</body>
<script>
	$(function(){
		var message="${message}";
		var result="${result}";
		if(message !=''){
			alert(message);
		}
		if(result==="true"){
			opener.location.href="/user/modify";
			window.close();
		}else if(result==="false"){
			alert("비밀번호를 확인해 주세요");
		}
		
	})
</script>
</html>