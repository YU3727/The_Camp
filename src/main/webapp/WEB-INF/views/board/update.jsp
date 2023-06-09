<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<c:import url="../template/common_css.jsp"></c:import>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
<link rel="icon" href="/resources/images/logo.png" type="image/png">
<title>The Camp</title>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<!--================Breadcrumb Area =================-->
<section class="breadcrumb_area">
	<div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
	<div class="container">
		<div class="page-cover text-center">
			<h2 class="page-cover-tittle">${boardName}</h2>
			<c:if test="${boardName eq 'qna'}">
				<ol class="breadcrumb">
					<li>자유로운 정보 나눔 마당</li>
				</ol>
			</c:if>
			<c:if test="${boardName eq 'notice'}">
					<ol class="breadcrumb">
						<li>공지사항</li>
					</ol>
				</c:if>
		</div>
	</div>
</section>
<!--================Breadcrumb Area =================-->
	<div class="container col-lg-9 my-5">
		
		
		<div class="row col-md-12 mx-auto border-bottom ">
			<form action="./update" method="post" enctype="multipart/form-data">
				<input type="hidden" name="num" value="${dto.num}">

				<div class="row mb-3">
				  <label for="title" class="col-sm-2 col-form-label">제목</label>
				  <div class="col-sm-10">
					  <input type="text" class="form-control" name="title" id="title" value="${dto.title}" placeholder="제목 입력">
				  </div>
				</div>

				<div class="row mb-3">
				  <label for="writer" class="col-sm-2 col-form-label">작성자</label>
				  <div class="col-sm-10">
				  	<input type="text" class="form-control" name="writer" id="writer" value="${dto.writer}" readonly >
				  </div>
				</div>
				
				
				<div id="fileList" class="my-5">
						<c:forEach items="${dto.boardFileDTOs}" var="fileDTO">
							<div class="input-group mb-3">
							<div class="input-group-text">
								<input class="form-check-input mt-0 deleteCheck" type="checkbox" value="${fileDTO.fileNum}" name="fileNum" aria-label="Checkbox for following text input">
							</div>
							<input type="text" disabled value="${fileDTO.oriName}" class="form-control" aria-label="Text input with checkbox">
							</div>
						</c:forEach>

					<button class="btn btn-primary col-md-1 offset-md-11 my-2" type="button" id="addBtn" >Add</button>
				</div> 
				
				
				<div class="mb-5">
				  <label for="contents" class="form-label">글 내용</label>
				  <textarea class="form-control" name="contents" id="contents" rows="8">${dto.contents}</textarea>
				</div>
				
				
				<div class="row mt-5 mb-3 col-md-2 offset-md-10">
					<button class="btn btn-primary " type="submit">글 수정</button>
				</div>
			</form>
		</div>

			<div class="row mt-5 mb-3 col-md-1 offset-md-9">
				<a href="./detail?num=${dto.num}" class="btn btn-primary">취소</a>
			</div>
	</div>

	
	<c:import url="../template/footer.jsp"></c:import>
	 <script src="../resources/js/fileManager.js"></script> 
	<script>
		 setMax(5); 
		 setCount('${dto.boardFileDTOs.size()}');
		 setParam("files")
		 $('#contents').summernote();
	</script>
	<c:import url="../template/common_js.jsp"></c:import>	
	
	
</body>
</html>