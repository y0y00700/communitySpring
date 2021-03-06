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
                    <h1 class="page-header">UserList</h1>
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
                        	<div class='pull-right'>
                        		<ul class="pagination">
                        			<c:if test="${pageMaker.prev}">
                        				<li class="paginate_button previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
                        			</c:if>
                        			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
                        				<li class="paginate_button ${pageMaker.cri.pageNum==num?"active":""}"><a href='${num}'>${num}</a></li>
                        			</c:forEach>
                        			<c:if test="${pageMaker.next}">
                        				<li class="paginate_button next"><a href="${pageMaker.startPage+1}">Next</a></li>
                        			</c:if>
                        		</ul>
                        	</div>
                        	<form id="actionForm" action="/admin/userManaging" method='get'>
                        		<input type='hidden' name='pageNum' value="${pageMaker.cri.pageNum}">
                        		<input type='hidden' name='amoun' value="${pageMaker.cri.amount}">
                        	</form>
                        </div>
                   </div>
              </div>
           </div>
         <!-- 유저 정보 테이블 -->
</body>
<script>
	$(function(){
		var actionForm=$("#actionForm");
		$(".pagination a").on("click",function(e){
			e.preventDefault();
			console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
	});
</script>
</html>