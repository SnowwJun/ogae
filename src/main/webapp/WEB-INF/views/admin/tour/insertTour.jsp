<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="/resources/css/common.css" />
<link rel="stylesheet" href="./resources/css/admin/insertlist.css">
<title>여기오개</title>
<script type ="text/javascript">
function check() { 
	//form 의 요소를 가지고 올 때에는 form의 이름을 사용하여 가져와야 한다
 	var title = document.create.title;
    var name = document.create.name;
    var text = document.create.text;
    
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
    } else {
        alert("글이 등록됩니다!");
        return true;
    }
	document.getElementById("insert").submit();	
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
			
	<%-- <%@ include file="../header.jsp" %> --%>
	<h1> 여행지 등록</h1>

	<div class="card">
		<div class="card-header1">
			<!-- 게시판을 누를시 첫 페이지인 index.html로 이동 -->
			<h1>
				<!-- 				<a href="./getBoard.jsp">게시판</a> -->
			</h1>
		</div>
		
		<h2 style="text-align: right; font-size: 12px;"> <span class="t_red">* 표시는 필수입력 항목입니다.</span>
		</h2>
		<div class="card-write">
		<form action="insertTour.ado" id="insert" method="post">
		
				<div class="myinfo">
					
			
<!-- 					password만 입력하기 위해 input에서 type="password" 지정 -->
<!--  					<label for="notice_password">비밀번호<span class="t_red">*</span></label> -->
<!--                     	<input type="password" id="notice_password" name="notice_password" placeholder="비밀번호를 입력하세요"> -->
				</div>
				
				<div class="title-w">
					 <!-- 제목 입력란 -->
					<label for="tour_title">제목<span class="t_red">*</span></label>
					 <input type="text" id="tour_title" name="tour_title" placeholder="제목을 입력하세요">
				</div>
				<div class="msg">
					<!-- 내용입력란 -->
 					<label for="tour_content">내용<span class="t_red">*</span></label>
					
					<!-- 내용을 입력하기 위해 textarea tag를 이용 -->
					<textarea id="tour_content" name="tour_content" placeholder="내용을 입력하세요"></textarea>
					
					<div class="title-w">
					 <!--경도 -->
					<label for="tour_addr1">주소<span class="t_red">*</span></label>
					 <input type="text" id="tour_addr1" name="tour_addr1" placeholder="주소를 입력하세요">
				</div>
					
					<div class="msg">
					 <!--경도 -->
					<label for="tour_mapx">경도<span class="t_red">*</span></label>
					 <input type="text" id="tour_mapx" name="tour_mapx" placeholder="경도를 입력하세요">
				</div>
				
				<div class="title-w">
					 <!-- 위도 -->
					<label for="tour_mapy">위도<span class="t_red">*</span></label>
					 <input type="text" id="tour_mapy" name="tour_mapy" placeholder="위도를 입력하세요">
				</div>
					
					<input type="file" name="" id="">
				</div>
			<table style="float:right;">
			
			</table>
		</div>
		
		<div class="btn-w">
  			<!-- 작성 버튼 -->
<!--   			<form action="insertTour.ado" method="post"> -->
        		<input type="submit" value="작성" onclick="return check()">
    		</form>
    		<a href="TourList.ado">
				<button type="button" class="">취소</button>
         </div>
		</form>
	</div>
</div>
	</div>
</div>
	<div id="footer">		
		<%@ include file="../footer.jsp" %>
	</div>



	
</body>
<%-- <%@ include file="../footer.jsp" %> --%>
</html>