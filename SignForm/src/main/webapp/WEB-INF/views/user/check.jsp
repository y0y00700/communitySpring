<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
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
        .float-right{
            float: right;
        }
    </style>
</head>
<body>
    <div class="container-fluid height-100">
        <div class="row box">
        	<h2 class="text-center text-primary">ID 중복확인</h2>
            <form id="form-check" action="/user/overlap" method="get">
                <div class="form-group">
                    <label for="id">ID </label>
                    <input type="text" class="form-control" id="id-check" name="id" value="<c:out value='${id}'/>" required>
                    <span id="check-message"></span>
                </div>
                <div class="text-center">
                    <input type="button" id='btn1' class="btn btn-success" value="사용하기">
                    <input type="submit" data-check="false" class="btn btn-success"  value="중복확인">
                </div>
            </form>
        </div>
    </div>
</body>
<script>
	$(function(){
		var message ="${message}";
	    var check="${check}";
	    if(message!=""){
	        alert(message);
	    }
	    if(check==="true"){
	        //중복됨
	        $("#check-message").html("이미 사용중인 아이디입니다.").css("display","block").css("font-weight","bold").css("color","purple").css("margin-top","10px");
	        $(":submit").attr("data-check",false);
	    }else if(check==="false"){
	        //중복안됨
	        $("#check-message").html("사용 가능한 아이디 입니다.").css("display","block").css("font-weight","bold").css("color","blue").css("margin-top","10px");
	        $(":submit").attr("data-check",true);
	        $("#id-check").val("${id}");
	    }
	
	    $("submit").on("click",function(e){
	        e.preventDefault();
	        if($("#id-check").val()!==""){
	            ("#form-check").submit();
	        }else{
	            window.alert("중복확인 할 ID를 입력하세요.");
	        }
	    });
	    
	    $("#btn1").on("click",function(e){
	        if($(":submit").attr("data-check")==="true"){
	            $("#id",opener.document).val($("#id-check").val());
	            $("#id-check",opener.document).attr("data-id-check",true);
	            window.close();
	        }else if($(":submit").attr("data-check")==="false"){
	            window.alert("사용 불가능한 아이디 입니다.");
	        }else{
	            window.alert("중복체크 해주세요");
	        }
	    });
	})
</script>
</html>