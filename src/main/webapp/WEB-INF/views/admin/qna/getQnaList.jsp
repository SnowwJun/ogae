<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<c:url var="getQnaList" value="/getQnaList.ado">
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
        var url = "${pageContext.request.contextPath}/getQnaList.ado";
        url = url + "?page=" + page;
        url = url + "&range=" + range;
        location.href = url;
    }

    // 페이지 번호 클릭
    function fn_pagination(page, range, rangeSize) {
       var url = "${pageContext.request.contextPath}/getQnaList.ado";
        url = url + "?page=" + page;
        url = url + "&range=" + range;
        location.href = url;
    }

    // 다음 버튼 이벤트
    function fn_next(page, range, rangeSize) {
        var page = parseInt((range * rangeSize)) + 1;
        var range = parseInt(range) + 1;
        var url = "${pageContext.request.contextPath}/getQnaList.ado";
        url = url + "?page=" + page;
        url = url + "&range=" + range;
        location.href = url;
    }

</script>
<style>
.pagination{
justify-content: center;
}

</style>
<head>
<meta charset="UTF-8">
<title>여기오개</title>
<link rel="stylesheet" type="text/css" href="/resources/css/admin/qna.css">
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
   <h2 class="heading2">문의 관리</h2>
   <br>
   <div class="list-page">
   <br>
   <br>
      <div class="QnaSearch" align="right" style="margin-right: 5px">
         <form action="${path}/getQnaList.ado" method="post">
         <select class="condition_box" name="searchCondition">
            <option value="title">제목</option>
            <option value="content">내용</option>
            <option value="writer">작성자</option>         
         </select>
            <input type="text" class="input_search" name="searchKeyword" placeholder="검색어를 입력하세요.">
          <button type="submit" class="search-button">검색</button>
         </form>
      </div>
  
   <br>
   <table class="centered-table" style="text-align: center;">
      <thead class="tablehead">
         <tr>
            <th width="10%">NO</th>
            <th width="30%" >제목</th>
            <th width="20%">작성자</th>
            <th width="30%">등록일</th>
            <th width="10%">조회수</th>
         </tr>
      </thead>
      <tbody class="tablebody">
         <c:forEach var="qna" items="${QnaList}" varStatus="i">
	         <tr style="border-bottom: 1px solid #000;">
	             <td>${pagination.listCnt-(pagination.startList+i.index)}</td>
	            <td class="list_text" style="text-align: center;"><a href="getQnaViewDetail.ado?qnaIdx=${qna.qnaIdx}">${qna.qnaTitle}</a></td>
	          
	            <td>${qna.qnaWriter}</td>
                <td style="white-space: nowrap;"><fmt:formatDate value="${qna.qnaRegDate}" pattern="yyyy년 MM월 dd일 HH:mm:ss"/></td>
                 <td style="width: 80px;">${qna.qnaCount}</td>
	         </tr>
         </c:forEach>
      </tbody>
   </table>
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
<br><br><br>
	<div id="footer">		
		<%@ include file="../footer.jsp" %>
	</div>

</body>
<br><br><br>
</html>