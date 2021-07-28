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
		<form id="form-modify" action="/user/modify" method="post">
		    <div class="row box">
	            <div class="form-group">
	                <label class="d-block" for="id">ID </label>
	                <input type="text" class="form-control" id="id" name="id" value='<c:out value="${user.id}"/>' readonly>
	            </div>
	            <div class="form-group">
	                <label for="pw">PW </label>
	                <input type="text" class="form-control" id="pw" name="pw" value='<c:out value="${user.pw}"/>'>
	            </div>
	            <div class="form-group">
	                <label for="name">이름</label>
	                <input type="text" class="form-control"  id="name" name="name" value='<c:out value="${user.name}"/>'>
	            </div>
	            <div class="form-group">
	                <label for="email">E-mail</label>
	                <input type="text" class="form-control" id="email" name="email" value='<c:out value="${user.email}"/>'>
	            </div>
	            <div class="form-group">
	                <label for="gender">성별</label>
	                <select class="form-control" id="gender" name="gender">
	                    <option value="여성">여성</option>
	                    <option value="남성">남성</option>
	                </select>
	            </div>
	            <div class="form-group">
	            	<label for="birth">Birth</label>
	            	<input type="text" class="form-control" id="birth" name="birth" value='<c:out value="${user.birth}"/>'>
	            </div>
	            <div class="text-center">
	                <input type="submit" class="btn btn-success" value="수정하기">
	                <input type="button" class="btn btn-default" onclick="location.href='/user/userInfo'" value="돌아가기">
	            </div>
		    </div>
		</form>
	</div>
</body>
</html>