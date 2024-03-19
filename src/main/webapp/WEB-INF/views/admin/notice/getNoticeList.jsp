<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:url var="getNoticeList" value="/getNoticeList.ado">
	<c:param name="page" value="${pagination.page}" />
	<c:param name="range" value="${pagination.range}" />
</c:url>

<!DOCTYPE html>
<html>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	// 이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pageContext.request.contextPath}/getNoticeList.ado";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}

	// 페이지 번호 클릭
	function fn_pagination(page, range, rangeSize) {
		var url = "${pageContext.request.contextPath}/getNoticeList.ado";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}

	// 다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/getNoticeList.ado";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
	
	 function confirmDelete(notice_idx) {
		    var result = confirm("정말로 삭제하시겠습니까?");
		    alert(result);
		    if (result) {
		        window.location.href = "deleteNotice.ado?notice_idx=" + notice_idx;
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
			<%@ include file="../sidebar.jsp"%>
		
		</div>
		<div id="topbar">
			<%@ include file="../topbar.jsp"%>
			<div id="content-wraaper" class="d-flex flex-column">
			</div>
		</div>		
				<div class="list-page">

					<<h2 class="heading2">공지사항 관리</h2>
					<br> <br>
	
					<div class="search-form" align="right" style="margin-right: 5px">
                           <form action="${path}/getNoticeList.ado" method="post" style="display: flex; align-items: center; justify-content: flex-end;">
                           <select class="condition_box" name="searchCondition" style="margin-right: 5px;">
                              <option value="title">제목</option>
                              <option value="content">내용</option>
                              <option value="titleAndContent">제목 + 내용</option>         
                           </select>
                              <input type="text" class="input_search" name="searchKeyword" placeholder="검색어를 입력하세요." style="margin-right: 5px; height: 30px;">
                              <input type="submit" class="search-button" value="검색" style="height: 30px; line-height: 20px;"/>
                           </form>
                        </div>
                        

					<table class="centered-table">
						<thead class="tablehead" style="text-align: center;">
							<tr>
								<th style="width: 40px;">NO</th>
								<th style="width: 450px;">제목</th>
								<th style="width: 80px;">관리자</th>
								<th style="width: 230px;">등록일</th>
								<th style="width: 60px;">조회수</th>
								<th style="width: 250px;">관리</th>
							</tr>
						</thead>
						<tbody class="tablebody" style="text-align: center;">
							<!-- 데이터 행 -->
							<c:forEach var="notice" items="${noticeList}">
<%-- 							<c:forEach var="notice" items="${pagination.noticeList}"> --%>
								<tr>
									<td>${notice.notice_idx}</td>
									<td class="list_text">
									<a href="getNoticeView.ado?notice_idx=${notice.notice_idx}">
										 <c:choose>
                    						<c:when test="${notice.notice_condition}">[임시글] ${notice.notice_title}</c:when>
                    						<c:otherwise>${notice.notice_title}</c:otherwise>
                						</c:choose>
									</a>
									</td>
									<td>${notice.notice_writer}</td>
									<td><fmt:formatDate value="${notice.notice_regdate}" pattern="yyyy년 MM월 dd일 HH:mm:ss" /></td>
									<td>${notice.notice_count}</td>
									
									 <td>
								         <!-- 수정, 삭제 버튼 -->
									   <div style="text-align: center;">
									        <a href="updateNoticeBoard.ado?notice_idx=${notice.notice_idx}">
									            <button type="button" class="btn btn-warning btn-icon-split">수정</button>
									        </a>
									        <a href="deleteNotice.ado?notice_idx=${notice.notice_idx}">
									  			 <button type="button" class="btn btn-danger btn-icon-split" onclick="confirmDelete(${notice.notice_idx})">삭제</button>
											</a>
									
											 <a href="getNoticeView.ado?notice_idx=${notice.notice_idx}">
									            <button type="button" class="btn btn-light btn-icon-split">상세보기</button>
									            </a>
							    </div>
							    </td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<div style="margin-bottom: 70px;">
						<a href="insertNoticeBoard.ado">
							<button id="button">글쓰기</button>
						</a>
					</div>
					
					
		
					<div class="pagenationBox" style="margin-bottom: 50px;">
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
									<a class="page-link" href="#"
									onClick="fn_next('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Next</a>
								</li>
							</c:if>

						</ul>
					</div>
					<!-- 페이지네이션 끝 -->
					
				</div>
			</div>
	<div id="footer">
		<%@ include file="../footer.jsp"%>
	</div>
	
</body>
<br>
<br>
<br>
</html>