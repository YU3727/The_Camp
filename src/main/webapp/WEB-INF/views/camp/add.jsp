<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="/resources/images/logo.png" type="image/png">
<title>Add Camp - The Camp</title>
<c:import url="../template/common_css.jsp"></c:import>
<link rel="stylesheet" href="/resources/css/campCRUD.css">
<script src="https://kit.fontawesome.com/f0f05cd699.js" crossorigin="anonymous"></script>
</head>
<body>
<c:import url="../template/header.jsp"></c:import>
<!--================Breadcrumb Area =================-->
<section class="breadcrumb_area">
	<div class="overlay bg-parallax" data-stellar-ratio="0.8" data-stellar-vertical-offset="0" data-background=""></div>
	<div class="container">
		<div class="page-cover text-center">
			<h2 class="page-cover-tittle">CAMPBOOK</h2>
				<ol class="breadcrumb">
					<li>캠핑장을 등록해보세요</li>
				</ol>
		</div>
	</div>
</section>
<!--================Breadcrumb Area =================-->
<div class="container col-lg-9 my-5">
	<form action="./add" id="frm" method="post" enctype="multipart/form-data">
	<div class="row my-3">
		<h5><i class="fa-solid fa-circle-info fa-sm"></i> 캠핑장 이름</h5>
		<input type="text" id="ChkName" name="campName" class="form-control my-1" placeholder="캠핑장 이름을 입력하세요">
	</div>
	
	<hr>
	
	<!-- 대표사진 + 설명 div -->
		<!-- 썸네일 사진 추가 -->
		<div class="d-flex row my-3">
			<div class="row pic my-3 mx-auto">
				<!-- 사진이 없는경우 empty.jpg 표시 -->
				<h5><i class="fa-solid fa-camera fa-sm"></i> 대표 사진 등록</h5>
				<div id="thumbnailImage" class="row">
					<div class="row mb-3">
						<input type="file" id="thumbnail" name="thumbFile" class="form-control">
					</div>
				</div>
			</div>
			
			<hr class="my-2">
			
			<div class="row discription my-auto">
				<h5><i class="fa-solid fa-circle-info fa-sm"></i> 캠핑장 주요정보 등록</h5>
				<table class="table">
					<%-- <caption>캠핑장 기본정보입니다. 주소, 문의처, 캠핑장 유형, 찾아오시는길로 나뉘어 설명합니다.</caption> --%>
					<colgroup>
						<col style="width: 30%;"/>
						<col style="width: 70%;"/>
					</colgroup>
					<tbody>
						<!-- 셀렉트박스로 도 / 시군구 구분 -->
						<tr>
							<th scope="col my-auto">시/도, 시/군/구</th>
							<td>
								<select name="doName" id="addressDo" class="nice-select"></select>
								<select name="sigunguName" id="addressSigungu" class="nice-select"></select>
							</td>
						</tr>
						<tr>
							<th scope="col my-auto">주소</th>
							<td><input type="text" name="address" id="addressInput" class="form-control" placeholder="시/도, 시/군/구를 먼저 선택하세요" style="background-color: bisque;" readonly></td>
						</tr>
						<tr>
							<th scope="col my-auto">문의처</th>
							<td><input type="text" name="phone" class="form-control" placeholder="문의 가능한 연락처를 입력하세요"></td>
						</tr>
						<tr>
							<th scope="col my-auto">캠핑장 유형</th>
							<td><input type="text" name="induty" class="form-control" placeholder="유형구분은 쉼표(,)로 해주세요"></td>
						</tr>
						<tr>
							<th scope="col my-auto">홈페이지</th>
							<td><input type="text" name="homePage" class="form-control" placeholder="홈페이지 URL을 입력하세요"></td>
						</tr>
						<tr>
							<th scope="col my-auto">주변이용가능시설</th>
							<td><input type="text" name="posblFacility" class="form-control" placeholder="시설구분은 쉼표(,)로 해주세요"></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<hr>
		

		<!-- contents 내용 시작 -->
		<div id="contents">
			<div class="campContent">
				<!-- 탭 선택 버튼 -->
				<div class="layout">
					<!-- 탭 아래 내용 - 캠핑장소개 / 이용안내 / 위치정보(지도) / 후기 -->

					<!-- 캠핑장소개 영역 -->
					<div class="campIntro my-3" id="campIntro">
						<h5><i class="fa-solid fa-circle-info fa-sm"></i> 캠핑장 소개 등록</h5>
						<!-- 이미지 3장 표시부분, 이미지는 아래쪽에서 추가 -->

						<!-- 인트로 텍스트, 정보수정일 출력 -->
						<i class="fa-solid fa-circle-info fa-sm"></i> 캠핑장 한 줄 소개
						<input type="text" name="lineIntro" class="form-control mb-2" placeholder="캠핑장 한줄소개를 입력하세요">

						<i class="fa-solid fa-circle-info fa-sm"></i> 캠핑장 소개
						<div class="form-floating">
							<textarea id="introText" name="intro" class="form-control" style="height:100px; resize:none;"></textarea>
							<label for="introText">캠핑장 소개 내용을 입력하세요</label>
						</div>
						
						<hr>
						
						<!-- 서비스 내용 입력 -->
						<h5><i class="fa-solid fa-gears fa-sm my-3"></i> 캠핑장 시설정보 등록</h5>
						<div class="row mb-2">
							<!-- checkbox value : 전기, 무선인터넷, 장작판매, 온수, 트렘폴린, 물놀이장, 놀이터, 산책로, 운동장, 운동시설, 마트.편의점 -->
							<div class="col-4">
								<div class="form-check">
									<input class="form-check-input" id="chkBolt" name="serv" value="전기" type="checkbox">
									<label class="form-check-label" for="chkBolt">전기</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" id="chkWifi" name="serv" value="무선인터넷" type="checkbox">
									<label class="form-check-label" for="chkWifi">와이파이</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" id="chkCampWood" name="serv" value="장작판매" type="checkbox">
									<label class="form-check-label" for="chkCampWood">장작판매</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" id="chkHotWater" name="serv" value="온수" type="checkbox">
									<label class="form-check-label" for="chkHotWater">온수</label>
								</div>
							</div>

							<div class="col-4">
								<div class="form-check">
									<input class="form-check-input" id="chkTrampol" name="serv" value="트렘폴린" type="checkbox">
									<label class="form-check-label" for="chkTrampol">트램펄린</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" id="chkPool" name="serv" value="물놀이장" type="checkbox">
									<label class="form-check-label" for="chkPool">물놀이장</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" id="chkPlaygrd" name="serv" value="놀이터" type="checkbox">
									<label class="form-check-label" for="chkPlaygrd">놀이터</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" id="chkTrail" name="serv" value="산책로" type="checkbox">
									<label class="form-check-label" for="chkTrail">산책로</label>
								</div>
							</div>

							<div class="col-4">
								<div class="form-check">
									<input class="form-check-input" id="chkField" name="serv" value="운동장" type="checkbox">
									<label class="form-check-label" for="chkField">운동장</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" id="chkSpoFacty" name="serv" value="운동시설" type="checkbox">
									<label class="form-check-label" for="chkSpoFacty">운동시설</label>
								</div>
								<div class="form-check">
									<input class="form-check-input" id="chkMart" name="serv" value="마트.편의점" type="checkbox">
									<label class="form-check-label" for="chkMart">마트/편의점</label>
								</div>
								<input type="hidden" name="service" id="serviceVal" value="">
							</div>
						</div>

						<hr>


						<!-- 기타 주요시설 출력 -->
						<h5><i class="fa-solid fa-gears fa-sm my-3"></i> 기타 주요시설 등록</h5>
						<section>
							<div>
								<table class="my-3">
									<!-- <caption>사이트 크기(옵션), 글램핑/카라반 내부시설, 동물동반여부, 추가사진등록</caption> -->
									<colgroup>
										<col style="width: 30%;"/>
										<col style="width: 70%;"/>
									</colgroup>
									<tbody>
										<tr>
											<th scope="col">사이트 크기</th>
											<td>요금안내에 입력시 자동으로 표기됩니다.</td>
										</tr>
										<tr>
											<th scope="col">특징</th>
											<td><input type="text" name="feature" class="form-control" placeholder="특징을 입력하세요"></td>
										</tr>
										<tr>
											<th scope="col">글램핑 내부시설</th>
											<td><input type="text" name="glampFacility" class="form-control" placeholder="시설구분은 쉼표(,)로 해주세요"></td>
										</tr>
										<tr>
											<th scope="col">카라반 내부시설</th>
											<td><input type="text" name="caravFacility" class="form-control" placeholder="시설구분은 쉼표(,)로 해주세요"></td>
										</tr>
										<tr>
											<th scope="col">동물 동반여부</th>
											<td><input type="text" name="petAllow" class="form-control" placeholder="가능/불가능 여부를 입력하세요"></td>
										</tr>
									</tbody>
								</table>
							</div>

							<!-- 경고 안내사항 -->
							<!-- <hr>
							<p class="campIntroTxt">
								<span class="infoNotice">
									&nbsp;* TheCamping에 등록된 정보는 현장상황과 다소 다를 수 있으니 <span class="infoRed">반려동물 동반 여부, 부가 시설물, 추가차량</span> 등 원활한 캠핑을 위해 꼭 필요한 사항은 해당 캠핑장에 미리 확인하시기 바랍니다.
								</span> 
							</p> -->
						</section>

						<hr>

						<!-- 이미지 추가 부분 / 인트로 이미지 3장을 제외한 나머지 이미지 표시 -->
						<h5><i class="fa-solid fa-camera fa-sm"></i> ${dto.campName} 사진 등록</h5>
						<div class="otherImage">
							<!-- id=fileList인 부분에 js 작동 -->
							<div id="fileList" class="row">					
								<div class="d-flex justify-content-end mb-3">
									<button class="genric-btn success medium" id="fileAdd" type="button">등록</button>
								</div>
							</div>
						</div>

						<!-- 저작권 안내 -->
						<!-- <div style="margin-top: 30px; margin-bottom: 30px;">
							※ 모든 컨텐츠의 저작권은 TheCamping에 있습니다. 무단 사용 및 불법 재배포는 법적 조치를 받을 수 있습니다.
						</div> -->
					</div> <!-- 캠핑장 소개 영역 종료 -->

					<hr>

					<!-- 이용안내 영역 -->
					<div class="useInfo my-3" id="useInfo">
						<!-- 이용안내 -->
						<h5><i class="fa-solid fa-circle-info fa-sm"></i> 이용 안내사항 등록</h5>
							<!-- 입력 안하는경우 안내사항이 없다는 메시지가 표시됩니다 -->
							<div class="form-floating my-3">
								<textarea id="useInfoText" name="useInfo" class="form-control" style="height:100px; resize:none;"></textarea>
								<label for="useInfoText">입력하지 않는 경우 안내사항이 없다는 메시지가 표시됩니다.</label>
							</div>
						<hr>
							
						<!-- 캠핑사이트 추가부분 -->
						<div class="row addSite">
							<div>
								<h5><i class="fa-solid fa-circle-info fa-sm"></i> 캠핑 사이트 등록</h5>
							</div>
							<div class="d-flex justify-content-end">
								<button class="genric-btn success medium" id="siteAddBtn" type="button">등록</button>
							</div>
						</div>
						
						<!-- siteDTO 입력부 추가될 부분 -->
						<div class="row my-2" id="siteList">
							<!-- siteDTO - 버튼 누르면 생성될 부분 / 최소 한개의 site는 필수 -->
							<div id="siteOne1">
								<div class="input-group mb-2">
									<span class="input-group-text" id="siteName">사이트이름</span>
									<input type="text" name="siteName" data-site-idx="siteName1" class="form-control" placeholder="ex)일반A1, 카라반A1">
									<span class="input-group-text" id="siteSize">크기(m^2)</span>
									<input type="text" name="siteSize" data-site-idx="siteSize1" class="form-control" placeholder="ex)6*11, 10*10">
								</div>
								<div class="input-group mb-2">
									<span class="input-group-text" id="offWeekdaysPrice">비수기 평일</span>
									<input type="text" name="offWeekdaysPrice" data-site-idx="siteOwkPrice1" class="form-control" placeholder="요금 입력">
									<span class="input-group-text" id="offWeekendsPrice">주말</span>
									<input type="text" name="offWeekendsPrice" data-site-idx="siteOwdPrice1" class="form-control" placeholder="요금 입력">
								</div>
								<div class="input-group mb-2">
									<span class="input-group-text" id="peakWeekdaysPrice">성수기 평일</span>
									<input type="text" name="peakWeekdaysPrice" data-site-idx="sitePwkPrice1" class="form-control" placeholder="요금 입력">
									<span class="input-group-text" id="peakWeekendsPrice">주말</span>
									<input type="text" name="peakWeekendsPrice" data-site-idx="sitePwdPrice1" class="form-control" placeholder="요금 입력">
								</div>
								<div class="d-flex justify-content-center mb-2">
									<button type="button" data-site-idx="siteIptDel1" class="siteDels genric-btn danger medium">삭제</button>
								</div>
							</div>
							<!-- 생성 끝날 부분 -->
						</div>
						
						<hr>

						<!-- 시설배치도 / 일단 주석처리하고, 나중에 추가해보기 -->
						<h5><i class="fa-solid fa-circle-info fa-sm"></i> 시설 배치도</h5>
						<div class="row layout my-3 mx-auto">
							<div id="layoutImage" class="row">
								<div class="row mb-3">
									<input type="file" id="layout" name="layoutFile" class="form-control">
								</div>
							</div>
						</div>

						<hr>
					</div> <!-- 이용안내 영역 종료 -->


					
					<!-- 위치정보 영역 -->
					<h5><i class="fa-solid fa-circle-info fa-sm"></i> 위치정보 등록</h5>
					<div class="campMap" id="campMap">
						<p>*정확한 주소를 입력한 경우 자동으로 표기 됩니다.</p>
					</div>

					<!-- 버튼 영역 -->
					<div class="mx-auto">	
						<div class="d-flex justify-content-between my-2">
							<button id="addCancel" class="genric-btn primary" type="button">취소</button>
							<button id="addReg" class="genric-btn success" type="button">등록</button>
						</div>
					</div>


				</div>
			</div>
		</div>
	</form>
	<!-- contents 내용 끝 -->
	
</div>

<c:import url="../template/footer.jsp"></c:import>
<script src="../resources/js/camp/selectBox.js"></script>
<script src="../resources/js/camp/campCRUD.js"></script>
<script src="../resources/js/camp/fileManager.js"></script>
<script>
	setMax(10);
	setParam('files');
	setCount(1);
</script>
<script>
	setSiteMax(5);
	setSiteCount(1);
</script>
<c:import url="../template/common_js.jsp"></c:import>
</body>
</html>