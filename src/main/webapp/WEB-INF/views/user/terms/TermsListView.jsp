<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/resources/css/user/list.css">
<link rel="stylesheet" type="text/css" href="/resources/css/user/listNoticeview.css">
<title>이용 약관</title>
</head>

<body id="page_top">
<%@ include file="../header.jsp" %>
<h1 class="maintitle">TERMS</h1>
	<div>
		<br>
		<br>
		<h3 class="subtitle">이용 약관</h3>
	</div>
	<form action="getTermsView.ado" method="post" enctype="multipart/form-data">
		<input name="no" type="hidden" value="${board.no}" />
		<div class="container-fluid">
			<br>
			<!-- DataTales Example -->
			<div class="card shadow mb-4">
				<div class="card-body">
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
<!-- 						<tr> -->
<!-- 							<th class="title" width="15%">제목</th> -->
<%-- 							<td colspan="2">${terms.terms_title}</td> --%>
<!-- 						</tr> -->
<!-- 						<tr> -->
<!-- 							<th class="writer">작성자</th> -->
<%-- 							<td colspan="2">${terms.terms_writer}</td> --%>
<!-- 						</tr> -->
						 <tr>
					        <td colspan="2">
					            <div style="display: flex; justify-content: space-between;">
					                <div class="title" style="text-align: left;">${terms.terms_title}</div>
					            </div>
					        </td>
					    </tr>
						 <tr>
					        <td colspan="2">
					            </div>
					        </td>
					    </tr>
					</table>
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
						<tr>
<!-- 							<th class="cnt" width="15%">내용</th> -->
							<td colspan="2" >${terms.terms_content}</td>
						</tr>
					</table>
					<br>
					<br>


					<!-- 버튼 -->
					<div align="right">
						<a href="termsList.do">
							<button type="button" class="btn btn-light">목록</button>
						</a> 
					</div>
					<br>
					<br>
				</div>
			</div>
		</div>
	</form>
	<br />
<%@ include file="../footer.jsp" %>
</body>
</html>