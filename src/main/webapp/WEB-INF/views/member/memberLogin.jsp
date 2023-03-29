<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="../template/common_css.jsp"></c:import>
</head>
<body>
<div class="container-fluid">
	<div class="row justify-content-center">
		<h1 class="col-md-7 my-5">Member Login</h1>
	</div>
	<div class="row justify-content-center my-5">
		<form class="col-md-7" action="memberLogin" method="post">
			<div class="mb-3">
	    		<label for="id" class="form-label">ID</label>
	    		<input type="text" value="${cookie.rememberId.value}" class="form-control" id="id" name="id">
		  	</div>
		  	<div class="mb-3">
				<label for="pw" class="form-label">Password</label>
			  	<input type="password" class="form-control" id="pw" name="pw">
			</div>
			<div class="mb-3 form-check">
			  	<input type="checkbox" name="remember" value="remember" class="form-check-input" id="remember">
			  	<label class="form-check-label" for="remember">ID 기억하기</label>
			</div>
	  		<button type="submit" class="btn btn-primary">로그인</button>
	  		<a href="./memberJoin" class="btn btn-info">회원 가입</a>
		</form>
	</div>
</div>
	<div class="mb-3 form-check">
<a href="./findIdForm" id="find_id" class="btn btn-warning">아이디 찾기</a>
<a href="./findPwForm" id="find_pw" class="btn btn-dark">비밀번호 찾기</a>
</div>
</body>
</html>