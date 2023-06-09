<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<div class="container-fluid">
		<c:forEach items="${list}" var="dto">
			<div class="card" style="width: 17rem; display: inline-block">
				<c:forEach items="${dto.productFileDTOs}" var="fileDTO" varStatus="i">
					<c:if test="${i.first}">
						<img class="card-img-top" src="../resources/upload/product/${fileDTO.fileName}" alt="Card image cap">
					</c:if>
				</c:forEach>
				
				<div class="card-body">
				  <h5 class="card-title">${dto.name}</h5>
				  <p class="card-text">${dto.summary}</p>
				  <a href="./product/detail?productNum=${dto.productNum}" class="btn theme_btn button_hover success">상세보기</a>
				</div>
			</div>
		</c:forEach>
	</div>