<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="/resources/css/user/insert.css">
<!-- <link href="/resources/css/admin/sb-admin-2.css" rel="stylesheet" /> -->

<title>여기오개</title>
<style>
h2 {
	font-size: 15px;
	text-align: right;
}

}
/* <style>h2 { */
/* 	font-size: 15px; */
/* 	text-align: right; */
/* } */
</style>

<script type="text/javascript">
	function check() {
		var title = document.getElementById("title").value;
		var name = document.getElementById("name").value;
		var password = document.getElementById("password").value;
		var content = document.getElementById("content").value;

		if (title.value == "") {
			alert("제목을 입력해주세요.");
			return false;
		} else if (name.value == "") {
			alert("이름을 입력해주세요.");
			return false;
		} else if (password.value == "") {
			alert("비밀번호를 입력해주세요.");
			return false;
		} else if (content.value == "") {
			alert("내용을 입력해주세요.");
			return false;
		}
		
		alert("글이 등록됩니다!");
		//return true;
		document.getElementById("insert").submit();
		
// 		// QNAList 페이지로 이동
//         window.location.href = "/QNAList.do"; // 목표 URL로 변경

//         return true;
		
		  
		
	}
</script>
</head>
<body>
<%@ include file="../header.jsp" %>
<div class="main-wrap main-swiper">
<div class="main-img">


</div>

<div class="text-wrap">
<h2>Q&A</h2>
</div>
</div>
<div class="container-fluid" style="margin-top: 100px;">


		<div class="card-header1">
			
        <br>
		<!-- DataTales Example -->
         <div class="card shadow mb-4">
            <div class="card-header py-3">
               <h6 class="m-0 font-weight-bold text-primary">문의하기</h6>
                </div>
                
			<div style="text-align: right; margin-right: 20px;">
			<span class="t_red">* 표시는 필수입력 항목입니다.</span>
			</div>
		
	  <!-- 작성 버튼 -->
      <form action="/insertQna.do" method="post" id="insert">
<!-- 			<div class="card-body"> -->
   <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0" style="text-align: left; margin-right: 200px">
				 <tr>
				 <td width="50%">
				<span class="t_red">* </span>제목
				<div class="title">
				<input type="text" id="title" placeholder="제목을 입력하세요." name="qnaTitle"  style="width: 30%; margin-left: 20px" required>
			</div>
			</td>
			</tr>
			<tr>
              <td>
				<div class="secret">
				<span class="t_red">* </span>비밀글 여부&nbsp;&nbsp;
            <input type="checkbox" id="secret_checkbox" name="secret" value="true" style="width: 15px; height: 15px"></div>
            </td>
				 
               </tr>
               <tr>
				<td>
                  <span class="t_red">* </span>비밀번호
                   <div class="pass">
                  <input type="password" id="password" placeholder="비밀번호를 입력하세요." name="qnaPass" style="width: 30%; margin-left: 20px">
			</div>
                  </td>
                   </tr>
                   <tr>
				 <td>
                  <span class="t_red">* </span>이름
                    <div class="writer">
				<input type="text" id="name" placeholder="이름을 입력하세요." name="qnaWriter"  style="width: 30%; margin-left: 20px"> 
				</div>
                  </td>
               </tr>
               <tr>
                 
			   
                  <td colspan="2">
                  <span class="t_red">* </span>내용
                  <div class="content">
			
				<textarea id="content" placeholder="내용을 입력하세요." name="qnaContent"rows="10" oninput='this.style.height = ""; this.style.height = this.scrollHeight + "px"'
                     style="resize: none; width: 67%; margin-left: 20px; max-height: 300px;"></textarea>
						</div>
                  </td>
               </tr>
            </table>
		 <div align="right">
              <a input type="submit" value="등록" onclick="return check()" class="btn btn-warning btn-icon-split">등록</a>
             
		 <a href="getQnaList.do"><button type="button" class="btn btn-light btn-icon-split" style=margin-right:40px>취소</button></a>
	
		
	</form>
		</div>
		<br>
		</div>
		</div>
	
 </div>
 
 
<%@ include file="../footer.jsp" %>
</body>
</html>