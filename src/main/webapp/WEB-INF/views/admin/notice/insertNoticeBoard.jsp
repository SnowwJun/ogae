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
<script type="text/javascript">
function check() { 
	alert("발행메세지");
	//form 의 요소를 가지고 올 때에는 form의 이름을 사용하여 가져와야 한다
 	var title = document.create.notice_title;
	alert("제목: "+ title.value);
	
    var name = document.create.notice_writer;
    alert("작성자: " + name.value);
    
    var text = document.create.notice_content;
    alert("내용: " + text.value);
    
    if (title.value == "") {
        alert("제목을 입력해주세요.");
        title.focus();
        return false;
    } else if (name.value == "") {
        alert("이름을 입력해주세요.");
        name.focus();
        return false;
    } else if (text.value == "") {
        alert("내용을 입력해주세요.");
        text.focus();
        return false;  	
    } else{	
        alert("글이 등록됩니다!");
        return true;
    }
	document.getElementById("insert").submit();	
	return true;
}
</script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
  $(document).ready(function(){
// 	function tempSave(){
	  alert("임시저장 버튼");
	  $("#submitButton").click(function(){
	
		  // 체크박스의 값 가져오기
	      var checkboxValue = $(".temp-save").val();
		  alert("체크여부": + submitButton);
	
	var title = document.create.notice_title;
	alert("제목: "+ title.value);
	
    var name = document.create.notice_writer;
    alert("작성자: " + name.value);
    
    var text = document.create.notice_content;
    alert("내용: " + text.value);
    console.log("전송할 데이터:", { title, writer: name, content: text, notice_condition: true });

    $.ajax({
        type: "POST",
        url: "/saveTempNotice.ado",
		data: { notice_condition: checkboxValue },
        success: function(response){
            // 서버에서 응답을 받으면 추가 동작 수행
            console.log("서버응답: ", response);
        },
        error: function(error){
            console.error("에러발생: ", error);
        }
    });
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
			<div id="content-wraaper" class="d-flex flex-column">
				<div class="list-page">

					<!-- Page Heading -->
					<div class="container-fluid">

						<h1 class="h3 mb-2 text-gray-800" style="margin: 100px 0 0 280px;">공지 사항 등록</h1>
						<br> <br>
						<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">NOTICE</h6>
							</div>
							<div class="card-body">
								<form action="insertNotice.ado" name="create" id="insert"
									method="post">
									<div class="myinfo">

										<table class="table table-bordered" id="dataTable"
											width="100%" cellspacing="0">
											<tr>
												<th class="title" width="15%">제목</th>
												<td><input type="text" id="notice_title" class="input-box" name="notice_title" placeholder="제목을 입력하세요"></td>
											</tr>

											<tr>
												<th class="title" width="15%">작성자</th>
												<td><input type="text" name="notice_writer" class="input-box" placeholder="이름을 입력하세요."></td>
											</tr>
										</table>
										<br />

										<table class="table table-bordered" id="dataTable"
											width="100%" cellspacing="0">
											<tr>
												<th class="content" colspan="4"
													style="text-align: center; background-color: #f2f2f2;">내용</th>
											</tr>
											<tr>
												<td colspan="4">
													<textarea id="notice_content" class="input-box" name="notice_content" placeholder="내용을 입력하세요" style="text-align: center;"></textarea>
												</td>

											</tr>
										</table>

									</div>

									<!-- 작성 버튼 -->
									<div align="right">
										<!-- 임시저장 -->
										<input type="checkbox" class="temp-save" name="notice_condition" style="float: left; margin: 17px 10px 0 0;"
												value="true" data-target="notice_condition">
										<button id="submitButton" class="temp-save">임시저장</button>
										
										<button type="submit" class="btn btn-success btn-icon-split"
											onclick="return check()">등록</button>

										<a href="getNoticeList.ado">
											<button type="button" class="btn btn-light btn-icon-split">취소</button>
										</a>
									</div>

									<br> <br>
								</form>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="footer">
			<%@ include file="../footer.jsp"%>
		</div>
	
		<script src="/resources/js/notice/insertNotice.js"></script>
	</div>
</body>
</html>