//==================================
$(document).ready(function() {
	let regex = /[^0-9]/g;
 	let regcomm = /\B(?=(\d{3})+(?!\d))/g;
	let weekday = ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'];	
	let checkInDate = '';
	let checkOutDate = '';
	let diff = 0;
	let selRoomId = '';
	
	var valUrl = $(location).attr('href').split('?');
	if(valUrl.length == 1) {
		location.href = 'reserCalender.do';
	}
	var valParam = valUrl[1].split('&');
	$.ajax({
		url: valUrl[0],
		type: 'get',
		async: true,
		dataType: 'json',
		contentType: 'application/json; charset=utf-8',
		data: {	param : valUrl[1] },
		success: function(result) {		
			var valDate = valParam[0].split('=');
			var valIn = valDate[1].split('-');
			var inDate = new Date(valDate[1]);			
			var outDate = new Date(inDate.getFullYear(), inDate.getMonth(), inDate.getDate()+1);
			var valRoom = valParam[1].split('=');
			selRoomId = valRoom[1];
			
			checkInDate = inDate.toLocaleDateString().replace(/\./g, '').replace(/\s/g, '-');
			var tmpDate = checkInDate.split('-');
			checkInDate = tmpDate[0] + '-' + ("0" + tmpDate[1]).slice(-2) + '-' + ("0" + tmpDate[2]).slice(-2);
			
			checkOutDate = outDate.toLocaleDateString().replace(/\./g, '').replace(/\s/g, '-');
			tmpDate = checkOutDate.split('-');
			checkOutDate = tmpDate[0] + '-' + ("0" + tmpDate[1]).slice(-2) + '-' + ("0" + tmpDate[2]).slice(-2);
			
			$('.checkInDate').text(checkInDate + ' ' + weekday[new Date(inDate).getDay()]);
			$('.checkOutDate').text(checkOutDate + ' ' + weekday[new Date(outDate).getDay()]);
			
			diff = Math.abs(outDate.getTime() - inDate.getTime());
			diff = Math.ceil(diff / (1000 * 60 * 60 * 24));
			$('.selPeriod span').text('(' + diff +'박 선택)');
			
			$('.roomList li').remove();
			
			for(var room of result.room) {
				let htmlDummy = '';
				// 객실 이미지 정보 추가
				htmlDummy += '<li><div class="roomImgLayer">'
							+ '<div class="roomImg">'
							+ '<img src="' + room.room_img + '" alt="객실이미지">'
							+ '<span class="more">+</span>'
							+ '</div></div>';
				// 객실 정보 추가
				htmlDummy += '<div class="roomInfo">';
				
				htmlDummy += '<input type="hidden" name="roomId" id="roomId" value="' + room.room_idx + '">';
				
				let tempDummy = '<span class="possIcon icon"></span>';
				let buttonDummy = '<button type="button" id="btn' + room.room_idx + '" class="pcBtn reserBtn">선택하기</button>'
								+ '<button type="button" id="btn' + room.room_idx + '" class="mbBtn reserBtn">선택하기</button>';
				if(result.list.length > 0) {
					for(var list of result.list) {
						if(room.room_idx == list.room_idx) {
							// 객실 예약가능 여부 확인				
							if(list.reserve_state == '완') {
								tempDummy = '<span class="succIcon icon"></span>';
								buttonDummy = '<button disabled="disabled" type="button" id="btn' + room.room_idx + '" class="pcBtn reserBtn">선택하기</button>'
											+ '<button disabled="disabled" type="button" id="btn' + room.room_idx + '" class="mbBtn reserBtn">선택하기</button>';
								break;
							}	
						}		
					}
				} 
				
				htmlDummy += tempDummy;
				
				htmlDummy += '<span class="roomName">' + room.room_name + '</span>';
				htmlDummy += '<span class="roomPeople">기준인원 2명 /'
							+ '<span> 최대인원 ' + room.room_person + '명</span></span>'
							+ '<span class="roomSize"><span>' + room.room_category + '</span>'
							+ '<span>' + room.room_size + '평형</span></div>';
				
				htmlDummy += '<div class="roomPeo">'
							+ '<div class="commNum peopleNum">'
							+ '<span class="peoAge">성인</span>'
							+ '<div class="numBtn">'
							+ '<input type="hidden" id="addprice" value="30000">'
							+ '<button type="button" id="adult-' + room.room_idx + '" value="-" data-field="quantity" class="button minus">'
							+ '<img src="resources/calendar/img/minus.jpg" alt="-"></button>'
							+ '<span class="number"><input type="text" step="1" id="adult-value-' + room.room_idx + '" max name="quantity" value="0" class="quantity-field adult"></span>'
							+ '<button type="button" id="adult-' + room.room_idx + '" value="+" data-field="quantity" class="button plus">'
							+ '<img src="resources/calendar/img/plus.jpg" alt="+"></button>'
							+ '</div></div>';
				htmlDummy += '<div class="commNum peopleNum">'
							+ '<span class="peoAge">아동</span>'
							+ '<div class="numBtn">'
 							+ '<input type="hidden" id="addprice" value="30000">'
							+ '<button type="button" id="child-' + room.room_idx + '" value="-" data-field="quantity" class="button minus">'
							+ '<img src="resources/calendar/img/minus.jpg" alt="-"></button>'
							+ '<span class="number"><input type="text" step="1" id="child-value-' + room.room_idx + '" max name="quantity" value="0" class="quantity-field child"></span>'
							+ '<button type="button" id="child-' + room.room_idx + '" value="+" data-field="quantity" class="button plus">'
							+ '<img src="resources/calendar/img/plus.jpg" alt="+"></button>'
							+ '</div></div>';
				htmlDummy += '<div class="commNum peopleNum">'
							+ '<span class="peoAge">유아</span>'
							+ '<div class="numBtn">'
 							+ '<input type="hidden" id="addprice" value="20000">'
							+ '<button type="button" id="baby-' + room.room_idx + '" value="-" data-field="quantity" class="button minus">'
							+ '<img src="resources/calendar/img/minus.jpg" alt="-"></button>'
							+ '<span class="number"><input type="text" step="1" id="baby-value-' + room.room_idx + '" max name="quantity" value="0" class="quantity-field baby"></span>'
							+ '<button type="button" id="baby-' + room.room_idx + '" value="+" data-field="quantity" class="button plus">'
							+ '<img src="resources/calendar/img/plus.jpg" alt="+"></button>'
							+ '</div></div>'
							+ '</div>';
				htmlDummy += '<div class="roomPrice commPrice">'
							+ buttonDummy
							+ '<span class="price"><strong class="sel">' + room.room_price.toString().replace(regcomm, ',') + '</strong>원'
							+ '</span></div></li>';
			
				$('.roomList').append(htmlDummy);		
				
				/*
				if($('#btn' + room.room_idx).attr('disabled') == 'disabled') {
					$('.roomPeo').find('div, span, input, button').prop('disabled', true);
				} else {
					$('.roomPeo').find('div, span, input, button').prop('disabled', false);
				}
				*/
			}
			
			$('[id^="adult-value-"]').val('2');
			
			$('#btn'+ valRoom[1]).click();
			
			// 옵션 항목 일단 삭제
			$('.optionChoice').remove();
			
		},
		error: function() {
			alert('error');
		}
	});
	
	$(document).on('click', '.plus', function() {
		let count = $(this).siblings('.number').find('input');
		count1 = count.val() ? parseInt(count.val()) : '';
		count1+=1; 
		count.val(count1); 
		$('.totalPrice .price strong').text(calcTotal($(this).siblings().find('.addprice').val(), '+').toString().replace(regcomm, ','));
	});
	
	$(document).on('click', '.minus', function() {
		let count = $(this).siblings('.number').find('input');
		count1 = count.val() < 1 ? 0 : count1-=1;
		//count1-=1; 
		//count1 < 1 ? count = 0 : count--;
		count.val(count1); ; 
		$('.totalPrice .price strong').text(calcTotal($(this).siblings().find('.addprice').val(), '-').toString().replace(regcomm, ','));
	});
	
	$(document).on('click', '.reserBtn', function() {
		
		if($(this).hasClass('reserBtnOn')) {
			$(this).removeClass('reserBtnOn');
			if($(this).parent().attr('class').indexOf('roomPrice') != -1) {
				$(this).prev().removeClass('reserBtnOn');
				$(this).next().removeClass('reserBtnOn');
			}
			$('.totalPrice .price strong').text(calcTotal($(this).siblings().find('.sel').text(), '-').toString().replace(regcomm, ','));
		} else {
			$(this).addClass('reserBtnOn');
			if($(this).parent().attr('class').indexOf('roomPrice') != -1) {
				$(this).prev().addClass('reserBtnOn');
				if($(this).attr('class').indexOf('pcBtn') != -1) {
					$(this).next().addClass('reserBtnOn');
				}
			}
			$('.totalPrice .price strong').text(calcTotal($(this).siblings().find('.sel').text(), '+').toString().replace(regcomm, ','));
		}
	});
	
	function calcTotal(price, op) {
		price = price.replace(regex, '');
		var total = $('.totalPrice .price strong').text();
		total = Number(total.replace(regex, ''));
		
		if(total == '') total = 0;
		if (op == '-') {
			total -= Number(price); 	
		} else if (op == '+') {
			total += Number(price);
		}
		return total;
	}
	
	let peoData = '';
	$('.payment').click(function() {
		
		$('#apply-text').text('');
		
		var roomInfo = $('.reserBtnOn').parents().siblings('.roomInfo').children('.roomName');
		var roomName = '';
		var peoInfo = $('.reserBtnOn').parents().siblings('.roomPeo').children('.peopleNum').find('.quantity-field');
		
		var htmlDummy = checkInDate + '에서 ' + checkOutDate + '까지 (' + diff + '박)<br>'
		for(var i = 0; i < roomInfo.length; i++) {
			roomName = roomInfo[i].textContent;
			peoData = '';
			peoData += '성인:' + peoInfo[i*3].value;
			peoData += '/아동:' + peoInfo[i*3 + 1].value;
			peoData += '/유아:' + peoInfo[i*3 + 2].value;
			htmlDummy += roomName + '(' + peoData + ')<br>';
		}
		
		htmlDummy += '<br><br><br>결제를 진행하시겠습니까?';
		$('#apply-text').append(htmlDummy);
		$('.confirmForm').show();
	});
	
	$('.cancelBtn').click(function() {
		$('.confirmForm').hide();
	});
	
	$(document).on('click', '.more', function() {
		var id = $(this).parents().parents().siblings('.roomInfo').children('input').val();
		console.log('roomID: ' + id);
		
		$.ajax({
			url: 'getRoomImages.do?idx=' + id,
			type: 'post',
			async: true,
			dataType: 'text',
			contentType: 'application/json; charset=utf-8',
			//data: jsonData,		
			success: function(result) {	
				//alert(result);
	 			var temp = JSON.parse(result);
	 			var serverPath = 'https://ogae-dev.s3.ap-northeast-2.amazonaws.com/';
	 			//alert(temp);
				$('.roomPop .popCon').remove();
				
				let htmlDummy = '<div class="popCon">'
								+ '<p class="title">' + temp[0].room_name + '</p>';
				htmlDummy += '<div id="room_photo_list" class="owl-carousel owl-theme owl-loaded owl-drag">'
							+ '<div class="owl-stage-outer">'
							+ '<div class="owl-stage">';
				
	 			$.each(temp, function(index, item) {
					htmlDummy += '<div class="owl-item">'
							 	+ '<div class="item">'
								+ '<img src="' + serverPath + item.img_path + '">'
								+ '</div></div>';
	 			});
	 			
	 			htmlDummy += '</div></div>';
	 			
	 			htmlDummy += '<div class="owl-nav disalbe">'
	 						+ '<button type="button" role="presentation" class="owl-prev">'
	 						+ '<span arial-label="Previous"><</span>'
	 						+ '</button>'
	 						+ '<button type="button" role="presentation" class="owl-next">'
	 						+ '<span aria-label="Next">></span>'
	 						+ '</button></div>';
	 			htmlDummy += '<div class="owl-dots">';
	 			
	 			$.each(temp, function(index, item) {
					htmlDummy += '<button role="button" class="owl-dot"><span></span></button>';
	 			});
	 			
	 			htmlDummy += '</div></div>';
	 			
	 			$('.roomPop').append(htmlDummy);
			},	
			error: function() {
				alert('error');
			}
		});
		
		$('.roomPop').show();
	});
	
	$('.checkBtn').click(function() {
		var jsonData = sendData();
		$.ajax({
			url: 'reserPaydata.do',
			type: 'post',
			async: true,
			dataType: 'text',
			contentType: 'application/json; charset=utf-8',
			data: jsonData,		
			success: function(result) {	
				window.location.href = 'reserPayment.do?code='+result;
			},	
			error: function() {
				alert('error');
			}
		});
		
	});
	
	function sendData() {
		var roomInfo = $('.reserBtnOn').parents().siblings('.roomInfo');
		var obj = new Object();
		var strJson = '{"tempList": [';
		for(var i = 0; i < roomInfo.length; i++) {
			var roomId = $(roomInfo[i]).children('#roomId').val();
			var name = $(roomInfo[i]).children('.roomName').text();
			
			var tmp = $(roomInfo[i]).children('.roomPeople').text();
			var idx = $(roomInfo[i]).children('.roomPeople').text().indexOf('/');

			var price = $(roomInfo[i]).siblings('.roomPrice').children('.price').text().replace(regex, '');	
			
			var base = tmp.slice(0, idx).replace(regex, '');
			var max = tmp.slice(idx + 1, tmp.length).replace(regex, '');
			
			var peoInfo = $('.reserBtnOn').parents().siblings('.roomPeo').children('.peopleNum').find('.quantity-field');
			var adult_count = peoInfo[i*3].value;
			var child_count = peoInfo[i*3 + 1].value;
			var baby_count = peoInfo[i*3 + 2].value;
		
			var strTemp = '{';
			strTemp += '"indate":' + checkInDate.replace(regex, '') + ',';
			strTemp += '"outdate":' + checkOutDate.replace(regex, '') + ',';
			strTemp += '"idx":' + roomId + ',';
			strTemp += '"name":' + '"' + name + '",';			
			strTemp += '"base":' +  base + ',';
			strTemp += '"max":' +  max + ',';
			strTemp += '"price":' + price + ',';
			strTemp += '"adult":' + adult_count + ',';
			strTemp += '"child":' + child_count + ',';
			strTemp += '"baby":' + baby_count;
			strTemp += '}';
			strJson += strTemp + ',';
		} 
		
		strJson = strJson.slice(0, -1);
		strJson += ']}';
		return strJson;
	}
	
	$('.reserPeriodLayer').click(function(){
		datePickerSet($('.chkInDate'), $('.chkOutDate'), true);
		$('.periodPop').show();
	});
	
		
	//$('.commPop .popClose').click(function(){
	//	$(this).parents('.commPop').hide();
	//});
	
	$('.commPop .popClose').on('click', '.btnOK', function() {
		$('.checkInDate').text(checkInDate + ' ' + weekday[new Date(checkInDate).getDay()]);
		$('.checkOutDate').text(checkOutDate + ' ' + weekday[new Date(checkOutDate).getDay()]);
		$('.selPeriod span').text('(' + diff + '박 선택)');
		$(this).parents('.commPop').hide();
		
		// ### 날짜 전달 예약 정보 가져오기
		$.ajax({
			url: 'getReserRoom.do',
			async: true,
			dataType: 'json',
			contentType: 'application/json; charset=utf-8',
			data: {
				'start': checkInDate,
				'end': checkOutDate
			},
			success: function(result) {
				//alert(result);
				var id = $(this).parents().parents().siblings('.roomInfo').children('input').val();
				$('.roomList li').remove();
				
				for(var room of result.room) {
					let htmlDummy = '';
					// 객실 이미지 정보 추가
					htmlDummy += '<li><div class="roomImgLayer">'
								+ '<div class="roomImg">'
								+ '<img src="' + room.room_img + '" alt="객실이미지">'
								+ '<span class="more">+</span>'
								+ '</div></div>';
					// 객실 정보 추가
					htmlDummy += '<div class="roomInfo">';
					
					htmlDummy += '<input type="hidden" name="roomId" id="roomId" value="' + room.room_idx + '">';
					
					let tempDummy = '<span class="possIcon icon"></span>';
					let buttonDummy = '<button type="button" id="btn' + room.room_idx + '" class="pcBtn reserBtn">선택하기</button>'
									+ '<button type="button" id="btn' + room.room_idx + '" class="mbBtn reserBtn">선택하기</button>';
					if(result.list.length > 0) {
						for(var list of result.list) {
							if(room.room_idx == list.room_idx) {
								// 객실 예약가능 여부 확인				
								if(list.reserve_state == '완') {
									tempDummy = '<span class="succIcon icon"></span>';
									buttonDummy = '<button disabled="disabled" type="button" id="btn' + room.room_idx + '" class="pcBtn reserBtn">선택하기</button>'
												+ '<button disabled="disabled" type="button" id="btn' + room.room_idx + '" class="mbBtn reserBtn">선택하기</button>';
									break;
								}	
							}		
						}
					} 
					
					htmlDummy += tempDummy;
					
					htmlDummy += '<span class="roomName">' + room.room_name + '</span>';
					htmlDummy += '<span class="roomPeople">기준인원 2명 /'
								+ '<span> 최대인원 ' + room.room_person + '명</span></span>'
								+ '<span class="roomSize"><span>' + room.room_category + '</span>'
								+ '<span>' + room.room_size + '평형</span></div>';
					
					htmlDummy += '<div class="roomPeo">'
								+ '<div class="commNum peopleNum">'
								+ '<span class="peoAge">성인</span>'
								+ '<div class="numBtn">'
								+ '<button type="button" id="adult-' + room.room_idx + '" value="-" data-field="quantity" class="button minus">'
								+ '<img src="resources/calendar/img/minus.jpg" alt="-"></button>'
								+ '<span class="number"><input type="text" step="1" id="adult-value-' + room.room_idx + '" max name="quantity" value="0" class="quantity-field adult"></span>'
								+ '<button type="button" id="adult-' + room.room_idx + '" value="+" data-field="quantity" class="button plus">'
								+ '<img src="resources/calendar/img/plus.jpg" alt="+"></button>'
								+ '</div></div>';
					htmlDummy += '<div class="commNum peopleNum">'
								+ '<span class="peoAge">아동</span>'
								+ '<div class="numBtn">'
								+ '<button type="button" id="child-' + room.room_idx + '" value="-" data-field="quantity" class="button minus">'
								+ '<img src="resources/calendar/img/minus.jpg" alt="-"></button>'
								+ '<span class="number"><input type="text" step="1" id="child-value-' + room.room_idx + '" max name="quantity" value="0" class="quantity-field child"></span>'
								+ '<button type="button" id="child-' + room.room_idx + '" value="+" data-field="quantity" class="button plus">'
								+ '<img src="resources/calendar/img/plus.jpg" alt="+"></button>'
								+ '</div></div>';
					htmlDummy += '<div class="commNum peopleNum">'
								+ '<span class="peoAge">유아</span>'
								+ '<div class="numBtn">'
								+ '<button type="button" id="baby-' + room.room_idx + '" value="-" data-field="quantity" class="button minus">'
								+ '<img src="resources/calendar/img/minus.jpg" alt="-"></button>'
								+ '<span class="number"><input type="text" step="1" id="baby-value-' + room.room_idx + '" max name="quantity" value="0" class="quantity-field baby"></span>'
								+ '<button type="button" id="baby-' + room.room_idx + '" value="+" data-field="quantity" class="button plus">'
								+ '<img src="resources/calendar/img/plus.jpg" alt="+"></button>'
								+ '</div></div>'
								+ '</div>';
					htmlDummy += '<div class="roomPrice commPrice">'
								+ buttonDummy
								+ '<span class="price"><strong class="sel">' + room.room_price.toString().replace(regcomm, ',') + '</strong>원'
								+ '</span></div></li>';
					
					$('.roomList').append(htmlDummy);		
				
					/*
					if($('#btn' + room.room_idx).attr('disabled') == 'disabled') {
						$('.roomPeo').find('div, span, input, button').prop('disabled', true);
					} else {
						$('.roomPeo').find('div, span, input, button').prop('disabled', false);
					}
					*/
				}
				
				$('[id^="adult-value-"]').val('2');
				
				$('#btn'+ selRoomId).click();
				
				// 옵션 항목 일단 삭제
				$('.optionChoice').remove();
			}, 
			error: function() {
				alert('error');
			}
		});
	});
	
	$('.commPop .popClose').on('click', '.btnCancel', function() {
		$(this).parents('.commPop').hide();
	});
	
	function datePickerSet(sDate, eDate, flag) {
		 //시작 ~ 종료 2개 짜리 달력 datepicker	
		if (!isValidStr(sDate) && !isValidStr(eDate) && sDate.length > 0 && eDate.length > 0) {
		    var sDay = checkInDate;
		    var eDay = checkOutDate;
		    
        	$('.setDateIn').text(sDay);
        	$('.setDateOut').text(eDay);
        	
        	if(new Date(sDay) < new Date(eDay)) {
	        	diff = 0;
	        	diff = Math.abs(new Date(eDay).getTime() - new Date(sDay).getTime());
				diff = Math.ceil(diff / (1000 * 60 * 60 * 24));
				$('.text .setDay').text('(' + diff +'박)');
			} else {
				$('.setDateOut').text('');
				$('.text .setDay').text('');
			}
		
		    if (flag && !isValidStr(sDay) && !isValidStr(eDay)) { //처음 입력 날짜 설정, update...			
		        var sdp = sDate.datepicker().data("datepicker");
		        sdp.selectDate(new Date(sDay.replace(/-/g, "/")));  //익스에서는 그냥 new Date하면 -을 인식못함 replace필요
		
		        var edp = eDate.datepicker().data("datepicker");
		        edp.selectDate(new Date(eDay.replace(/-/g, "/")));  //익스에서는 그냥 new Date하면 -을 인식못함 replace필요
		    }
		    
		    var minDate = new Date();
			var maxDate = new Date(minDate.getFullYear(), minDate.getMonth() + 2, new Date(minDate.getFullYear(), minDate.getMonth() + 3, 0).getDate())
		    //시작일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
		    if (!isValidStr(eDay)) {
		        sDate.datepicker({
		        	minDate: minDate,
		       	 	maxDate: maxDate,
		       	 	setDate: new Date(sDay)
		        });
		    }
		    sDate.datepicker({
		        language: 'ko',
		        autoClose: true,      
		        onSelect: function (dateText) {
		        	sDay = dateText;
		        	checkInDate = sDay;
	        		$('.setDateIn').text(sDay);
		            datePickerSet(sDate, eDate);
		        }
		    });
			
		    //종료일자 세팅하기 날짜가 없는경우엔 제한을 걸지 않음
		    if (!isValidStr(sDay)) {
		    	var tmpDate = new Date(checkInDate);
		    	var limitDate = new Date(tmpDate.getFullYear(), tmpDate.getMonth(), tmpDate.getDate() + 5);
		        eDate.datepicker({
		            minDate: new Date(checkInDate),
		       	 	maxDate: limitDate,
		       	 	setDate: new Date(eDay)
		        });
		    }
		    eDate.datepicker({
		        language: 'ko',
		        autoClose: true,
		        onSelect: function (dateText) {
		        	eDay = dateText;
		        	checkOutDate = eDay;
		        	$('.setDateOut').text(eDay);
		            datePickerSet(sDate, eDate);
		        }
		    });
		    
		//한개짜리 달력 datepicker
		} else if (!isValidStr(sDate)) {
		    var sDay = sDate.val();
		    if (flag && !isValidStr(sDay)) { //처음 입력 날짜 설정, update...			
		        var sdp = sDate.datepicker().data("datepicker");
		        sdp.selectDate(new Date(sDay.replace(/-/g, "/"))); //익스에서는 그냥 new Date하면 -을 인식못함 replace필요
		    }
		
		    sDate.datepicker({
		        language: 'ko',
		        autoClose: true
		    });
		}
		
		function isValidStr(str) {
	        if (str == null || str == undefined || str == "")
	            return true;
	        else
	            return false;
	    }
	}
	
});
// ==================================

	