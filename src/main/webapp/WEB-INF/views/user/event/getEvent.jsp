<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	// 줄바꿈
	pageContext.setAttribute("br", "<br/>");
	pageContext.setAttribute("cn", "\n");
%>
<c:set var="now" value="${LocalDateTime.now()}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
<link href="/resources/css/user/event.css" rel="stylesheet" />
  <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>여기오개</title>

</head>
<body id="page_top">
<%@ include file="/WEB-INF/views/user/header.jsp" %>
<div class="main-wrap main-swiper">
<div class="main-img">


</div>

<div class="text-wrap">
<h2>EVENT</h2>
</div>
</div>
	<input name="idx" type="hidden" value="${event.idx}" />
	<div class="container-fluid"  style="margin-top: 100px;">
	
	<!-- Page Heading -->
	    <h1 class="h3 mb-2 text-gray-800">EVENT</h1>
        <br>
         <!-- DataTales Example -->
         <div class="card shadow mb-4">
            <div class="card-header py-3">
               <h6 class="m-0 font-weight-bold text-primary">EVENT</h6>
          	</div>
          	<div class="card-body">
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<tr>
					<th class="title" width="20%">제목</th>
					<td colspan="2">${event.title}</td>
				</tr>
				<tr>
               <th class="date">이벤트 기간</th>
               <td><fmt:formatDate value="${event.startDate}" pattern="yyyy-MM-dd"/>
                    - <fmt:formatDate value="${event.endDate}" pattern="yyyy-MM-dd"/></td>
            </tr>
            <tr>
               <th class="regDate">등록일</th>
               <td><fmt:formatDate value="${event.startDate}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/></td>
            </tr>
			</table>
			
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<tr>
					<td>${fn:replace(event.content, cn, br)}
					<br/><br/><br/>
					</td>
				</tr>
				<tr>
					<td>
					<div id="imageContainer" align= "center">
					<!-- 이미지가 여러 개일 경우에는 반복문으로 처리 -->
					<img id="eventImage" src="https://ogae-dog.s3.ap-northeast-2.amazonaws.com/${img.path}" onerror="this.style.display='none'" alt="Event Image"/>
					</div>
					</td>
				</tr>
			</table>
	
			<!-- 이전글 다음글 -->
			<div>
			<hr style="border: 0.3px solid ##d2d2d2; ">
				<span>다음 글</span>
				<c:choose>
					<c:when test="${prevNext.nextNum == 0}">
						<span style="color: gray;">다음 글이 없습니다.</span>
					</c:when>
					<c:otherwise>
						<span class="nextTitle"><a href="getEvent.do?idx=${prevNext.nextNum}">${prevNext.nextTitle}</a></span>
					</c:otherwise>
				</c:choose>
			</div>
			<div>
			<hr style="border: 0.3px solid ##d2d2d2; ">
				<span>이전 글</span>
				<c:choose>
					<c:when test="${prevNext.prevNum == 0}">
						<span style="color: gray;">이전 글이 없습니다.</span>
					</c:when>
					<c:otherwise>
						<span class="prevTitle"><a href="getEvent.do?idx=${prevNext.prevNum}">${prevNext.prevTitle}</a></span>
					</c:otherwise>
				</c:choose>
			</div>
			<hr style="border: 0.3px solid ##d2d2d2; margin-bottom: 30px;">
		
			<!-- 버튼 -->
			<div align="right">
			<a href="getEventList.do"><button type="button" class="btn btn-light btn-icon-split">목록</button></a>
			</div>
			<br />
			<br />
		</div>
	</div>
</div>

<%@ include file="/WEB-INF/views/user/footer.jsp" %>
</body>
</html>
