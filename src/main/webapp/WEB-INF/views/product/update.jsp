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
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
	<!--================Breadcrumb Area =================-->
	<section class="breadcrumb_area">
		<div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
		<div class="container">
			<div class="page-cover text-center">
				<h2 class="page-cover-tittle">RENT</h2>
				<ol class="breadcrumb">
					<li>등록된 장비를 수정해보세요</li>
				</ol>
			</div>
		</div>
	</section>
	<!--================Breadcrumb Area =================-->
	<div class="container">
		<div class="row md-7">
			<p class="col-md-7 mx-auto text-center border-bottom border-dark pb-4"></p>
		</div>
		<div class="row justify-content-center">
			<form class="col-md-7" action="./update" method="post" enctype="multipart/form-data">
				<input type="hidden" name="productNum" value="${dto.productNum}">
				<div class="mb-3">
					<label for="name" class="form-label">상품명</label>
					<input name="name" type="text" class="form-control" id="name" placeholder="물품명을 입력해주세요." value="${dto.name}">
				</div>
				<div class="mb-3">
					<label for="summary" class="form-label">한줄설명</label>
					<input name="summary" type="text" class="form-control" id="summary" placeholder="한줄설명을 입력해주세요." value="${dto.summary}">
				</div>
				<c:forEach items="${dto.productGradeDTOs}" var="gradeDTO">
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<label class="input-group-text" for="gradeName">${gradeDTO.gradeName} 수량</label>
							<input type="hidden" name="gradeName" value="${gradeDTO.gradeName}">
						</div>
						<div class="input-group-prepend">
							<input class="form-control" name="gradeStock" value="${gradeDTO.gradeStock}">
						</div>
					</div>
					<div class="input-group mb-3">
						<div class="input-group-prepend">
							<label class="input-group-text" for="price">${gradeDTO.gradeName} 금액</label>
						</div>
						<div class="input-group-prepend">
							<input name="price" type="text" class="form-control" id="price" value="${gradeDTO.price}">
						</div>
					</div>
				</c:forEach>
				<div class="mb-3">
		  			<label for="contents" class="form-label">상세정보</label>
		 			<textarea name="contents" class="form-control" id="contents" rows="7">${dto.contents}</textarea>
				</div>
				
				<div id="fileList">
					<c:forEach items="${dto.productFileDTOs}" var="fileDTO">
						<div class="input-group mb-3">
							<div class="input-group-text">
								<input class="form-check-input mt-0 deleteCheck" type="checkbox" value="${fileDTO.fileNum}" name="fileNum" aria-label="Checkbox for following text input">
							</div>
							<input type="text" disabled value="${fileDTO.oriName}" class="form-control" aria-label="Text input with checkbox">
						</div>
					</c:forEach>
					<button type="button" id="addBtn" class="offset-md-10 genric-btn success radius">ADD</button>
				</div>
				<div class="mt-5">
					<button class="genric-btn success radius" type="submit">상품수정</button>
				</div>
			</form>
		</div>
	</div>
	<c:import url="../template/footer.jsp"></c:import>
	<script src="../resources/js/fileManager.js"></script>
	<script>
		setParam('addFiles')
		setMax(3);
		setCount('${dto.productFileDTOs.size()}');
		$('#contents').summernote({focus:true, lang:'ko-KR',
		callbacks:{
			onImageUpload: function(image) {
                 
				let file = image[0];
				let reader = new FileReader();
				reader.onloadend = function() {
					let image = $('<img>').attr('src',  reader.result);
					image.attr('width','100%');
					$('#contents').summernote("insertNode", image[0]);
				}
			   reader.readAsDataURL(file);
			
		  }
		}

		})
	</script>
	<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>