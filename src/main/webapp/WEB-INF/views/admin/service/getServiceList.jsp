<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기오개</title>
<link rel="stylesheet" type="text/css" href="/resources/css/admin/facility.css">
<script type="text/javascript"> 
function confirmServiceDelete(serviceIdx) {
    var result = confirm("정말로 삭제하시겠습니까?");
    if (result) {
        // '예'를 선택한 경우, 삭제를 실행할 URL로 리다이렉트
        console.log("삭제가 진행됩니다.");
        window.location.href = "deleteService.ado?service_idx=" + serviceIdx;
    } else {
        // '아니오'를 선택한 경우, 아무 작업도 하지 않음
        console.log("삭제가 취소되었습니다.");
    }
}
</script>


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
	
	 <h2 class="heading2">서비스 관리</h2>
	<br>
    <div class="list-page">
   <br>
   

	<table class="centered-table"style="text-align: center;">
		<thead class="tablehead">
			<tr>
			<th width="15%">NO</th>
            <th width="35%">제목</th>
            <th width="15%">관리자</th>
            <th width="35%">관리
			</tr>
		</thead>
		<tbody class="tablebody" style="text-align: center;">
			<!-- 데이터 행 -->
			<c:forEach var="service" items="${serviceList}">
			<tr style="border-bottom: 1px solid #000;">
			 

			   
			        <td>${service.service_idx}</td>
			        <td class="list_text"><a href="getServiceView.ado?service_idx=${service.service_idx}">${service.service_name}</a></td>
			        <td>여기오개</td>
			       <td>
	         <!-- 수정, 삭제 버튼 -->
			   <div style="text-align: center;">
			       		<a href="updateServiceBoard.ado?service_idx=${service.service_idx}">
			            <button type="button" class="btn btn-warning btn-icon-split">수정</button>
			          	</a>
			   <button type="button" class="btn btn-danger btn-icon-split" onclick="confirmServiceDelete(${service.service_idx})">삭제</button>
			
					 <a href="getServiceView.ado?service_idx=${service.service_idx}">
			            <button type="button" class="btn btn-light btn-icon-split">상세보기</button>
			            </a>
			    </div>
			</div>
	         </td>
			    
			    </tr>
			</c:forEach>
		</tbody>
	</table>
	
	
	<div align= "right">
		<a href="insertServiceBoard.ado">
			<button id="button">글등록</button>
		</a>
	</div>
	
	<br>

	</div>
	</div>
	</div>
</div>
<br><br><br><br><br><br><br><br><br><br>
	<div id="footer">		
		<%@ include file="../footer.jsp" %>
	</div>

</body>
<br><br><br>
</html>