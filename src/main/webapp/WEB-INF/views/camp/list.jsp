<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CampList - The Camping</title>
<c:import url="../template/common_css.jsp"></c:import>
<style>
	a{
		color: black;
		text-decoration: none;
	}
</style>
</head>
<body>
<div class="container-fluid my-5">
	<div class="row my-5">
		<h1>CampList Page</h1>
	</div>
	
	<div class="row mb-5">
		<table>
			<tr>
				<th>캠핑장 이름</th>
				<th>캠핑장 전화번호</th>
				<th>캠핑장 주소</th>
			</tr>
			<c:forEach items="${list}" var="dto">
				<tr>
					<td class="btn btn-primary"><a class="a" href="./detail?campNum=${dto.campNum}">${dto.name}</a></td>
					<td>${dto.phone}</td>
					<td>${dto.address}</td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<!-- Pager -->
	<!-- JavaScript로 페이지 바꾸기 -->
	<div class="row col-3 mx-auto">
		<nav aria-label="Page navigation example">
		  <ul class="pagination">
		  
		  	<li class="page-item">
		      <a class="page-link" href="#" aria-label="Previous" data-board-page="1">
		        <span aria-hidden="true">&laquo;</span>
		      </a>
		    </li>
		  
		    <li class="page-item ${pager.before ? 'disabled' :''}" data-board-page="${pager.startNum-1}">
		      <a class="page-link" href="#" aria-label="Previous">
		        <span aria-hidden="true">&lsaquo;</span>
		      </a>
		    </li>
		    
		    <c:forEach begin="${pager.startNum}" end="${pager.lastNum}" step="1" var="i">
		    	<li class="page-item"><a class="page-link" href="#" data-board-page="${i}">${i}</a></li>			    
		    </c:forEach>

		    <li class="page-item ${pager.after eq false ? 'disabled' :''}">
		      <a class="page-link" href="#" aria-label="Next" data-board-page="${pager.lastNum+1}">
		        <span aria-hidden="true">&rsaquo;</span>
		      </a>
		    </li>
		    
		    <li class="page-item">
		      <a class="page-link" href="#" aria-label="Next" data-board-page="${pager.totalPage}">
		        <span aria-hidden="true">&raquo;</span>
		      </a>
		    </li>
		  </ul>
		</nav>
	</div>

	<!-- search -->
	<!-- 만들어뒀던거 쓸수는 있는데 select의 option 태그를 좀 바꿔야함 -->
	<div class="row col-7 mx-auto">
		<form class="row g-3" action="./list" method="get" id="searchForm">
			<input type="hidden" name="page" value="1" id="page">
			<div class="col-3">
				<label for="kind" class="visually-hidden">Kind</label>
				<select class="form-select" name="kind" id="kind" aria-label="Default select example">
					<option value="name" ${pager.kind eq 'name'? 'selected':''}>캠핑장명</option>
					<option value="phone" ${pager.kind eq 'phone'? 'selected':''}>전화번호</option>
					<option value="address" ${pager.kind eq 'address'? 'selected':''}>주소</option>
					<option value="contents" ${pager.kind eq 'contents'? 'selected':''}>상세내용</option>
				</select>
			</div>
			<div class="col-6">
				<label for="search" class="visually-hidden">Search</label>
				<input type="text" class="form-control" name="search" value="${pager.search}" id="search" placeholder="검색어를 입력하세요">
			</div>
			<div class="col-3">
				<button type="submit" class="btn btn-primary mb-3">검색</button>
			</div>
		</form>
	</div>





</div>
	
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>