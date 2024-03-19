<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" type="text/css" href="/resources/css/user/list.css">

<!-- 게시글 조회수 체크 jQuery(11.15추가) -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>

<body>
<%@ include file="../header.jsp" %>
<div class="content">
	<h1 class="maintitle">NOTICE</h1>
	<div>
		<br>
		<br>
		<h3 class="subtitle">공지사항</h3>
	</div>
	<div class="list-page">
	<br>
	<br>
	<div class=	"search-form">
		<form action="검색결과페이지의URL" method="get">
			<label for="search"></label> 
				<input type="text" id="search" name="q" placeholder="검색어를 입력하세요"> 
				<button type="submit" class="search-button">검색</button>
				<!-- <input type="submit" value="검색"> -->
		</form>
	</div>	
	<div class="category-search">
		<form id="category-search-list" method="get" action="">
			<input type="hidden" name="mod" value="list">
			<input type="hidden" name="pageid" value="1">
			<div class="category-search-wrap">
				<div class="kboard-search-option-wrap type-select">
					<input type="hidden" name="kboard_search_option[tree_category_1][key]"
							value="tree_category_1"> 
					<input type="hidden" name="kboard_search_option[tree_category_1][value]" value="">
					<select onchange="return kboard_tree_category_search('1', this.value)">
						<option selected value="전체">전체</option>
						<option value="제목">제목</option>
						<option value="내용">내용</option>
						<option value="제목+내용">제목+내용</option>
					</select>
				</div>

			</div>
		</form>
	</div>
	
	<table class="centered-table">
		<thead class="tablehead">
			<tr>
				<th>번호</th>
				<th class="list_title" style="width: 750px;">제목</th>
				<th>작성자</th>
				<th style="width: 150px;">작성일</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody class="tablebody">
			<!-- 데이터 행 -->
			<c:forEach var="terms" items="${userTermsList}">
			    <tr>
			        <td>${terms.terms_idx}</td>
<!-- 			        <td class="list_text"> -->
			        	<!-- 조회수 카운트(11.15 추가) -->
<%-- 			        	<a href="termsListView.do?terms_idx=${terms.terms_idx}" onclick="increaseAndViewCount(${terms.terms_idx})">${terms.terms_title}</a></td> --%>
			        <td>${terms.terms_writer}</td>
					 <td><fmt:formatDate value="${terms.terms_regdate}" pattern="yyyy. MM. dd. (E)"/></td>				       
<%-- 			        <td>${terms.terms_regdate}</td> --%>
			        <td>${terms.terms_count}</td>
			    </tr>
			</c:forEach>
		</tbody>
	</table>
	
<!-- 	<!-- 조회수 카운트 동적함수(11.15 추가) --> -->
<!-- 	<script> -->
//         function increaseAndViewCount(termsIdx) {
//             // AJAX를 사용하여 서버에 조회수 증가 요청
//             $.ajax({
//                 type: "POST",
//                 url: "increaseAndViewCount.do", // 실제 서버 요청을 처리하는 URL로 변경
//                 data: { termsIdx: termsIdx },
//                 success: function (response) {
//                     // 서버에서 응답을 받으면 페이지 이동
//                     window.location.href = "termsListView.do?terms_idx=" + termsIdx;
//                 },
//                 error: function (error) {
//                     console.error("Error during count increase:", error);
//                     // 에러가 발생하면 그냥 페이지 이동
//                     window.location.href = "termsListView.do?terms_idx=" + termsIdx;
//                 }
//             });
//             // 페이지 이동이 바로 일어나지 않도록 false 반환
//             return false;
//         }
<!--     </script> -->

	<div class="pagenation">
		<ul>
			<li><a href="#"> < </a></li>
			<li><a href="#">1</a></li>
			<li><a href="#"> > </a></li>
		</ul>
	</div>
	</div>
	<br><br><br>
</div>
<%@ include file="../footer.jsp" %>

</body>
</html>