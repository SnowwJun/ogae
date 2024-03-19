<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/resources/css/user/listPage.css">
<title>공지사항</title>
</head>

<body id="page_top">
	<%@ include file="../header.jsp"%>

 
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
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">

					<tr>
						<th class="title" width="15%">제목</th>
						<td colspan="2">${notice.notice_title}</td>
					</tr>

					<tr>
						<th class="writer">작성자</th>
						<td colspan="2">${notice.notice_writer}</td>
					</tr>

					<tr>
						<th class="regDate">작성일</th>
						<td colspan="2">
							<fmt:formatDate value="${notice.notice_regdate}" pattern="yyyy년 MM월 dd일 EEEE" /></td>
					</tr>
				</table>
				<br />
				
				<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
					<tr>
						<th class="content">내용</th>
					</tr>
					<tr>
						<td style="white-space: pre-line;">${notice.notice_content}</td>
					</tr>

				</table>
				<br>

				<!-- 버튼 -->
				<div align="right">
					<a href="noticeList.do">
						<button type="button" class="btn btn-light">목록</button>
					</a>
				</div>
				<br> <br>
			</div>
		</div>
	</div>
	<br />
	<%@ include file="../footer.jsp"%>
</body>
</html>