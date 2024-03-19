/**
 * 
 */
 
 $(document).ready(function() {
 	
 	let regcomm = /\B(?=(\d{3})+(?!\d))/g;
 	const urlParams = new URL(location.href).searchParams;
 	var codeVal = urlParams.get('code');
 	var totalPrice = 0;
 	let checkInDate = '';
 	let checkOutDate = '';
 	let peoInfo = '';
 	
 	$.ajax({
 		url: 'getJson.do?code=' + codeVal,
 		type: 'post',
 		async: true,
		dataType: 'json',
		contentType: 'application/json; charset=utf-8',
 		success: function(result) {
 			//alert('success: ' + result);
 			$('.infoGroup').remove();
 			let htmlDummy = '';
 			$.each(result, function(index, item) {
 				htmlDummy += '<div class="infoGroup">'
 							+ '<ul class="infoTit">'
 							+ '<li>객실명</li>'
 							+ '<li>이용날짜</li>'
 							+ '<li>예약인원</li>'
 							//+ '<li>요금타입</li>'
 							+ '<li>이용금액</li>'
 							+ '<li>결제금액</li>'
 							+ '</ul>';
 							
 				htmlDummy += '<ul class="infoTxt">'
 							+ '<li class="roomInfo">'
 							+ '<input type="hidden" name="room" value="' + item.idx + '">'
 							+ '<span class="name">' + item.name + '</span>'
 							+ '<span>기준 ' + item.base + '명 /</span>'
 							+ '<span> 최대 ' + item.max + '명</span>'
 							+ '</li>';
 							
 				checkInDate = item.indate;
 				checkOutDate = item.outdate;
 				
 				let date = parseDate(item.indate.toString());
				let toYear = new Date(date).getFullYear();
				let toMonth = ("0" + new Date(date).getMonth() + 2).slice(-2);
				let toDate = ("0" + new Date(date).getDate()).slice(-2);
				let toDay = weekday[new Date(date).getDay()];
 				
 				htmlDummy += '<li class="impor">' + toYear + '-' + toMonth + '-' + toDate + '(' + toDay + ')' + '</li>'
 							+ '<li>성인' + item.adult + ' / 아동' + item.child + ' / 유아' + item.baby + '</li>'
 							//+ '<li>' + '{비수기/성수기/극성수기}' + '/{주중/주말}' + '</li>'
 							+ '<li><div class="price">' + item.price.toString().replace(regcomm, ',') + '원</div></li>'
 							+ '<li class="impor">' + item.price.toString().replace(regcomm, ',') + '원</li>';
 				
 				htmlDummy += '</ul></div>';
 				
 				totalPrice += item.price;
 				
 				peoInfo = item.adult + '/' + item.child + '/' + item.baby;
 			});
 			
 			$('.selRoomInfo').append(htmlDummy);
 			$('.totalPrice strong').text(totalPrice.toString().replace(regcomm, ','));
 			
 			// 옵션 정보 일단 삭제
 			$('.reserOption').remove();
 		},
 		error: function() {
 			alert('error');
 		}
 	});
 	
	let weekday = ['일','월','화','수','목','금','토'];
 	let regex = /[^0-9]/g;
	function parseDate(str) {
		//console.log(str);
		str = str.replace(regex, '');
		var y = str.substr(0, 4);
		var m = str.substr(4, 2);
		var d = str.substr(6, 2);
		return new Date(y, m - 1, d);
	}
	
	function formatDate(str) {
		console.log(str);
		str = str.toString();
		var y = str.substr(0, 4);
		var m = str.substr(4, 2);
		var d = str.substr(6, 2);
		return y + '-' + m + '-' + d;
	}

	/*
 	$("#arrTime").timepicker({
		timeFormat: "HH:mm",
		interval: 60,
		minTime: "15:00",
		maxHour: 20,
		defaultTime: "15",
		startTime: "15:00",
		dynamic: false,
		dropdown: true
	});
 	*/
 	
	// 전체동의
	$(".reserAgree").on("click", "#allAgree", function() {
		if( $(this).prop('checked') ){
            $('.reserAgree input[name=chk]').prop('checked',true);
        }else{
            $('.reserAgree input[name=chk]').prop('checked',false);
        }
	});
	// 개별 선택
	$(".reserAgree").on("click", ".normal", function() {
		
		 $(this).prop('checked', $(this).is(":checked"));
		 
		 var tCnt = 0;
		 $('.normal').each(function() {
		 	if($(this).is(":checked")) tCnt++;
		 	
		 	if(tCnt == 4) 
		 		$('#allAgree').prop('checked', true);
		 	else 
		 		$('#allAgree').prop('checked', false);
		 });		
	});
 	

	$('.commPop .popClose').click(function(){
		$(this).parents('.commPop').hide();
	});
	
	//let elHeight = $('.reserAgree form').height();
	//$('.reserInfoInput').height(elHeight);
  	
  	let selPay = $('.reserInfoInput .payLayer');
	let selPayCard = selPay.find('.cardGroup');
	let selPayDeposit = selPay.find('.depositGroup');
	let selPayDepositInfo = selPay.find('.depositInfo');
	let paymentBtn = selPay.find('.payBtn .payment');
	let selPayDepositPop = selPay.find('.depositCheckPop');
	let selPayDepositPopBtn = selPayDepositPop.find('button');
	let payCheckPop = selPay.find('.payCheckPop');
	let payCheckPopCancel = payCheckPop.find('.cancel');


	 selPayDeposit.click(function(){
		selPayDepositInfo.show();
		selPayDepositPop.fadeIn();
	 });

	 selPayCard.click(function(){
		selPayDepositInfo.hide();
	 });
	 
	 $('.alertForm .checkBtn').click(function() {
			$('.alertForm').hide();
	 });

	
	 paymentBtn.click(function(){
	 	
	 	var chkCnt = $('input[name="chk"]:checked').length;
	 	if (chkCnt != 4) {
			$('.alertForm').show();
			return false;
	 	}
	 	
	 	var data = $('.compulsory input');
	 	
	 	for(var i = 0; i < data.length; i++) {
	 		if(data[i].value == '') {
	 			var elId =  data[i].id;
	 			if(elId == '') {
	 				elId = data[i].name;
	 			}
	 			if(elId == 'name') {
	 				alert('예약자명을 입력해주세요.');
	 				return false;
	 			} 
	 			if(elId == 'birth') {
	 				alert('생년월일을 입력해주세요.');
	 				return false;
	 			} 
				if(elId == 'phone2' || elId == 'phone3') {
	 				alert('연락처를 입력해주세요.');
	 				return false;
	 			}
	 			if(elId == 'email') {
	 				alert('이메일을 입력해주세요.');
	 				return false;
	 			} 
	 		}
	 	}
	 	
		payCheckPop.fadeIn();
	 });
	 
	 selPayDepositPopBtn.click(function(){
		selPayDepositPop.fadeOut();
	 });

	 payCheckPopCancel.click(function(){
		payCheckPop.fadeOut();
	 });
	 
	 $('.payCheck').click(function() {
	 	
		payCheckPop.fadeOut();
	 	
	 	// 이용자 정보
	 	var guest_idx = new Date().getTime().toString();
	 	var guest_name = $('#name').val();
	 	var guest_birth = $('#birth').val();
	 	var guest_phone = $('#contact').val() + '-' + $('input[name="phone2"]').val() + '-' + $('input[name="phone3"]').val();
	 	var guest_ephone = $('#emContact').val() + '-' + $('input[name="emergency_phone2"]').val() + '-' + $('input[name="emergency_phone3"]').val();
	 	var guest_email = $('#email').val();
	 	var guest_time = $('#arriveTime').val();
	 	var guest_request = $('#request').val();
	 	
	 	/*
	 	console.log('guest_idx', guest_idx);
	 	console.log('guest_name', guest_name);
	 	console.log('guest_birth', guest_birth);
	 	console.log('guest_phone', guest_phone);
	 	console.log('guest_ephone', guest_ephone);
	 	console.log('guest_email', guest_email);
	 	console.log('guest_time', guest_time);
	 	console.log('guest_request', guest_request);
	 	*/
	 	
	 	// 예약 정보
	 	var reserTime = new Date();
	 	var reserYear = reserTime.getFullYear();
	 	var reserMonth = ('0' + (reserTime.getMonth() + 1)).slice(-2);
	 	var reserDate = ('0' + reserTime.getDate()).slice(-2);
	 	var reserHours = ('0' + reserTime.getHours()).slice(-2);
	 	var reserMin = ('0' + reserTime.getMinutes()).slice(-2);
	 	var reserSec = ('0' + reserTime.getSeconds()).slice(-2);
	
	 	var reser_idx = reserYear + reserMonth + reserDate + reserHours + reserMin + reserSec;
	 	var reser_start = formatDate(checkInDate);
	 	var reser_end = formatDate(checkOutDate);
	 	var reser_state = '완';
	 	var reser_room = $('input[name="room"]').val();
	 	var reser_room_name = $('.name').text();
	 	var reser_room_price = $('.price').text().replace(regex, '');
	 	console.log($('.price').text().replace(regex, ''));
	 	console.log('reser_idx', reser_idx);
	 	console.log('reser_start', reser_start);
	 	console.log('reser_end', reser_end);
	 	console.log('reser_state', reser_state);
	 	console.log('reser_room', reser_room);
	 	console.log('reser_room_name', reser_room_name);
	 	console.log('reser_room_price', reser_room_price);
	 	console.log('reser_peoInfo', peoInfo);
	 	
	 	// 결제 정보
	 	var pay_type = $('input:radio[name="pay"]:checked').val();
	 	var pay = $('.payLayer .totalPrice strong').text().replace(regex, '');
	 	//alert(pay);
	 	//console.log('pay_type', pay_type);
	 	
	 	if(pay_type == 'card') {
		 	// 결제
		 	var IMP = window.IMP;
			IMP.init("imp74212787");
			
			IMP.request_pay({
				pg: 'html5_inicis',
				pay_method: 'card',
				merchant_uid: new Date().getTime(),
				name: '여기오개 결제',
				amount: pay,
				buyer_email: guest_email,
				buyer_name: guest_name,
				buyer_tel: guest_phone
			}, function(rsp) {
				if(rsp.success) {
					//alert('success');
					var result;
					// 결제 성공시
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID: ' + rsp.imp_uid;
					msg += '상점거래ID: ' + rsp.merchant_uid;
					msg += '결제 금액: ' + rsp.paid_amount;
					msg += '카드승인번호: ' + rsp.apply_num;
					msg += '카드사: ' + rsp.crad_company;
					msg += '카드사2: ' + rsp.cardCompany;
					result = JSON.stringify({
							imp_uid : rsp.imp_uid,
							pay_type: pay_type,
							merchant_uid : rsp.merchant_uid,
							pay_total : rsp.paid_amount,
							pay_apply : rsp.apply_num,				
							
							guest_idx: guest_idx,
							guest_name: guest_name,
							guest_birth: guest_birth,
							guest_phone: guest_phone,
							guest_ephone: guest_ephone,
							guest_email: guest_email,
							guest_time: guest_time,
							guest_request: guest_request,
							
							reser_idx: reser_idx,
							reser_start: reser_start,
							reser_end: reser_end,
							reser_state: reser_state,
							reser_room: reser_room,
							reser_room_name: reser_room_name,
							reser_room_price: reser_room_price,
							reser_peoInfo: peoInfo
							
					})
					//alert(result);
					//alert(msg);
					
					$.ajax({
						type: 'post',
						url: 'completePayment.do',
				 		async: true,
						dataType: 'json',
						contentType: 'application/json; charset=utf-8',
						data: JSON.stringify({	
							imp_uid : rsp.imp_uid,
							pay_type: pay_type,
							merchant_uid : rsp.merchant_uid,
							pay_total : pay,
							pay_apply : rsp.apply_num,
							
							guest_idx: guest_idx,
							guest_name: guest_name,
							guest_birth: guest_birth,
							guest_phone: guest_phone,
							guest_ephone: guest_ephone,
							guest_email: guest_email,
							guest_time: guest_time,
							guest_request: guest_request,
							
							reser_idx: reser_idx,
							reser_start: reser_start,
							reser_end: reser_end,
							reser_state: reser_state,
							reser_room: reser_room,
							reser_room_name: reser_room_name,
							reser_room_price: reser_room_price,
							reser_peoInfo: peoInfo
						}),
						success: function(result) {
							location.href = "reserComplete.do";
						},
						error: function() {
							alert('처리도중 오류가 발생했습니다.');
						}
					});
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용: ' + rsp.error_msg;
				}
				//alert(msg);
			});
		}
	});
	
	
	// ================================== 
});