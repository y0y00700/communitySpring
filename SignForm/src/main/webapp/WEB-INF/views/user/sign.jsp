<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
         .id-input{
            display: inline-block;
            width: 65%;
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
	        <form id="form-sign" action="/user/sign" method="POST">
	            <div class="form-group">
	                <label class="d-block" for="id">ID </label>
	                <input type="text" class="form-control id-input " id="id" name="id">
	                <input type="button" id="id-check" data-id-check="" class="btn btn-info float-right" value="중복확인">
	                <span id="span-id-check"></span>
	            </div>
	            <div class="form-group">
	                <label for="pw">PW </label>
	                <input type="text" class="form-control" id="pw" name="pw" data-pw-check="">
	                <span id="span-pw-message"></span> 
	            </div>
	  		    <div class="form-group">
	                <label for="pw">PW 확인</label>
	                <input type="text" class="form-control" id="pw-check">
	                <span id="span-pwCheck-message"></span> 
	            </div>
	            <div class="form-group">
	                <label for="name">이름</label>
	                <input type="text" class="form-control"  id="name" name="name" data-name-check="false">
	                <span id="span-name-message"></span>
	            </div>
	            <div class="form-group">
	                <label for="gender">성별</label>
	                <select class="form-control" id="gender" name="gender">
	                    <option value="여성">여성</option>
	                    <option value="남성">남성</option>
	                </select>
	            </div>
	            <div class="form-group">
	                <label for="mail">E-mail</label>
	                <input type="text" class="form-control" id="email" name="email" data-email-check="false">
	                <span id="span-email-message"></span>
	            </div>
	            <div class="form-group">
	            	<label for="birth">Birth</label>
	            	<input type="date" class="form-control" id="birth" name="birth" data-birth-check="false">
	            	<span id="span-birth-message"></span>
	            </div>
	            <div class="text-center">
	                <input type="submit" class="btn btn-success" value="가입">
	                <input type="reset" class="btn btn-info">
	                <input type="button" class="btn btn-info" onclick="location.href='/user/login'" value="돌아가기" >
	            </div>
	        </form>
	    </div>
	</div>
</body>
<script>
	$(function(){
		var idCheck = RegExp(/^[A-Za-z0-9_\-]{5,20}$/);
		var pwCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/;
		var nameCheck = RegExp(/^[가-힣]{2,6}$/);
		var birthCheck = RegExp(/^(19|20)[0-9]{2}(0[1-9]|1[0-2])(0[1-9]|[1-2][0-9]|3[0-1])$/);
		var emailCheck =/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/; 
		
		//중복확인 창을 새 window로 열기
		$("#id-check").on("click",function(e){
			var width=(screen.width/2)-300;
			var height=(screen.height/2)-200;
			
			window.open("check","","widht=600px,height=400px,top="+height+"px,left="+width+"px;")
		});
		
		//정규식에 부합하는가 안하는가를 확인후 span태그에서 확인
		$("#pw").on("keyup focusout",function(e){
			if(pwCheck.test($("#pw").val())){
				$("#span-pw-message").html("사용 가능한 패스워드입니다.").css("display","block").css("font-weight","bold").css("color","green").css("margin-top","10px");
				$("#pw").attr("data-pw-check",true);
			}else {
				$("#span-pw-message").html("패스워드를 다시 입력해주세요.").css("display","block").css("font-weight","bold").css("color","red").css("margin-top","10px");
				$("#pw").attr("data-pw-check",false);
			}
		});
		//이름
		$("#name").on("keyup focusout",function(e){
			if(nameCheck.test($("#name").val())){
				$("#span-name-message").html("사용 가능한 이름입니다.").css({"display":"block","font-weight":"bold","color":"green","margin-top":"10px"});
				$("#name").attr("data-name-check",true);
			}else{
				$("#span-name-message").html("사용 불가능한 이름입니다").css({"display":"block","font-weight":"bold","color":"red","margin-top":"10px"});
				$("#name").attr("data-name-check",false);
			}
		});
		//pw확인
		$("#pw-check").on("keyup focusout",function(e){
			if($(this).val()===$("#pw").val()){
				$("#span-pwCheck-message").html("일치합니다.").css("display","block").css("font-weight","bold").css("color","green").css("margin-top","10px");
				$("#pw-check").data("check",true);
			}else{
				$("#span-pwCheck-message").html("불일치합니다.").css("display","block").css("font-weight","bold").css("color","red").css("margin-top","10px");
				$("#pw-check").data("check",false);
			}
		
		});
		//이메일
		$("#email").on("keyup focusout",function(e){
			if(emailCheck.test($("#email").val())){
				$("#span-email-message").html("사용가능한 이메일입니다.").css("display","block").css("font-weight","bold").css("color","green").css("margin-top","10px");
				$("#email").attr("data-email-check",true);
			}else{
				$("#span-email-message").html("형식에 맞춰 이메일을 작성해주세요.").css("display","block").css("font-weight","bold").css("color","red").css("margin-top","10px");
				$("#email").attr("data-email-check",false);
			}
		
		});
		//생일 확인
		$("#birth").on("keyup focusout",function(e){
			if(birthCheck.test($("#birth").val())){
				$("#span-birth-message").html("사용가능한 생일입니다.").css({"display":"block","font-weight":"bold","color":"green","margin-top":"10px"});
				$("#birth").attr("data-birth-check",true);
			}else{
				$("#span-birth-message").html("올바른 생일을 입력해주세요!").css({"display":"block","font-weight":"bold","color":"red","margin-top":"10px"});
				$("#birth").attr("data-birth-check",false);
			}
		});
		
		function check(){
			var id=$("#id").data("id-check");
			var pw=$("#pw").data("pw-check");
			var name=$("#name").data("name-check");
			var email=$("#email").data("email-check");
			var birth=$("#birth").data("birth-check");
			
			if(id && pw && name && email && birth){
				return true;
			}else{
				return false;
			}
		}
		
		$("submit").on("click",function(e){
			e.preventDefault();
			if(check()){
				$("#form-sign").submit();
			}else{
				alert("누락된 정보가 있습니다.");
			}
		});
		
		
		
	})
</script>
</html>