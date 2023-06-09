<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/resources/images/logo.png" type="image/png">
<title>The Camp</title>
<c:import url="../template/common_css.jsp"></c:import>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<!--================Banner Area =================-->
<section class="breadcrumb_area blog_banner_two">
	<div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
	<div class="container">
		<div class="page-cover text-center">
			<h2 class="page-cover-tittle">LOG IN</h2>
				<ol class="breadcrumb">
					<li>함께 캠핑갈래요?</li>
				</ol>
		</div>
	</div>
</section>
<!--================Banner Area =================-->
<div class="container-fluid col-lg-9 my-5">
	<div class="row justify-content-center">
		<form class="col-lg-9" action="memberLogin" method="post">
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
			<div class="d-flex justify-content-between my-3">
				<a href="./memberAgree" class="genric-btn success-border">회원 가입</a>
				<button type="submit" class="genric-btn success-border">로그인</button>
			</div>
			
			<div class="d-flex justify-content-between mb-3">
				<a href="./findIdForm" id="findId" class="genric-btn primary-border">아이디 찾기</a>
				<a href="./findPw" id="findPw" class="genric-btn primary-border">비밀번호 찾기</a>
				<a class="genric-btn primary" href="https://kauth.kakao.com/oauth/authorize?client_id=a68e05dc27f7fb4288530cb001c55c40&redirect_uri=http://localhost:80/member/kakaoLogin&response_type=code">
			<!-- REST_API키 및 REDIRECT_URI는 본인걸로 수정하세요
				본인걸로 수정 시 띄어쓰기 절대 하지 마세요. 오류납니다. -->
				카카오 로그인</a>
			</div>
		</form>

	</div>
</div>



	
<c:import url="../template/footer.jsp"></c:import>
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>