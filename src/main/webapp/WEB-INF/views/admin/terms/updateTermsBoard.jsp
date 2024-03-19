<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="/resources/css/common.css" />
<link rel="stylesheet" href="./resources/css/admin/admin_roomview.css">
<title>여기오개</title>

<script type ="text/javascript">
	function check() { 
		//form 의 요소를 가지고 올 때에는 form의 이름을 사용하여 가져와야 한다
		var terms_title = document.getElementById("terms_title").value;
		var terms_content = document.getElementById("terms_content").value;
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


	function necessaryType(){
		//선택한 값 가져오기(select 박스값)
		var selectedNecesaryType = document.getElementById("necessaryTypeSelect").value;

        console.log(selectedNecesaryType);
	}
</script>
</script>


</head>
<body id="page-top">
	<div id="wrapper">
		<div id="sidebar">
			<%@ include file="../sidebar.jsp"%>
		</div>
		<div id="topbar">
			<%@ include file="../topbar.jsp"%>
			<div id="content-wraaper" class="d-flex flex-column">
			
			<div class="list-page">

					<!-- Page Heading -->
					<div class="container-fluid">

						<h1 class="h3 mb-2 text-gray-800" style="margin: 100px 0 0 280px;">공지 사항 수정</h1>
						<br> <br>
						<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">Terms</h6>
							</div>
							<div class="card-body">
			
				<form action="updateTermsBoard.ado" id="updateForm" method="post">
				<input type="hidden" name="terms_idx" value="${terms.terms_idx}">
				<div class="myinfo">
			
			
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
											<tr>
												<th class="title" width="15%">제목</th>
												<td><input type="text" id="terms_title" class="input-box" name="terms_title" value="${terms.terms_title}"></td>
												
												<th class="title" width="15%">필수여부</th>
								                    <td colspan="1" style="width: 20%;">
								                        <select id="necessaryTypeSelect" name="terms_necessary" onchange="necessaryType()" class="input-box" style="width: 80%; border: 1px solid #dddddd;">
								                            <option value="true">필수</option>
								                            <option value="false">선택</option>
								                 </select>
                    </td>
											</tr>	
			</table>
			
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
											<tr>
												<th class="content" colspan="4"
													style="text-align: center; background-color: #f2f2f2;">내용</th>
											</tr>
											<tr>
												<td colspan="4">
													<textarea id="terms_content" class="input-box" name="terms_content"  style="text-align: center;">${terms.terms_content}</textarea>
													</td>
												</tr>
												</table>	
								</div>				
								
								<div align="right">	
									<input type="submit" class="btn btn-success btn-icon-split" value="수정등록">
									<a href="getTermsList.ado">
											<button type="button" class="btn btn-light btn-icon-split">취소</button>
									</a>
								</div>
								
									<br><br>
								</form>
							
							
							</div>
							
			</div>
		</div>
	</div>
	<div id="footer">
		<%@ include file="../footer.jsp"%>
	</div>
	
	<script src="/resources/js/terms/insertTerms.js"></script>
	
</body>
</html>