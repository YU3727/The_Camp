<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/common_css.jsp"></c:import>
<title>Insert title here</title>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<div class="container-fluid">
	<div class="row">
			<div class="row" id="boardName" data-board-name="${boardName}">
				<h1> ${boardName} Detail Page</h1>
			</div>
			
			<h3>제목 : ${dto.title}</h3>
			<c:choose>
				<c:when test="${boardName eq 'notice'}">
					<h3>작성자 : 관리자</h3>	
				</c:when>
				<c:otherwise>
					<h3>작성자 : ${dto.writer}</h3>
				</c:otherwise>
			</c:choose>
			
			<h3>글 내용 : ${dto.contents}</h3>
			
			<c:if test="${!empty dto.boardFileDTOs}">
				<c:forEach items="${dto.boardFileDTOs}" var="fileDTO">
					<img src="../resources/upload/${boardName}/${fileDTO.fileName}">
					<a href="./fileDown?fileNum=${fileDTO.fileNum}">${fileDTO.oriName}</a>
				</c:forEach>
			</c:if>
				 
			</div>
	</div>

	<c:if test="${boardName ne 'notice'}">
		<div class="my-5">
	  	
			<section class="mb-5 mx-2">
				<div class="card bg-light mx-auto col-md-9">

					<div class="card-body">
						<!-- Comment form-->
						<textarea class="form-control mb-3" rows="3" id="replyContents" name="contents" placeholder="댓글 입력"></textarea>
					</div>
					<div class="mb-3">
						<button class="btn btn-primary col-auto offset-md-11" data-board-num="${dto.num}" id="replyAdd">댓글 작성</button>
					</div>
				</div>

			</section>


		

			
			<div class="row col-md-12 offset-md-1" id="commentList">
			</div>
		</div>
	</c:if>
	



	<div class="row">
		<%-- <c:if test="${member.id eq dto.writer}"> --%>
			<div class="col-md-8">
				<form action="./update" id="frm" method="GET">
					<input type="hidden" name="num" value="${dto.num}">
						
					<!-- delete시엔 post방식 update시엔 get -->
					<button type="submit" class="btn btn-primary col-md-2 mx-2" id="update">글 수정</button>
					
					<button type="button" class="btn btn-primary col-md-2 mx-2" id="delete" data-delete="${dto.num}">글 삭제</button>
				</form>
			</div>
		<%-- </c:if> --%>
		
		<a href="./list" class="btn btn-primary col-md-2 mx-1">목록으로</a>	
		


	</div>
</div>
	<script type="text/javascript" src="../resources/js/boardForm.js"></script>
	<script type="text/javascript" src="../resources/js/comment.js"></script>
	<script>
		setNum('${dto.num}');

	</script>
	<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>