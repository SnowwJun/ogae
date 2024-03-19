<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여기오개</title>
<link rel="stylesheet" type="text/css" href="/resources/css/admin/facility.css">
<!-- 공지글 삭제 -->
 <script type="text/javascript"> 
 function confirmDelete(facility_idx) {
	    var result = confirm("정말로 삭제하시겠습니까?");
	    if (result) {
	        window.location.href = "deleteFacility.ado?facility_idx=" + facility_idx;
	    } else {
	        // 'No'를 선택한 경우, 아무 작업도 하지 않음
	    }
	}

</script>


</head>

<body id="page-top">
<div id="wrapper">
	<div id="sidebar">	
		<%@ include file="../sidebar.jsp" %>
	
	<div id="topbar">
		<%@ include file="../topbar.jsp" %>
	<div id="content-wraaper" class="d-flex flex-column">
	<div class="list-page">
	
<div class="content">

   <h2 class="heading2">시설 관리</h2>
   <br>
    <div class="list-page">
   <br>
   <br>

   
   <table class="centered-table" style="text-align: center;">
      <thead class="tablehead">
         <tr>
            <th width="15%">NO</th>
            <th width="35%">제목</th>
            <th width="15%">관리자</th>
            <th width="35%">관리
            
            </th>
            
         </tr>
      </thead>
      <tbody class="tablebody">
        <c:forEach var="fac" varStatus="i" items="${getFacList}">
	         <tr style="border-bottom: 1px solid #000;">
	           <td>${pagination.listCnt - i.index +8}</td>
	            <td class="list_text" style="text-align: center;"><a href="getFacViewDetail.ado?facility_idx=${fac.facility_idx}">${fac.facility_name}</a></td>
	         <td class="admin-column">
			    여기오개
			</td>
				         
	         
	         <td>
	         <!-- 수정, 삭제 버튼 -->
   <div style="text-align: center;">
        <a href="updateFacility.ado?facility_idx=${fac.facility_idx}">
            <button type="button" class="btn btn-warning btn-icon-split">수정</button>
        </a>
        <a href="getFacList.ado">
   <button type="button" class="btn btn-danger btn-icon-split" onclick="confirmDelete(${fac.facility_idx})">삭제</button>
		</a>

		 <a href="getFacViewDetail.ado?facility_idx=${fac.facility_idx}">
            <button type="button" class="btn btn-light btn-icon-split">상세보기</button>
            </a>
    </div>
</div>
	         </td>
	         </tr>
         
         </c:forEach>
      </tbody>
      
      
   </table>
  
   <div>
   <div align= "right">
   <a href="insertFacility.ado">
    <!-- ... -->
    <button id="button" type="submit">글등록</button></a>
	 
</div>

  
   </div>
   
   
   
   <div>
	</div>
	</div>
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

</body>
<br><br><br>
</html>