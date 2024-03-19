<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제하기</title>
<link rel="stylesheet" href="resources/calendar/css/reset.css">
<link rel="stylesheet" href="resources/calendar/css/reserCalendar.css">
<link rel="stylesheet" href="resources/calendar/css/calendar.css">
<link rel="stylesheet" href="resources/calendar/css/owl.carousel.css">
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="resources/calendar/js/reserPayment.js?ver=1"></script>

<!-- 제이쿼리 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous" type="text/javascript"></script>
<!-- 아임포트 -->
<script src ="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js" type="text/javascript"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
</head>
<body>
<div class="reserWrap" id="contents">
	<div class="selRoomInfo commInfo">
		<h3>선택객실정보</h3>
	</div>
	<div class="selOptionInfo commInfo reserOption">
		<h3>선택옵션정보</h3>
		<table>
			<caption>옵션정보</caption>
			<colgroup>
				<col style="width: 80%;">
				<col style="width: 20%;">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">선택옵션명</th>
					<th scope="col">결제금액</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>{옵션명} / ({옵션추가수량})</td>
					<td>{옵션결제금액}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="selOptionInfo commInfo">
		<span class="totalPrice">
			총 결제금액 : <strong>{옵션 총결제금액}</strong>원
		</span>
	</div>
	<div class="reserForm">
		<div class="reserAgree">
			<h3>약관동의</h3>
			<form action="#" method="post" id="termsAgree">
				<fieldset>
					<legend>약관동의</legend>
					<div class="agreeLayer">
						<div class="agreeCheck">
							<input type="checkbox" id="allAgree" class="allAgree">
							<label for="allAgree">전체동의</label>
						</div>
					</div>
					<div class="agreeLayer">
						<div class="agreeCheck">
							<input type="checkbox" id="noticeAgree" class="normal" name="chk" value="1">
							<label for="noticeAgree">(필수) 이용시 유의사항 동의</label>
						</div>
						<p class="content">
							입실시간은 오후3시 퇴실시간은 오전11시입니다.<br>
							보호자 동반없는 미성년자는 예약 및 입실 불가합니다.<br>
							예약 후 객실 변경은 해당예약 취소후 다시 예약하셔야 합니다.<br>
							예약변경을 위한 취소시에도 취소 수수료가 부과되오니 신중하게 예약하시기 바랍니다.
						</p>					
					</div>
					<div class="agreeLayer">
						<div class="agreeCheck">
							<input type="checkbox" id="cancelAgree" class="normal" name="chk" value="2">
							<label for="cancelAgree">(필수) 취소수수료(예약시점과 무관한 이용일 기준)에 동의</label>
						</div>
						<p class="content">
							예약취소는 구매한 사이트 "예약확인/취소" 에서 가능합니다.<br>
							취소수수료는 예약시점과는 무관한 <strong>이용시작일 기준</strong>입니다.<br>
							환불시 <strong>결제하신 금액에서 취소수수료를 제외한 금액을 환불</strong>해 드립니다.<br>
							취소수수료는 결제금액이 아닌 예약금(객실요금+기타옵션) 기준으로 책정됩니다.<br>
							<strong>취소수수료가 100% 인 경우 전액 환불되지 않습니다.</strong><br>
							수수료 내역은 아래와 같습니다.
						</p>					
						<table class="commission">
							<caption>취소수수료</caption>
							<colgroup>
								<col style="width: 50%;">
								<col style="width: 30%;">
								<col style="width: 20%;">
							</colgroup>
							<thead>
								<th scope="col">기준</th>
								<th scope="col">취소수수료(%)</th>
								<th scope="col">환불율(%)</th>
							</thead>
							<tbody>
								<tr>
									<td>이용일 당일 취소시</td>
									<td>100%</td>
									<td>환불없음</td>
								</tr>
								<tr>
									<td>이용일 1일전 취소시</td>
									<td>80%</td>
									<td>20%환불</td>
								</tr>
								<tr>
									<td>이용일 2일전 취소시</td>
									<td>70%</td>
									<td>30%환불</td>
								</tr>
								<tr>
									<td>이용일 3일전 취소시</td>
									<td>60%</td>
									<td>40%환불</td>
								</tr>
								<tr>
									<td>이용일 4일전 취소시</td>
									<td>50%</td>
									<td>50%환불</td>
								</tr>
								<tr>
									<td>이용일 5일전 취소시</td>
									<td>30%</td>
									<td>70%환불</td>
								</tr>
								<tr>
									<td>이용일 6일전 취소시</td>
									<td>20%</td>
									<td>80%환불</td>
								</tr>
								<tr>
									<td>이용일 7일전 취소시</td>
									<td>10%</td>
									<td>90%환불</td>
								</tr>
								<tr>
									<td>이용일 8일전 취소시</td>
									<td>10%</td>
									<td>90%환불</td>
								</tr>
								<tr>
									<td>이용일 9일전 취소시</td>
									<td>10%</td>
									<td>90%환불</td>
								</tr>
								<tr>
									<td>이용일 10일전 취소시</td>
									<td>10%</td>
									<td>90%환불</td>
								</tr>
								<tr>
									<td>기본 취소 수수료</td>
									<td>0%</td>
									<td>100%환불</td>
								</tr>
							</tbody>
						</table>
					</div>
					<div class="agreeLayer">
						<div class="agreeCheck">
							<input type="checkbox" id="perInfoAgree" class="normal" name="chk" value="3">
							<label for="perInfoAgree">(필수) 개인정보 수집 및 이용 동의</label>
						</div>
						<div class="content">
							&#39;여기오개&#39;는(은) 고객님의 개인정보를 중요시하며, &quot;정보통신망 이용촉진 및 정보보호&quot;에 관한 법률을 준수하고 있습니다.<br><br>
							개인정보의 수집항목 및 이용목적<br>
							서비스 이용과정에서 수집 및 이용되는 개인정보는 아래와 같습니다.
							<table class="agreeTable">
								<caption>약관동의</caption>
								<colgroup>
									<col style="width: 10%;">
									<col style="width: 37%;">
									<col style="width: 28%;">
									<col style="width: 25%;">
								</colgroup>
								<thead>
									<tr>
										<th scope="col">구분</th>
										<th scope="col">수집·이용목적</th>
										<th scope="col">수집·이용항목</th>
										<th scope="col">보유 및 이용기간</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td rowspan="4">예약자<br>(구매자)</td>
										<td>서비스 이용 및 계약의 이행, 확인, 부정 이용 방지와 불만처리 등 민원처리</td>
										<td>이름, 생년월일, 휴대전화번호, 이메일</td>
										<td rowspan="4">이용목적 달성 후, 지체 없이 파기</td>
									</tr>
									<tr>
										<td>서비스 이용 및 계약의 이행, 부정 이용·거래 방지</td>
										<td>방문일시, 서비스 이용 기록, IP, 접속기록, 쿠키, 기기 정보</td>
									</tr>
									<tr>
										<td>주문 및 예약 상품 대금 결제, 현금영수증정보</td>
										<td>결제정보(계좌, 신용카드, 휴대폰정보)</td>
									</tr>
									<tr>
										<td>결제 취소 금액 환불</td>
										<td>은행명, 계좌번호, 예금주명</td>
									</tr>
								</tbody>																					
							</table>	
						</div>	
					</div>
					<div class="agreeLayer">
						<div class="agreeCheck">
							<input type="checkbox" id="adultAgree" class="normal" name="chk" value="4">
							<label for="adultAgree">(필수) 이용자가 미성년자가 아니며 성인임에 동의</label>
						</div>
					</div>
				</fieldset>
			</form>
		</div>
		<div class="reserInfoInput">
			<h3>예약정보입력</h3>
			<form action="#" method="post" id="guest">
				<fieldset>
					<legend>예약정보입력</legend>
					<table>
						<caption>예약정보입력</caption>
						<colgroup>
							<col style="width: 22%">
							<col style="width: 78%">
						</colgroup>
						<tbody>
							<tr class="compulsory">
								<th scope="row">
									<label for="name">예약자명</label>
								</th>
								<td class="compulsory">
									<input type="text" id="name" name="name" placeholder="예약자명 입력">
									<p>예약시 실명을 정확하기 입력해 주세요.</p>
								</td>
							</tr>
							<tr class="compulsory">
								<th scope="row">
									<label for="birth">생년월일</label>
								</th>
								<td>
									<input type="date" id="birth" name="birth" placeholder="생년월일 입력" pattern="yyyy-MM-dd">
									<p>(예시 : 1992-08-31) 예시처럼 입력해 주세요.</p>
								</td>
							</tr>
							<tr class="compulsory contact">
								<th scope="row">
									<label for="contact">연락처</label>
								</th>
								<td>
									<select id="contact" name="phone1">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
									</select> - <input type="text" name="phone2"> - <input type="text" name="phone3">
									<p>예약관련 문자를 전송해 드립니다.</p>
								</td>
							</tr>
							<tr class="contact">
								<th scope="row">
									<label for="emContact">비상연락처</label>
								</th>
								<td>
									<select id="emContact" name="emergency_phone1">
										<option value="010">010</option>
										<option value="011">011</option>
										<option value="016">016</option>
										<option value="017">017</option>
										<option value="018">018</option>
										<option value="019">019</option>
									</select> - <input type="text" name="emergency_phone2"> - <input type="text" name="emergency_phone3">
								</td>
							</tr>
							<tr class="email">
								<th scope="row">
									<label for="email">이메일</label>
								</th>
								<td>
									<input type="text" id="email" name="email" placeholder="이메일 입력">
								</td>
							</tr>
							<tr class="compulsory arriveTime">
								<th scope="row">
									<label for="arriveTime">도착 예상시간</label>
								</th>
								<td>
									<select id="arriveTime" name="arrival_time">
										<option value="15:00">15:00</option>
										<option value="16:00">16:00</option>
										<option value="17:00">17:00</option>
										<option value="18:00">18:00</option>
										<option value="19:00">19:00</option>
										<option value="20:00">20:00</option>
									</select>
								</td>
							</tr>
							<tr>
								<th scope="row">
									<label for="request">요청사항</label>
								</th>
								<td>
									<textarea rows="8" id="request" placeholder="펜션에 요청할 사항을 입력"></textarea>
								</td>
							</tr>
						</tbody>
					</table>
					<div class="payLayer">
						<h4>결제하기</h4>
						<span class="totalPrice">총 결제금액 : <strong>{총결제금액}</strong></span>
					
						<div class="selPay">
							<div class="selPayBtn">
								<span class="title">결제수단 선택</span>
								<div class="group cardGroup">
									<input type="radio" id="card" name="pay" value="card" checked>
									<label for="card">신용카드</label>
								</div>
								<!-- <div class="group depositGroup">
									<input type="radio" id="deposit" name="pay" value="bank">
									<label for="deposit">무통장입금</label>
								</div>
								 -->
							</div>
							<div class="depositInfo">
								<p class="tit">무통장 (가상계좌) 입금안내</p>
								<p class="txt">
									<strong> - 입금계좌: </strong>
									<br> <strong> - 입금이 확인되면, 예약완료문자(업소연락처, 예약번호 등)가 핸드폰으로 전송됩니다.</strong>
									<br> - 무통장입금시 반드시 예약자명으로 입금하셔야합니다. 그렇지 않으면 입금확인이 되지 않을 수 있습니다.
									<br> - 예약시점 이후 <strong>3시간</strong> (이용일 전날 예약시 <strong>2시간</strong> / 당일 <strong>1시간</strong>) 이내에 입금완료하지 않는 경우
									<br> <strong>자동취소</strong>됩니다.
								</p>
							</div>
						</div>
						<div class="depositCheckPop payPop commPop" style="display: none;">
							<div class="popCon">
								<p>
									무통장 입금시 예약자명과 입금자명이 동일해야만 입금확인 가능합니다.
									<br>입금자 미확인 시 취소 처리 됩니다.
								</p>
								<button type="button">확인</button>
							</div>
						</div>
						<div class="payBtn">
							<button type="button" class="cancel" onclick="history.back()">취소 (이전으로)</button>
							<button type="button" class="payment">결제하기</button>
						</div>
						<div class="payCheckPop payPop commPop" style="display: none;">
							<div class="popCon">
								<p>확인을 누르시면 예약이 완료 됩니다.<br>예약을 완료 하시겠습니까?</p>
								<button type="button" class="cancel">취소</button>
								<button type="button" class="payCheck">확인</button>
							</div>
						</div>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
	<div class="alertForm commAlert">
		<div class="popCon">
			<p class="txt">약관 및 취소수수료를 확인하시고<br>동의 하셔야 진행 됩니다.</p>
			<button type="button" class="checkBtn">확인</button>
		</div>
	</div>
</div>
</body>
</html>