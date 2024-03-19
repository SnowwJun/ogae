$(document).ready(function(){
		
	// ====================== 달력 날짜 출력
	let regex = /[^0-9]/g;
	let regcomm = /\B(?=(\d{3})+(?!\d))/g;

	const makeCalendar = (date) => {
		let currentYear = new Date(date).getFullYear();
		let currentMonth = new Date(date).getMonth() + 1;
		let firstDay = new Date(date.setDate(1)).getDay();
		let lastDay = new Date(currentYear, currentMonth, 0).getDate();
		let limitDay = firstDay + lastDay;
		let nextDay = Math.ceil(limitDay / 7) * 7;
		
		let today = new Date()
		let todayDate = new Date().getDate();
		let checkDate = new Date(new Date().getFullYear(), new Date().getMonth() + 1, new Date().getDate()); 
				
		$.ajax({
			url: '/getReserList.do',
			type: 'get',
			async: true,
			dataType: 'json',
			contentType: 'application/json; charset=utf-8',
			data: {
				year: currentYear,
				month: currentMonth
			},
			success: function(result) {		
				$('table tbody tr').remove();
				$('input:checkbox[id="price"]').prop('checked', false);
				
				let htmlDummy = '<tr>';
				
				for(let col = 1; col <= firstDay; col++) {
					htmlDummy += "<td></td>";
				}
				
				
				// 이전 달의 달력 및 예약내역은 출력하지 않음
				if(currentYear <= new Date().getFullYear() 
					&& currentMonth < new Date().getMonth() + 1) {
					htmlDummy = '';
				} 
				else if (new Date(currentYear, currentMonth) > new Date(today.getFullYear(), today.getMonth() + 3)) {
					for(let day = 0; day < lastDay; day++) {	
						if((day + firstDay) % 7 == 0 && day != lastDay) {
							htmlDummy += '</tr><tr>';
						}
						htmlDummy += '<td class="bg-blue">예약불가</td>';
					}	
					
					for(let col = limitDay; col < nextDay; col++) {
						htmlDummy += '<td></td>';
					}
				
				} else {
					// 날짜 출력
					for(let day = 0; day < lastDay; day++) {		
						if((day + firstDay) % 7 == 0 && day != lastDay) {
							htmlDummy += '</tr><tr>';
						}
						
						var selDate = new Date(currentYear, currentMonth, (day+1));
						if(selDate < checkDate) {
							htmlDummy += '<td class="bg-blue">예약종료</td>';
						} else {
							var tempDummy = '';		
							//$('.bg-white ul').remove();
							htmlDummy += '<td class="bg-white">'
										+ '<div class="day">'
										+ '<span class="num">' + (day+1) + '</span>'
										+ '</div>';
							
							var dateId = currentYear + '-' + ("0" + currentMonth).slice(-2) + '-' + ("0" + (day+1)).slice(-2);
							htmlDummy += '<ul id="room-' + dateId + '" class="roomReser">';
							for(var room of result.room) {
								//console.log(room.room_name);
							
								htmlDummy += '<li>';
								var tempDummy = '<span class="possIcon icon"></span>';
								var tempA = '<a target="loadPage" href="reserApply.do?enterdate=' + dateId + '&R=' + room.room_idx + '">';
								for(var list of result.list) {
									if(room.room_idx == list.room_idx) {
										var startDate = parseDate(list.reserve_start);
										var endDate = parseDate(list.reserve_end);										
										var diffDate = endDate.getDate() - startDate.getDate();
										
										if(startDate.getFullYear() === selDate.getFullYear() 
											&& startDate.getMonth() === selDate.getMonth()
											&& startDate.getDate() === selDate.getDate()) {
											if(list.reserve_state == '완') {
												tempDummy = '<span class="succIcon icon"></span>';
												tempA = '<a href="#a">';
												break;
											}
										}
										
										if(diffDate > 1) {
											for(var diff = 1; diff < diffDate; diff++) {
												var chkDate = new Date(startDate.setDate(startDate.getDate() + diff));
												if(startDate.getFullYear() === selDate.getFullYear() 
													&& startDate.getMonth() === selDate.getMonth()
													&& chkDate.getDate() === selDate.getDate()) {
													if(list.reserve_state == '완') {
														tempDummy = '<span class="succIcon icon"></span>';
														tempA = '<a href="#a">';
														break;
													}
												}
											}
										}
									} 
								}
								
								htmlDummy += tempDummy;								
								
								htmlDummy += '<span class="roomName">'
											+ tempA + room.room_name + '</a>'
											+ '</span>'
											+ '<span class="resultPrice">' + room.room_name
											+ '<span><a href="reserApply.do?enterdate=' + dateId + '&R=' + room.room_idx + '">' + room.room_price.toString().replace(regcomm, ',')
											+ '</a></span></span>'
											+ '</li>';				
							}
							
							htmlDummy += '</ul>';
						}
					}
					for(let col = limitDay; col < nextDay; col++) {
						htmlDummy += '<td></td>';
					}
				
					htmlDummy += '</tr>';
				}
				
				$('table tbody').append(htmlDummy);
				$('.month').text(currentYear + "년 " + currentMonth + "월");
			},
			error: function() {
				alert('error');
			}
		});
	}
	
	let date = new Date();
	makeCalendar(date);
	
	let weekday = ['일','월','화','수','목','금','토'];
	let toYear = new Date().getFullYear();
	let toMonth = new Date().getMonth() + 1;
	let toDate = new Date().getDate();
	let toDay = weekday[new Date().getDay()];
		
	$('.today span').text(toYear + "-" + ("0" + toMonth).slice(-2) + "-" + ("0" + toDate).slice(-2) + "(" + toDay + ")");
	
	$('.next').on('click', () => {
		makeCalendar(new Date(date.setMonth(date.getMonth() + 1)));
	});
	
	$('.prev').on('click', () => {
		makeCalendar(new Date(date.setMonth(date.getMonth() - 1)));
	});
	
	function parseDate(str) {
		//console.log(str);
		str = str.replace(regex, '');
		var y = str.substr(0, 4);
		var m = str.substr(4, 2);
		var d = str.substr(6, 2);
		return new Date(y, m, d);
	}
	// ================================== 

	
	$('.reserCalendar .roomPrice input').click(function(){
        if( $(this).prop('checked') ){
            $('.reserCalendar .roomReser span.icon, .reserCalendar .roomReser .roomName').hide();
			$('.reserCalendar .roomReser .resultPrice').show();
        }else{
            $('.reserCalendar .roomReser span.icon, .reserCalendar .roomReser .roomName').show();
			$('.reserCalendar .roomReser .resultPrice').hide();
        }
    });

	$('.reserCalendar .succIcon').next('.roomName').addClass('nameOff');
	$('.reserCalendar .succIcon').next('.roomName').next('.resultPrice').addClass('priceOff');

//	$('.commPrice .reserBtn').click(function(){
//		$(this).toggleClass('reserBtnOn');
//		
//		if( $(this).hasClass('reserBtnOn') ){
//			$(this).siblings('.price').find('strong').addClass('sel');
//		} else if ( !$(this).hasClass('reserBtnOn') ){
//			$(this).siblings('.price').find('strong').removeClass('sel');
//		}
//	});

//	$('.commNum .numBtn .plus').click(function(){
//		alert('click');
//		let count = $(this).siblings('.number').find('input');
//		count1 = count.val() ? parseInt(count.val()) : '';
//		count1+=1; 
//		count.val(count1); 
//	});

//	$('.commNum .numBtn .minus').click(function(){
//		let count = $(this).siblings('.number').find('input');
//		count1 = count.val() < 1 ? 0 : count1-=1;
//		//count1-=1; 
//		//count1 < 1 ? count = 0 : count--;
//		count.val(count1); 
//	});

//	$('.commNum .numBtn .minus').click(function(){
//		count < 1 ? count = 0 : count--;
//		$(this).siblings('.number').find('span').text(count);	
//	});

	$('.reserNotice .list li').click(function(){
		$('.noticePop').show();

		let txt = $(this).text();
		$('.reserNotice .noticePop .text').text(txt);
	});

//		$('.owl-carousel button.owl-dot').hover(function(){
//			$('.owl-carousel').trigger('stop.owl.autoplay');
//		},function(){
//			$('.owl-carousel').trigger('play.owl.autoplay');
//		});


	$('.roomChoice .popClose').click(function(){
		    var length = $('.item').length;
			for (var i=0; i<length; i++) {
			   $("#room_photo_list").trigger('remove.owl.carousel', [i]).trigger('refresh.owl.carousel');
			}
	});

	$('.optionChoice .optionCon').click(function(){
		$('.optionPop').show();
		let tit = $(this).find('.optionTit').text();
		let txt = $(this).find('.optionTxt').text();

		$('.optionChoice .optionPop .title').text(tit);
		$('.optionChoice .optionPop .text').text(txt);
	});


	$('.commPop .popClose').click(function(){
		$(this).parents('.commPop').hide();
	});
	
	let elHeight = $('.reserAgree form').height();
	$('.reserInfoInput').height(elHeight);

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

	 selPayDepositPopBtn.click(function(){
		selPayDepositPop.fadeOut();
	 });

	 paymentBtn.click(function(){
		payCheckPop.fadeIn();
	 });

	 payCheckPopCancel.click(function(){
		payCheckPop.fadeOut();
	 });

//	let alertCheck = $('.commAlert .popCon .checkBtn');
//	
//	alertCheck.click(function(){
//		$(this).parents('.commAlert').fadeOut();
//	});

	$('.reserTabMenu').on('click', function(e) {
		if($(e.target).attr('class') !== 'login') {
			var el = $(e.target).closest('li');
			el.siblings('li').removeClass('active');
			el.addClass('active');
		} 
	});

});