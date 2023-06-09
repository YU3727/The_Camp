<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div>
	<c:choose>
		<c:when test="${not empty cartList}">
			<c:forEach items="${cartList}" var="dto">
				<c:forEach items="${dto.productFileDTOs}" var="fileDTO" varStatus="i">
					<c:if test="${i.first}">
		        		<img src="../resources/upload/product/${fileDTO.fileName}" alt="" style="width: 50%; height: 50%;">
					</c:if>
				</c:forEach>
				<p>${dto.name}</p>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<tr height="200px">
				<td class="align-middle text-center" colspan="20">장바구니가<br>비었습니다.</td>
			</tr>
		</c:otherwise>
	</c:choose>
</div>