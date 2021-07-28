<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hello</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>                        
            </button>
            <a class="navbar-brand" style="color: white;" href="/admin/adminHome">관리자페이지</a>
          </div>
          <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav navbar-right">
              <li class="active"><a href="/admin/adminHome"><i class="fas fa-home fa-lg"></i></a></li>
              <li><a href="/admin/userManaging">회원관리</a></li>
              <li><a href="/admin/adminAjax">Ajax 방식 회원 관리</a></li>
              <li><a href="/admin/adminManager">관리자 관리</a></li>
            </ul>
          </div>
        </div>
      </nav>
</body>
<script>
	$(function(){
		var message="${message}";
		if(message!=''){
			alert(message);
		}
	});
</script>
</html>