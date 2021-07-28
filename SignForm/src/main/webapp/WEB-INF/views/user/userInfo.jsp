<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <title>회원가입</title>
    <style>
        body, html{
            height: 100%;
        }
        .height-100{
            height: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .box{
            width: 300px;
            padding: 10px;
            border: 1px solid gray;
            border-radius: 10px;
            margin: 0 auto;
        }
        .d-block{
            display: block;
        }
        .float-right{
            float: right;
        }
    </style>
</head>
<body>
	<div class="container-fluid height-100">
	    <div class="row box">
            <div class="form-group">
                <label class="d-block" for="id">ID </label>
                <input type="text" class="form-control id-input " id="id" name="id" value='<c:out value="${user.id}"/>' readonly>
            </div>
            <div class="form-group">
                <label for="pw">PW </label>
                <input type="text" class="form-control" id="pw" name="pw" value='<c:out value="${user.pw}"/>'readonly>
            </div>
            <div class="form-group">
                <label for="name">이름</label>
                <input type="text" class="form-control"  id="name" name="name" value='<c:out value="${user.name}"/>'readonly>
            </div>
            <div class="form-group">
                <label for="gender">성별</label>
                <input type="text" class="form-control" id="gender" name="gender" value='<c:out value="${user.gender}"/>'readonly>
            </div>
            <div class="form-group">
                <label for="mail">E-mail</label>
                <input type="text" class="form-control" id="mail" name="email" value='<c:out value="${user.email}"/>'readonly>
            </div>
            <div class="form-group">
            	<label for="birth">Birth</label>
            	<input type="text" class="form-control" id="birth" name="birth" value='<c:out value="${user.birth}"/>'readonly>
            </div>
            <div class="text-center">
                <input type="button" class="btn btn-info" onclick="location.href='/user/loginSuccess'" value="돌아가기">
                <input type="button" class="btn btn-success" id='modify' value="수정하기">
                <input type="button" class="btn btn-default" id="delete" value="회원탈퇴">
            </div>
	    </div>
	</div>
</body>
<script>
	$(function(){
		var message="${message}";
		if(message != ""){
			alert(message);
		}
		$("#delete").on("click",function(e){
			var result=confirm("탈퇴를 진행하시겠습니까?");
			if(result===true){
				location.href="/user/delete";
			}else{
				alert("탈퇴를 취소하셨습니다.");
			}
		});
		$("#modify").on("click",function(e){
			var width=(screen.width/2)-300;
			var height=(screen.height/2)-200;
			
			window.open("certifi","","widht=600px,height=400px,top="+height+"px,left="+width+"px;")
		});
	});
</script>
</html>