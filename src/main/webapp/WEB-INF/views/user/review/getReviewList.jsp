<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:url var="getReviewList" value="/getReviewList.do">
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
       var url = "${pageContext.request.contextPath}/getReviewList.do";
       url = url + "?page=" + page;
       url = url + "&range=" + range;
       location.href = url;
   }

   // 페이지 번호 클릭
   function fn_pagination(page, range, rangeSize) {
   	var url = "${pageContext.request.contextPath}/getReviewList.do";
       url = url + "?page=" + page;
       url = url + "&range=" + range;
       location.href = url;
   }

   // 다음 버튼 이벤트
   function fn_next(page, range, rangeSize) {
       var page = parseInt((range * rangeSize)) + 1;
       var range = parseInt(range) + 1;
       var url = "${pageContext.request.contextPath}/getReviewList.do";
       url = url + "?page=" + page;
       url = url + "&range=" + range;
       location.href = url;
   }

function checkPasswordAndRedirect(idx) {
  var inputPass = prompt("해당 글에 맞는 비밀번호를 입력하세요.");
  console.log(inputPass); // 로그 출력
  
  $.ajax({
	  type: "POST",
	  url: "/checkReviewPassword.do",
	  data: {
	    idx: idx,
	    inputPass: encodeURIComponent(inputPass)
	  },
	  dataType: "text",
	  success: function (response) {
          // 성공적으로 응답을 받았을 때 실행되는 콜백 함수
          console.log("Response:", response); // 서버 응답을 로그에 출력

          // 비밀번호가 일치할 경우에만 동작 수행
          if (response === "success") {
              window.location.href = "getReview.do?idx=" + idx;
          } else {
              alert("비밀번호가 일치하지 않습니다.");
          }
      },
          error: function (error) {
          // 요청이 실패했을 때 실행되는 콜백 함수
          console.error(error);
      }
  });
}
</script>
<head>
<meta charset="UTF-8">
<title>여기오개</title>
<link href="/resources/css/user/review.css" rel="stylesheet" type="text/css" />
<style>
	.pagination {
		justify-content : center;
	}
</style>
</head>
<body id="page_top">
 <%@ include file="/WEB-INF/views/user/header.jsp" %>
 
  	<div class="main-wrap main-swiper">
<div class="main-img">


</div>

<div class="text-wrap">
<h2>REVIEW</h2>
</div>
</div>
 
	<div class="container-fluid" style="margin-top: 100px;">

		<!-- Page Heading -->
		<!-- DataTales Example -->
		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">REVIEW</h6>
			</div>
			<div class="card-body">
			<br>
				<div class="table-responsive">
					
					<div class="revSearch" align="right" style="margin-right: 5px">
						<form action="${path}/getReviewList.do" method="post" style="display: flex; align-items: center; justify-content: flex-end;">
						<select class="condition_box" name="searchCondition">
							<option value="title">제목</option>
							<option value="content">내용</option>
							<option value="writer">작성자</option>			
						</select>
							<input type="text" class="input_search" name="searchKeyword" placeholder="검색어를 입력하세요.">
							<button type="submit" class="btn btn-success btn-icon-split" style="height: 30px; line-height: 20px;">검색</button>
						</form>
					</div>
					<br>
					
					<div class="my-2"></div>
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
						<thead align="center">
							<tr>
								<th style="width:5%;">NO</th>
								<th style="width:60%;">제목</th>
								<th style="width:10%;">작성자</th>
								<th>등록일</th>
								<th style="width:8%;">조회수</th>
							</tr>
						</thead>
						<tbody align="center">
							<c:forEach var="review" items="${reviewList}" varStatus="i">
							<tr>
								<td>${pagination.listCnt - (pagination.startList + i.index)}</td>
									<c:if test="${review.secret eq 'true'}">
										<td><img src="/resources/images/잠금.png" alt="비밀글" style="width: 3%"/>
										<a href="#" onclick="checkPasswordAndRedirect(${review.idx})">${review.title}</a>
									</c:if>
									<c:if test="${review.secret eq 'false'}">
										<td><a href="getReview.do?idx=${review.idx}" onclick="countReview(${review.idx})">${review.title}</a></td>
									</c:if>
								<td>${review.writer}</td>
								<td><fmt:formatDate value="${review.regDate}" pattern="yyyy년 MM월 dd일"/></td>
								<td>${review.count}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<a href="insertReview.do">		
						<button id="button" type="submit" class="btn btn-success btn-icon-split" style="float: right; margin: 10px 0 0 5px;">글등록</button>
					</a>
					</div>
					<br><br>
					<!-- pagination{s} -->
						<div align="center">
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
						</div>
					<!-- pagination{e} -->
				</div>
			</div>
		</div>

	<br><br><br>
<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>

</html>