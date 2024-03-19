<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:url var="getEventList" value="/getEventList.do">
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
        var url = "${pageContext.request.contextPath}/getEventList.do";
        url = url + "?page=" + page;
        url = url + "&range=" + range;
        location.href = url;
    }

    // 페이지 번호 클릭
    function fn_pagination(page, range, rangeSize) {
    	var url = "${pageContext.request.contextPath}/getEventList.do";
        url = url + "?page=" + page;
        url = url + "&range=" + range;
        location.href = url;
    }

    // 다음 버튼 이벤트
    function fn_next(page, range, rangeSize) {
        var page = parseInt((range * rangeSize)) + 1;
        var range = parseInt(range) + 1;
        var url = "${pageContext.request.contextPath}/getEventList.do";
        url = url + "?page=" + page;
        url = url + "&range=" + range;
        location.href = url;
    }

</script>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<link href="/resources/css/user/event.css" rel="stylesheet" />

<title>여기오개</title>
<style>
.pagination {
	justify-content : center;
}

img {
	width: 100%; /* 이미지의 너비를 100%로 설정하여 컨테이너에 맞춥니다. */
	height: auto; /* 높이를 자동으로 조절하여 이미지의 비율을 유지합니다. */
	transition: width 0.3s ease; /* 부드러운 너비 변환을 위한 트랜지션 추가 */
}
</style>
</head>
<body id="page_top">
<%@ include file="/WEB-INF/views/user/header.jsp"%>
<div class="main-wrap main-swiper">
<div class="main-img">


</div>

<div class="text-wrap">
<h2>EVENT</h2>
</div>
</div>
	<div class="container-fluid" style="margin-top: 100px;">
		
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">EVENT</h6>
			</div>
			<div class="card-body">
				<div class="event_list_wrapper">
					<div class="tab_wrapper">
						<ul id="tabList">
							<li>진행 중인 이벤트</li>
						</ul>
					</div>
					<div class="table-responsive">
						<div class="EveSearch" align="right" style="margin-right: 5px">
							<form action="${path}/getEventList.do" method="post">
							<select class="condition_box" name="searchCondition">
								<option value="title">제목</option>
								<option value="content">내용</option>
								<option value="titleAndContent">제목 + 내용</option>			
							</select>
								<input type="text" class="input_search" name="searchKeyword" placeholder="검색어를 입력하세요.">
								<button type="submit" class="btn btn-success btn-icon-split" style="height: 30px; line-height: 20px;">검색</button>
							</form>
						</div>
						<div class="my-2"></div>
						<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
						    <c:forEach var="event" items="${eventList}" varStatus="loopStatus">
						        <c:if test="${event.condition eq false}">
						            <c:if test="${loopStatus.index % 3 == 0}">
						                <!-- 세 개의 이벤트가 한 행에 표시되도록 tr 태그를 추가 -->
						                <tr>
						            </c:if>
						            <td>
						                <div class="event_tab_list">
						                    <div class="event_list_content">
						                        <a href="getEvent.do?idx=${event.idx}">
						                            <c:forEach var="img" items="${imgList}">
						                                <c:if test="${img.idx eq event.idx}">
						                                    <img src="https://ogae-dog.s3.ap-northeast-2.amazonaws.com/${img.path}" alt="Event Image" />
						                                </c:if>
						                            </c:forEach>
						                        </a>
						                        <br/>
						                        <div style="text-align: center; font-weight: bold;">
						                            <span class="title">${event.title}</span><br/>
						                            <span class="startDate"><fmt:formatDate value="${event.startDate}" pattern="yyyy-MM-dd"/></span>
						                             - <span class="endDate"><fmt:formatDate value="${event.endDate}" pattern="yyyy-MM-dd"/></span>
						                        </div>
						                    </div>
						                </div>
						            </td>
						            <c:if test="${loopStatus.index % 3 == 2 or loopStatus.last}">
						                <!-- 세 개의 이벤트가 한 행에 표시되도록 tr 태그를 닫음 -->
						                </tr>
						            </c:if>
						        </c:if>
						    </c:forEach>
						</table>
					

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
<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>
</html>
