<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:url var="TourList" value="TourList.ado">
	<c:param name="page" value="${pagination.page}" />
	<c:param name="range" value="${pagination.range}" />
	</c:url>
	
<!DOCTYPE html>
<html>
<script>
	// 이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pageContext.request.contextPath}/getTermsList.ado";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}

	// 페이지 번호 클릭
	function fn_pagination(page, range, rangeSize) {
		var url = "${pageContext.request.contextPath}/getTermsList.ado";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}

	// 다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/getTermsList.ado";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
</script>

<head>
<meta charset="UTF-8">
<title>여기오개</title>
<link rel="stylesheet" type="text/css" href="/resources/css/admin/facility.css">
</head>
<body id="page-top">
<div id="wrapper">
	<div id="sidebar">	
		<%@ include file="../sidebar.jsp" %>
	</div>
	<div id="topbar">
		<%@ include file="../topbar.jsp" %>
	<div id="content-wraaper" class="d-flex flex-column">
	<div class="list-page">
<div class="content">

   <h2 class="heading2">여행지 관리</h2>
   <br>
    <div class="list-page">
   <br>
   <br>
	<div class=	"search-form">
		<form action="검색결과페이지의URL" method="get">
<!-- 			<label for="search"></label>  -->
				<input type="text" id="search" name="q" placeholder="검색어를 입력하세요" style="height: 30px;"> 
				<button type="submit" class="search-button">검색</button>
				<!-- <input type="submit" value="검색"> -->
		</form>
	</div>	
	<div class="category-search">
		<form id="category-search-list" method="get" action="${path}/TourList.ado">
			<input type="hidden" name="mod" value="list">
			<input type="hidden" name="pageid" value="1">
			<div class="category-search-wrap">
				<div class="kboard-search-option-wrap type-select">
					<input type="hidden" name="kboard_search_option[tree_category_1][key]" value="tree_category_1"> 
					<input type="hidden" name="kboard_search_option[tree_category_1][value]" value="">
					<select onchange="return kboard_tree_category_search('1', this.value)">
						<option selected value="">전체</option>
						<option value="제목">제목</option>
						<option value="내용">내용</option>
						<option value="제목+내용">제목+내용</option>
					</select>
				</div>

			</div>
		</form>
	</div>
	
	<table class="centered-table">
		<thead class="tablehead" style="text-align: center;">
			<tr>
				<th width=20%>NO</th>
				<th width="40%" style="text-align: center;">제목</th>
				<th width=30%>관리자</th>
				<th width=30%>관리</th>
			</tr>
		</thead>
		<tbody class="tablebody" style="text-align: center;">
			<!-- 데이터 행 -->
			<c:forEach var="tour" items="${tourList}">
								 <tr style="border-bottom: 1px solid #000;">
									<td>${tour.tour_idx}</td>
									<td class="list_text" style="text-align: center;">
									<a href="getTourView.ado?tour_idx=${tour.tour_idx}">${tour.tour_title}</a></td>
									 <td class="admin-column">여기오개</td>
									 <td>
									 <a href="updateTour.ado?tour_idx=${tour.tour_idx}">
									<button type="button" class="btn btn-warning btn-icon-split">수정</button>
									</a> 
									<a href="getTourView.ado?tour_idx=${tour.tour_idx}">
										<button type="button" class="btn btn-light btn-icon-split">상세보기</button>
									</a> 
									</td>
								</tr>
							</c:forEach>
							
		</tbody>
	</table>
	

	<br>
	
	</div>
	</div>
	</div>
</div>
	<div id="footer">		
		<%@ include file="../footer.jsp" %>
	</div>

</body>
<br><br><br>
</html>