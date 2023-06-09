<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/common_css.jsp"></c:import>
<link rel="icon" href="/resources/images/logo.png" type="image/png">
<title>The Camp</title>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
	
	<div class="container-fluid my-3">
		
		<div class="row mb-4 border-bottom border-info">
			<h1 class="col-md-7 mx-auto text-center pb-3 fs-2">신고 페이지</h1><br>
		</div>
		
		<div class="row col-md-8 mx-auto border-bottom ">
			<form action="./report" method="post">
				
				<input type="hidden" name="num" value="${dto.num}">
				<input type="hidden" name="boardId" value="${dto.boardId}">
				<input type="hidden" name="reportResult" value="1">
				<input type="hidden" name="reportedUser" value="${dto.reportedUser}">
				<input type="hidden" name="reportedContents" value="${dto.reportedContents}">
				<c:if test="${not empty commentNum}">
					<input type="hidden" name="commentNum" value="${commentNum}">
				</c:if>
				<div class="row mb-3">
				  <label for="writer" class="col-sm-2 col-form-label">작성자</label>
				  <div class="col-sm-10">
				  	<input type="text" class="form-control" name="reporter" id="reporter" value="${member.id}" readonly >
				  </div>
				</div>
				
				<div class="col-auto">
					<label for="kind" class="visually">신고 유형</label> 
					<select class="form-select" name="reportType" id="reportType" aria-label="Default select example">
						<option value="욕설/비방" selected>욕설/비방</option>
						<option value="도배">도배</option> 					
						<option value="광고">광고</option> 
					</select>						
				</div>
				
				<div class="mb-5">
				  <label for="contents" class="form-label">신고 사유</label>
				  <textarea class="form-control" name="reportContents" id="reportContents" rows="8"></textarea>
				</div>
				
				
				<div class="row mt-5 mb-3 col-md-2 offset-md-10">
					<button class="btn btn-primary " type="submit">신고</button>
				</div>
			
			</form>
		</div>
	</div>



	<c:import url="../template/common_js.jsp"></c:import>	
	
	
</body>
</html>