<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<script>
	// 이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pageContext.request.contextPath}/getRoomList.ado";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}

	// 페이지 번호 클릭
	function fn_pagination(page, range, rangeSize) {
		var url = "${pageContext.request.contextPath}/getRoomList.ado";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}

	// 다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/getRoomList.ado";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
	
	 function confirmDelete(room_idx) {
		    var result = confirm("정말로 삭제하시겠습니까?");
		    alert(result);
		    if (result == 'yes') {
		        window.location.href = "deleteRoom.ado?room_idx=" + room_idx + "&room_item_idx=" + room_item_idx;
		    } else {
		        // 'No'를 선택한 경우, 아무 작업도 하지 않음
		    }
		}
</script>
<head>
<meta charset="UTF-8">
<title>여기오개</title>
<link rel="stylesheet" type="text/css" href="/resources/css/admin/list.css">
</head>
<body id="page-top">
<div id="wrapper">
	<div id="sidebar">
		<%@ include file="../sidebar.jsp" %>
	</div>
	<div id="topbar">
		<%@ include file="../topbar.jsp" %>
		<div id="content-wraaper" class="d-flex flex-column"></div>
	</div>	
			<div class="list-page">
		<h2 class="heading2">객실 관리</h2>

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
		<form id="category-search-list" method="get" action="">
			<input type="hidden" name="mod" value="list">
			<input type="hidden" name="pageid" value="1">
			<div class="category-search-wrap">
				<div class="kboard-search-option-wrap type-select">
					<input type="hidden" name="kboard_search_option[tree_category_1][key]"
							value="tree_category_1"> 
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
				<th style="width: 40px;">NO</th>
				<th style="width: 450px;">제목</th>
				<th style="width: 80px;">관리자</th>
				<th style="width: 230px;">작성일</th>
				<th style="width: 250px;">관리</th>
			</tr>
		</thead>
		<tbody class="tablebody" style="text-align: center;">
		<!-- 데이터행 -->
		<c:forEach var="room" items="${roomList}">

			<tr style="border-bottom: 1px solid #929292">

				<td>${room.room_idx}</td>
				<td class="list_text">
					<a href="getRoomView.ado?room_idx=${room.room_idx}&room_item_idx=${room.room_item_idx}">[객실] ${room.room_name}</a></td>
				<td>여기오개</td>
				<td><fmt:formatDate value="${room.room_regdate}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/></td>
				
				 <td>
								         <!-- 수정, 삭제 버튼 -->
									   <div style="text-align: center;">
									        <a href="updateRoom.ado?room_idx=${room.room_idx}">
									            <button type="button" class="btn btn-warning btn-icon-split">수정</button>
									        </a>
									        <a href="deleteRoom.ado?room_idx=${room.room_idx}&room_item_idx=${room.room_item_idx}">
									  			 <button type="button" class="btn btn-danger btn-icon-split" onclick="confirmDelete(${room.room_idx})">삭제</button>
											</a>
									
											 <a href="getRoomView.ado?room_idx=${room.room_idx}&room_item_idx=${room.room_item_idx}">
									            <button type="button" class="btn btn-light btn-icon-split">상세보기</button>
									            </a>
							    </div>
							    </td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	
	<div>
		<a href="insertRoom.ado">
			<button id="button">객실 등록</button>
		</a>
	</div>
	<br>
	
	</div>
	</div>


	<div id="footer">		
		<%@ include file="../footer.jsp" %>
	</div>

</body>
<br><br><br>
</html>