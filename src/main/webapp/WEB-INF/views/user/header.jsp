<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="/resources/js/common.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<link type="text/css" rel="stylesheet" href="/resources/css/gnb.css"/>
<link type="text/css" rel="stylesheet" href="/resources/include/css/builder/animate.css"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
<div class="navigation">
	<div class="header_wrap animated fadeInDown slow" id="header_wrap">
		<div class="header">
			<div class="logo">
				<a href="main.do">
					<!-- img src="https://ogae-dog.s3.ap-northeast-2.amazonaws.com/main/logo.png" id="web-logo" alt="logo" -->
				</a>
			</div>
			
			<ul class="gnb_menu" style="max-width: 1115px; margin-left: 150px;">
				<li>
					<a class="bigMenu" href="about.do">ABOUT</a>
					<dl class="sub">
						<dt>
							<a class="page" href="#">펜션전경</a>
							<a class="page" href="about.do?tab=about4">오시는 길</a>
						</dt>
					</dl>
				</li>
				<li class="room-big-menu">
					<a class="bigMenu" href="rooms.do">ROOM</a>
					<dl class="sub">
						<dt>
						<a class="page" href="#">객실 미리보기</a>
						<a class="page" data-idx="4566325" href="#">객실 1</a>
						<a class="page" data-idx="4566326" href="#">객실 2</a>
						<a class="page" data-idx="4566327" href="#">객실 3</a>
					</dl>
				</li>
				<li class="fac-big-menu">
					<a class="bigMenu" href="UserFacility.do?facility_idx=5">FACILITIES</a>
					<dl class="sub">
						<dt>
							<a class="page" data-idx="4566332" href="UserFacility.do?facility_idx=5">실내 애견 놀이터</a>
							<a class="page" data-idx="4566333" href="UserFacility.do?facility_idx=6">애견카페</a>
							<a class="page" data-idx="4566334" href="UserFacility.do?facility_idx=7">실외 애견 수영장</a>
							<a class="page" data-idx="4566335" href="UserFacility.do?facility_idx=8">야외 카페테라스</a>
							<a class="page" data-idx="4566336" href="UserFacility.do?facility_idx=9">애견 셀프목욕</a>
							<a class="page" data-idx="4566337" href="UserFacility.do?facility_idx=10">애견 운동장</a>
							<a class="page" data-idx="4566338" href="UserFacility.do?facility_idx=11">애견 파티룸</a>
							<a class="page" data-idx="4566339" href="UserFacility.do?facility_idx=12">울타리 &amp; 잔디정원</a>
						</dt>
					</dl>
				</li>
				<li class="service-big-menu">
					<a class="bigMenu" href="PartyPlaceRental.do">SERVICE</a>
					<dl class="sub">
						<dt>
							<a class="page" data-idx="4566343" href="PartyPlaceRental.do">파티룸대여</a>
							<a class="page" data-idx="4566344" href="Dogammenities.do">반려견 용품</a>
							<a class="page" data-idx="4566345" href="Barbecue.do">바비큐</a>
							<a class="page" data-idx="4566346" href="CoffeeandTea.do">커피 &amp; 티</a>
						</dt>
					</dl>
				</li>
				<li class="travel-big-menu">
					<a class="bigMenu" href="Tour.do">TRAVEL</a>
					<dl class="sub">
						<dt>
							<a class="page" data-idx="4566351" href="Arboretum.do">여행지1</a>
							<a class="page" data-idx="4566352" href="Cheongpyeong.do">여행지2</a>
							<a class="page" data-idx="4566353" href="JadeGarden.do">여행지3</a>
							<a class="page" data-idx="4566354" href="Jara.do">여행지4</a>
							<a class="page" data-idx="4566355" href="Nami.do">여행지5</a>
							<a class="page" data-idx="4566356" href="PetitFrance.do">여행지6</a>
							<a class="page" data-idx="4566357" href="RailBike.do">여행지7</a>
						</dt>
					</dl>
				</li>
				<li class="reser-big-menu">
					<a class="bigMenu" href="#">RESERVATION</a>
					<dl class="sub">
						<dt>
							<a class="page" href="reserveMain.do">실시간예약</a>
							<a class="page" href="#">요금가이드</a>
						</dt>
					</dl>
				</li>
				<li class="comm-big-menu">
					<a class="bigMenu" href="#">COMMUNITY</a>
					<dl class="sub">
						<dt>
							<a class="page" data-idx="25663" href="noticeList.do">공지사항</a>
							<a class="page" data-idx="25664" href="getQnaList.do">문의하기</a>
							<a class="page" data-idx="25671" href="getReviewList.do">이용후기</a>
							<a class="page" data-idx="25672" href="getEventList.do">이벤트</a>
						</dt>
					</dl>
				</li>
			</ul>
			
			<div class="quick_menu">
				<div class="other_icon">
					<ul>
						<li>
							<a class="icon_reserve" href="#" title="실시간예약">
								<!-- <span class="fal fa-calendar-check" id="icon-booking1"></span> -->
								<span id="icon-booking"><i class="fa-regular fa-calendar-check fa-sm"></i></span>
							</a>
						</li>
						<li>
							<a class="icon_marker" href="about.do?tab=about4" title="오시는길">
								<span id="icon-marker"><i class="fa-solid fa-location-dot fa-sm"></i></span>
							</a>
						</li>
			
						<a class="icon_fullscreen">
							<span id="icon-full" title="전체화면"><i class="fa-solid fa-maximize fa-sm"></i></span>
							<span id="icon-normal" style="display:none"><i class="fa-regular fa-window-maximize fa-sm"></i></span>
						</a>
					</ul>
				</div>
			</div>
			
			<!-- 모바일 -->
			<div class="menu_open" id="menu_open">
				<div class="menu_icon">
					<span class="line"></span>
					<span class="line"></span>
					<span class="line"></span>
				</div>
			</div>
			
         	<div style="position:fixed; background-color:#000; opacity:0.6; top:0; bottom:0; left:0; right:0; display:none; " id="backClose"></div>
			<div class="gnb_menu_mobile_inner">
	             <!----------------------------------------------------------------------------------------------------->
	             <!-- Modified By Jubh 2020_04_09 -->
	             <style>
	             .infoPension { display:none; }
	             ul.menuList { display:none; }
	             @media screen and (max-width: 820px) {
	                 .infoPension { position:relative; width:100%; height:225px; background-color:#666; margin:0 auto; text-align:center; display:block; }
	                 .infoPension .closeSidebar { position:absolute; right:20px; top:20px; }
	                 .infoPension .closeSidebar i { font-size:30px; color:#fff; }
	                 .infoPension .imgPension { position:relative; width:90px; height:90px; background-size:contain; background-repeat:no-repeat; background-color:#fff; background-position:center; color:#fff; display:inline-block; border-radius:50%; text-align:center; line-height:100px; margin-top:25px; }
	                 .infoPension .namePension { position:relative; font-family:'Noto Sans KR'; font-size:17px; color:#fff; text-align:center; margin-top:10px; }
	                 .infoPension ul.quickIcon { position:relative; margin:23px 26px 20px; list-style:none; overflow:hidden; }
	                 .infoPension ul.quickIcon li { float:left; width:33.3%; text-align:center; }
	                 .infoPension ul.quickIcon li i { font-size:20px; color:#fff; }
	                 .infoPension ul.quickIcon li span { font-family:'Noto Sans KR'; font-size:13px; font-weight:normal; color:#fff; display:block; margin-top:10px; }
	                 ul.menuList { position: relative; display: inline-block; width: 100%; vertical-align: top; overflow-y: auto; background-color: rgba(255,255,255,1); height:100%; }
	                 ul.menuList li.menuTitle { position: relative; display: block; text-align: left; font-size: 14px; margin:0 15px; border-bottom:1px solid #ddd; overflow:hidden; }
	                 ul.menuList li.menuTitle>i { display:inline-block; position:absolute; top:25px; right:5px; font-size:14px; color:#666; }
	                 ul.menuList li.menuTitle span { font-family:'Noto Sans KR'; font-size:19px; height:60px; line-height:60px; font-weight:bold; color:#333; display:block; }
	                 ul.menuList li.menuTitle ul.subMenuList { margin:0 20px; display:none; }
	                 ul.menuList li.menuTitle ul.subMenuList li { float:left; width:50%; font-family:'Noto Sans KR'; font-size:15px; font-weight:300; color:#333; margin-top:20px; letter-spacing:-0.1em; }
	                 ul.menuList li.menuTitle ul.subMenuList li.dong { margin-left:25px; }
	                 ul.menuList li.menuTitle ul.subMenuList li:first-child { margin-top:7px; }
	                 ul.menuList li.menuTitle ul.subMenuList li:first-child.prev_room { margin-top:7px;margin-bottom:15px; width:100%; font-weight:700;margin-left:0; }
	                 ul.menuList li.menuTitle ul.subMenuList li:nth-child(2) { margin-top:7px; }
	                 ul.menuList li.menuTitle ul.subMenuList li:last-child { margin-bottom:32px; }
	                 ul.menuList li.menuTitle ul.subMenuList li a>i{display:inline-block;margin-right:5px;}
	             }
	             </style>
	             <div class="infoPension" style="background-image:url('https://ogae-dog.s3.ap-northeast-2.amazonaws.com/main/navi_bg.jpg'); ">
	                 <p class="closeSidebar"><i class="fa-solid fa-xmark" id="sideClose"></i></p>
	                 <p class="imgPension" style="background-image:url('https://ogae-dog.s3.ap-northeast-2.amazonaws.com/main/logo.png'); "></p>
	                 <p class="namePension">여기오개</p>
	                 <ul class="quickIcon">
	                     <li><a href="#"><i class="fa-sharp fa-regular fa-calendar-days"></i><span>예약하기</span></a></li>
	                     <li><a href="tel:010-5324-2514"><i class="fa-solid fa-phone-flip"></i><span>전화하기</span></a></li>
	                     <li><a href="#"><i class="fa-solid fa-location-dot"></i><span>오시는길</span></a></li>
	                 </ul>
	             </div>
	             <script>
	                 function menuToggle(obj) {
	                     if(!$(obj).hasClass("fa-minus")) {
	                         $("ul.menuList li.menuTitle i.fa-solid.fa-minus").removeClass("fa-minus").addClass("fa-plus").parent().find("ul.subMenuList").slideUp();
	                         $(obj).addClass("fa-minus").removeClass("fa-plus").parent().find("ul.subMenuList").slideDown();
	                     }
	                     else {
	                         $(obj).removeClass("fa-minus").addClass("fa-plus").parent().find("ul.subMenuList").slideUp();
	                     }
	                 }
	                 $(document).ready(function(){
	                     $("#sideClose").click(function(){
	                         $("div.gnb_menu_mobile_inner").removeClass("OPEN");
	                         $("div#menu_open").click();
	                         $("div#backClose").hide();
	                     });
	                 });
	                 $('div.menu_open').click(function(){
	                     $("div#backClose").show();
	                 });
	                 $(function(){
	                     $("li.menuTitle span").click(function(){
	                         $(this).prev().click();
	                     });
	                 });
	             </script>
	             <ul class="menuList">
	                 <li class="menuTitle">
	                     <i class="fa-solid fa-plus" onclick="menuToggle(this)"></i><span>ABOUT</span>
	                     <ul class="subMenuList">
	                         <li><a href="#">펜션전경</a></li>
	                         <li><a href="#">오시는길</a></li>
	                     </ul>
	                 </li>
	                 <li class="menuTitle">
	                     <i class="fa-solid fa-minus" onclick="menuToggle(this)"></i><span>ROOM</span>
	                     <ul class="subMenuList" style="display:block; ">
	                      <li class="prev_room"><a href="#">객실 미리보기</a></li>
	                     
					<li data-idx="4566325"><a href="#">객실 1</a></li>
					<li data-idx="4566326" style="margin-top:8px;"><a href="#">객실 2</a></li>
					<li data-idx="4566327"><a href="#">객실 3</a></li>
				</ul>
	                 </li>
	                 <li class="menuTitle">
	                     <i class="fa-solid fa-plus" onclick="menuToggle(this)"></i><span>FACILITIES</span>
	                     <ul class="subMenuList">
	                         <li data-idx="4566332"><a href="UserFacility.do?facility_idx=5">실내 애견 놀이터</a></li>
	                         <li data-idx="4566333"><a href="UserFacility.do?facility_idx=6">애견카페</a></li>
	                         <li data-idx="4566334"><a href="UserFacility.do?facility_idx=7">실외 애견 수영장</a></li>
	                         <li data-idx="4566335"><a href="UserFacility.do?facility_idx=8">야외 카페테라스</a></li>
	                         <li data-idx="4566336"><a href="UserFacility.do?facility_idx=9">애견 셀프목욕</a></li>
	                         <li data-idx="4566337"><a href="UserFacility.do?facility_idx=10">애견 운동장</a></li>
	                         <li data-idx="4566338"><a href="UserFacility.do?facility_idx=11">애견 파티룸</a></li>
	                         <li data-idx="4566339"><a href="UserFacility.do?facility_idx=12">울타리 &amp; 잔디정원</a></li>
	                     </ul>
	                 </li>
	                 <!-- 서비스 -->
	                 <li class="menuTitle">
	                 	<i class="fa-solid fa-plus" onclick="menuToggle(this)"></i><span>SERVICE</span>
	                  	<ul class="subMenuList">
	 	                     <li class="page" data-idx="4566343"><a href="PartyPlaceRental.do">파티룸대여</a></li>
	                       <li class="page" data-idx="4566344"><a href="Dogammenities.do">반려견 용품</a></li>
	                       <li class="page" data-idx="4566345"><a href="Barbecue.do">바비큐</a></li>
	                       <li class="page" data-idx="4566346"><a href="CoffeeandTea.do">커피 &amp; 티</a></li>
	                 	</ul>
	                 </li>
	                 <li class="menuTitle">
	                     <i class="fa-solid fa-plus" onclick="menuToggle(this)"></i><span>TRAVEL</span>
	                     <ul class="subMenuList">
	                     	<li class="page" data-idx="4566351"><a href="Arboretum.do">여행지1</a></li>
	                     	<li class="page" data-idx="4566351"><a href="Cheongpyeong.do">여행지2</a></li>
	                     	<li class="page" data-idx="4566351"><a href="JadeGarden.do">여행지3</a></li>
	                     	<li class="page" data-idx="4566351"><a href="Jara.do">여행지4</a></li>
	                     	<li class="page" data-idx="4566351"><a href="Nami.do">여행지5</a></li>
	                     	<li class="page" data-idx="4566351"><a href="PetitFrance.do">여행지6</a></li>
	                     	<li class="page" data-idx="4566351"><a href="RailBike.do">여행지7</a></li>
	                     </ul>
	                 </li>
	                 <li class="menuTitle">
	                     <i class="fa-solid fa-plus" onclick="menuToggle(this)"></i><span>RESERVATION</span>
	                     <ul class="subMenuList">
	                         <li><a href="#">실시간예약</a></li>
	                         <li><a href="#">요금가이드</a></li>
	                     </ul>
	                 </li>
	                 <li class="menuTitle">
	                     <i class="fa-solid fa-plus" onclick="menuToggle(this)"></i><span>COMMUNITY</span>
	                      <ul class="subMenuList">
	                          <li class="page" data-idx="25663"><a href="noticeList.do">공지사항</a> </li>
	                          <li class="page" data-idx="25664"><a href="getQnaList.do">문의하기</a> </li>
						<li class="page" data-idx="25671"><a href="getReviewList.do">이용후기</a> </li>
						<li class="page" data-idx="25672"><a href="getEventList.do">이벤트</a> </li>
	                      </ul>
	                  </li>
	              </ul>
			</div>
		</div>
	</div>
</div>
</body>
</html>