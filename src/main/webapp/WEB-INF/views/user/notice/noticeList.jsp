<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:url var="getNoticeList" value="/noticeList.do">
	<c:param name="page" value="${pagination.page}" />
	<c:param name="range" value="${pagination.range}" />
</c:url>
<!DOCTYPE html>
<html>
<!-- 게시글 조회수 체크 jQuery(11.15추가) -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- 12.02추가) -->
<script>
	// 이전 버튼 이벤트
	function fn_prev(page, range, rangeSize) {
		var page = ((range - 2) * rangeSize) + 1;
		var range = range - 1;
		var url = "${pageContext.request.contextPath}/noticeList.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}

	// 페이지 번호 클릭
	function fn_pagination(page, range, rangeSize) {
		var url = "${pageContext.request.contextPath}/noticeList.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}

	// 다음 버튼 이벤트
	function fn_next(page, range, rangeSize) {
		var page = parseInt((range * rangeSize)) + 1;
		var range = parseInt(range) + 1;
		var url = "${pageContext.request.contextPath}/noticeList.do";
		url = url + "?page=" + page;
		url = url + "&range=" + range;
		location.href = url;
	}
</script>
<head>
<meta charset="UTF-8">
<title>여기오개</title>
<link rel="stylesheet" type="text/css" href="/resources/css/user/listPage.css">
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
<h2>NOTICE</h2>
</div>
</div>
 
 
   <div class="container-fluid" style="margin-top: 100px;">

		<!-- Page Heading -->
		
		<!-- DataTales Example -->
      <div class="card shadow mb-4">
         <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">NOTICE</h6>
         </div>
		
	
		<div class="card-body">
			<br>
			 <div class="table-responsive">
                  
                  <div class="revSearch" align="right" style="margin-right: 5px">
                  <form action="${path}/noticeList.do" method="post" style="display: flex; align-items: center; justify-content: flex-end;">
                  <select class="condition_box" name="searchCondition">
                     <option value="title">제목</option>
                     <option value="content">내용</option>
                     <option value="titleAndContent">제목 + 내용</option>         
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
						<th width="60%">제목</th>
						<th width="10%">작성자</th>
						<th width="15%">등록일</th>
						<th style="width:8%;">조회수</th>
					</tr>
				</thead>
				
				<tbody class="center" style="text-align: center;">
					<!-- 데이터 행 -->
					<c:forEach var="notice" items="${userNoticeList}" varStatus="i">
						<!-- 1130 추가 -->
						<c:if test="${notice.notice_condition eq false }">
							<tr>
								<td>${notice.notice_idx}</td>
								<td class="list_text">
									<!-- 조회수 카운트(11.15 추가) --> <a
									href="noticeListView.do?notice_idx=${notice.notice_idx}"
									onclick="increaseAndViewCount(${notice.notice_idx})">${notice.notice_title}</a>
								</td>
								<td>${notice.notice_writer}</td>
								<td><fmt:formatDate value="${notice.notice_regdate}"
										pattern="yyyy년 MM월 dd일" /></td>
								<%-- 			        <td>${notice.notice_regdate}</td> --%>
								<td>${notice.notice_count}</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>

			<!-- 조회수 카운트 동적함수(11.15 추가) -->
			<script>
       		 function increaseAndViewCount(noticeIdx) {
            // AJAX를 사용하여 서버에 조회수 증가 요청
            $.ajax({
                type: "POST",
                url: "increaseAndViewCount.do", // 실제 서버 요청을 처리하는 URL로 변경
                data: { noticeIdx: noticeIdx },
                success: function (response) {
                    // 서버에서 응답을 받으면 페이지 이동
                    window.location.href = "noticeListView.do?notice_idx=" + noticeIdx;
                },
                error: function (error) {
                    console.error("Error during count increase:", error);
                    // 에러가 발생하면 그냥 페이지 이동
                    window.location.href = "noticeListView.do?notice_idx=" + noticeIdx;
                }
            });
            // 페이지 이동이 바로 일어나지 않도록 false 반환
            return false;
        }
    </script>
			
			<br>
			  <!-- pagination{s} -->
			  <div align="center">
			<div class="pagenationBox">
				<ul class="pagination">
					<c:if test="${pagination.prev}">
						<li class="page-item"><a class="page-link" href="#"
							onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a>
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
<br><br><br>
<%@ include file="/WEB-INF/views/user/footer.jsp"%>
</body>

</html>