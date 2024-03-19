<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약확인</title>
<link rel="stylesheet" href="resources/calendar/css/calendar.css">
<link rel="stylesheet" href="resources/calendar/css/reserCalendar.css">
<link rel="stylesheet" href="resources/calendar/css/reset.css">
</head>
<body>
<div class="reserCheck">
	<h3>예약 확인 및 취소</h3>
	<form action="#" method="post">
		<fieldset>
			<legend>예약 확인 및 취소</legend>
			<table>
				<caption>예약 확인 및 취소</caption>
				<colgroup>
					<col style="width: 22%;">
					<col style="width: 78%;">
				</colgroup>
				<tbody>
					<tr>
						<th scope="row"><label for="name">예약자명</label></th>
						<td><input type="text" id="name" placeholder="예약자명 입력"></td>
					</tr>
					<tr class="contact">
						<th scope="row"><label for="contact">연락처</label></th>
						<td>
							<select id="contact">
								<option value="010" selected>010</option>
									<option value="011">011</option>
									<option value="016">016</option>
									<option value="017">017</option>
									<option value="018">018</option>
									<option value="019">019</option>
							</select> - 
							<input type="text"> - 
							<input type="text">
						</td>
					</tr>
					<tr>
						<th scope="row"><label for="name">예약번호</label></th>
						<td>
							<input type="text" id="name" placeholder="예약시 휴대폰으로 발송된 예약번호를 입력">
						</td>
					</tr>
					<tr>
						<th></th>
						<td><button type="button">예약조회</button></td>
					</tr>
				</tbody>
			</table>
		</fieldset>
	</form>
</div>
<script>
const vueApp =  new Vue({
el: '#container',
name:'',
data: {
	user_name:'',
	phone1: '',
	phone2: '',
	phone3: '',
	order_code:'',
	errors: [],
	accessToken:null,
},
methods: {

	checkReservation() {
	
		if (this.user_name=="")  {
			alert('예약자명을 입력해주세요.')
			return false
	    }
	                   if ((this.phone1=="")||(this.phone2=="")||(this.phone3==""))  {
			alert('휴대번호를 입력해주세요.')
			return false
	    }
		if (this.order_code=="")  {
			alert('예약번호를 입력해주세요.')
			return false
	    }
	    let phone = this.phone1+'-'+this.phone2+'-'+this.phone3		  
	
	                   let url='/cms/ltr/api/userCheckReservationData.php';
		let fileData = new FormData();
	
		fileData.append("user_name", this.user_name);
		fileData.append("phone",phone);
		fileData.append("order_code", this.order_code);
	
		let config = { headers: {'Content-Type': 'multipart/form-data'}};
	
		axios.post(url, fileData, config)
			.then(function(response){
	
			   alert(response.data.msg);
			   if (response.data.code==1) {
	                              location.href='payCheck.php?sess_code='+response.data.data;
			   } else {
			   }
	
			})
			.catch(function(error){
				 console.log(error);
		});
	},

  }, // end -method
});
</script>
</body>
</html>