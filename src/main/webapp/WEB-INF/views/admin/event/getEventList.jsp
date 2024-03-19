<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:url var="getReviewList" value="/getEventList.ado">
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
        var url = "${pageContext.request.contextPath}/getEventList.ado";
        url = url + "?page=" + page;
        url = url + "&range=" + range;
        location.href = url;
    }

    // 페이지 번호 클릭
    function fn_pagination(page, range, rangeSize) {
    	var url = "${pageContext.request.contextPath}/getEventList.ado";
        url = url + "?page=" + page;
        url = url + "&range=" + range;
        location.href = url;
    }

    // 다음 버튼 이벤트
    function fn_next(page, range, rangeSize) {
        var page = parseInt((range * rangeSize)) + 1;
        var range = parseInt(range) + 1;
        var url = "${pageContext.request.contextPath}/getEventList.ado";
        url = url + "?page=" + page;
        url = url + "&range=" + range;
        location.href = url;
    }

</script>
<style>
	.pagination {
		justify-content : center;
	}
</style>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<link href="/resources/css/admin/review.css" rel="stylesheet" />
<title>여기오개</title>

</head>
<body id="page-top">
<div id="wrapper">
	<div id="sidebar">
		<%@ include file="../sidebar.jsp" %>
	</div>
	<div id="topbar">
		<%@ include file="../topbar.jsp" %>
		
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Begin Page Content -->
				<div class="list-page">
					<div class="content">	
					<!-- Page Heading -->
					<h1 class="heading2">이벤트 관리</h1>
						<br>
						<div class="list-page">
						<br>
						<br>
							<div class="EveSearch" align="right" style="margin-right: 5px">
									<form action="${path}/getEventList.ado" method="post"style="display: flex; align-items: center; justify-content: flex-end;">
								 <select class="condition_box" name="searchCondition" style="margin-right: 5px;">
										<option value="title">제목</option>
										<option value="content">내용</option>
										<option value="titleAndContent">제목 + 내용</option>			
									</select>
										<input type="text" class="input_search" name="searchKeyword" placeholder="검색어를 입력하세요."style="margin-right: 5px; height: 30px;">
										<input type="submit" class="search-button" value="검색" style="height: 30px; line-height: 20px;"/>
									</form>
									<br>
								</div>
							<table class="centered-table" style="text-align: center;">
								<thead class="tablehead">
									<tr>
										<th style="width: 40px;">NO</th>
										<th style="width: 450px;">제목</th>
										<th style="width: 80px;">관리자</th>
										<th style="width: 230px;">등록일</th>
										<th style="width: 250px;">관리</th>
									</tr>
								</thead>
								<tbody class="tablebody">
									<c:forEach var="event" items="${eventList}" varStatus="i">
											<tr style="border-bottom: 1px solid #000;">
												<td>${pagination.listCnt - (pagination.startList + i.index)}</td>
												<td><a type="hidden" href="getEvent.ado?idx=${event.idx}">
												<c:choose>
												<c:when test="${event.condition}">[임시글] ${event.title}</c:when>
												<c:otherwise>${event.title}</c:otherwise>
												</c:choose></a></td>
												<td>여기오개</td>
												<td><fmt:formatDate value="${event.regDate}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/></td>
												<td>
													<a href="updateEvent.ado?idx=${event.idx}"><button type="button" class="btn btn-warning btn-icon-split">수정</button></a>
													<a href="deleteEvent.ado?idx=${event.idx}"><button type="button" class="btn btn-danger btn-icon-split">삭제</button></a>
													<a href="getEvent.ado?idx=${event.idx}"><button type="button" class="btn btn-light btn-icon-split">상세보기</button></a>
												</td>
											</tr>
									</c:forEach>
								</tbody>
							</table>
								<div align="right">
								<a href="insertEvent.ado">
									<button type="button" id="button" style="margin-left: 5px; margin-top: 5px; padding: 5px">글 등록</button></a>
								</div>
							<br><br><br><br><br>
   							<div>
							<!-- pagination{s} -->
								<div id="paginationBox">
								    <ul class="pagination">
								        <c:if test="${pagination.prev}">
								            <li class="page-item">
								                <a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a>
								            </li>
								        </c:if>
								        
								        <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx">
								            <li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/>">
								                <a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')">${idx}</a>
								            </li>
								        </c:forEach>
								        
								        <c:if test="${pagination.next}">
								            <li class="page-item">
								                <a class="page-link" href="#" onClick="fn_next('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Next</a>
								            </li>
								        </c:if>
								    </ul>
								</div>
							<!-- pagination{e} -->
						</div>
				   </div>
				</div>
			</div>
		</div>
	</div>
	<br><br><br>
   <div id="footer">      
      <%@ include file="../footer.jsp" %>
   </div>
</div>

</body>
<br><br><br>
</html>