<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
              <li><a href="/admin/userManagingAjax">Ajax 방식 회원 관리</a></li>
              <li><a href="/admin/adminManager">관리자 관리</a></li>
            </ul>
          </div>
        </div>
      </nav>
 <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">UserListAax</h1>
                </div>
                <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
                <div class="col-lg-12">
                    <div class="panel panel-default">
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                        	<table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                        		<thread>
                        			<tr>
                        				<td>id</td>
                        				<td>name</td>
                        				<td>gender</td>
                        				<td>email</td>
                        				<td>birth</td>
                        			</tr>
                        		</thread>
                        		<c:forEach items="${user}" var="user">
                        			<tr>
                        				<td><c:out value="${user.id}"/></td>
                        				<td>
                        					<a class='move' href='<c:out value="${user.id}"/>'>
                        						<c:out value="${user.name}"/>
                        					</a>
                        				</td>
                        				<td><c:out value="${user.gender}"/></td>
                        				<td><c:out value="${user.email}"/></td>
                        				<td><c:out value="${user.birth}"/></td>
                        			</tr>
                        		</c:forEach>
                        	</table>
                        	<input type="button" class="btn btn-warning" id="search" value="유저목록 조회">
                        		<div id="result"></div>
                        </div>	
                   </div>
              </div>
           </div>
         <!-- 유저 정보 테이블 -->
</body>
<script>
$(function(){
    var message="${message}";
        $("#search").on("click",function(e){
            var userList= function(callback){			
                $.ajax({
                    url:"/admin/requestUser",
                    type:"POST",
                    contentType:"application/json;charset=utf-8",
                    success:function(data,status,xhr){
                        if(callback){
                            callback(data);
                        }
                    },
                    error:function(xhr,status,er){
                        alert(er);
                    }
                });
            }

            console.log(userList(userList));
        });
});
</script>
</html>