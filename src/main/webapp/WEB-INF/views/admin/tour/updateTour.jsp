<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="/resources/css/common.css" />
<link rel="stylesheet" href="./resources/css/admin/admin_getFac.css">
<title>여기오개</title>

<script type ="text/javascript">
	function check() { 
		//form 의 요소를 가지고 올 때에는 form의 이름을 사용하여 가져와야 한다
		var tour_title = document.getElementById("tour_title").vaule;
		var tour_content = document.getElementById("tour_content").vaule;
		var text = document.create.text;
		if (title.value == "") { 
			alert("제목을 입력해주세요.");
			title .focus();
			return false;
		} else if (text.value == "") {
			alert ("내용을 입력해주세요.");
			text .focus();
			return false;
		}
		 alert ("글이 등록됩니다!");
		 document.getElementById("updateForm").submit();
	}
</script>

</head>
<body id="page-top">
	<div id="wrapper">
		<div id="sidebar">
			<%@ include file="../sidebar.jsp"%>
		</div>
		<div id="topbar">
			<%@ include file="../topbar.jsp"%>
			<div id="content-wraaper" class="d-flex flex-column" >
				<form action="updateTour.ado" id="updateForm" method="post">
					<input type="hidden" name="tour_idx" value="${tour.tour_idx}">		
					<div class="list-page">
				<div class="container-fluid">
<!-- 				Page Heading -->
				 <h1 class="h3 mb-2 text-gray-800" style="margin: 100px 0 0 280px;">여행지 관리</h1>
         		<br>
					<div class="card shadow mb-4">
					<div class="card-header py-3" >
						<h6 class="m-0 font-weight-bold text-primary">Tour</h6>
					</div>
					<div class="card-body">
						<form action="updateFacility.ado" method="post" enctype="multipart/form-data">
							<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
								<tr>
								<th class="tour_title" width="15%">여행지명</th>
							
								<td><input type="text" id="tour_title" name="tour_title" placeholder="여행지명을 입력하세요" class="input-box" value="${tour.tour_title}"></td>
							</tr>
							</table>
							</div>
							<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
							<tr>
									<th class="content" colspan="4" style="text-align: center; background-color: #f2f2f2;">여행지 설명</th>
								</tr>
								<tr>
									<td colspan="4">
										<textarea id="tour_content" name="tour_content" class="input-box" style="text-align: center;" >${tour.tour_content}</textarea>
								
								</tr>
								</table>
								
							
						<div align="right">
								<button type="submit" class="btn btn-success btn-icon-split">등록</button>
								<a href="getFacList.ado">
									<button type="button" class="btn btn-light btn-icon-split" style="margin-right:20px">취소</button>
								</a>
							</div>
							<br><br><br><br><br><br><br><br><br>
						</div>
						</div>
					</div>
				</form>
				</form>
			</div>
			
	
	<div id="footer">
		<%@ include file="../footer.jsp"%>
	</div>

	<script src="/resources/js/notice/insertupdateTour.js"></script>
</body>
<%-- <%@ include file="../footer.jsp" %> --%>
</html>