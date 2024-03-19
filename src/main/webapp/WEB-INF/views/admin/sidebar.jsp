<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin SideBar</title>
<link rel="stylesheet" href="resources/include/deskapp/vendors/styles/core.css">
<link rel="stylesheet" href="resources/include/deskapp/vendors/styles/icon-font.min.css">
<link rel="stylesheet" href="resources/include/deskapp/vendors/styles/style.css">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag("js", new Date());

	gtag("config", "G-GBZ3SGGX85");
</script>
<script>
	(function(w, d, s, l, i) {
		w[l] = w[l] || [];
		w[l].push({
			"gtm.start" : new Date().getTime(),
			event : "gtm.js"
		});
		var f = d.getElementsByTagName(s)[0], j = d.createElement(s), dl = l != "dataLayer" ? "&l="
				+ l
				: "";
		j.async = true;
		j.src = "https://www.googletagmanager.com/gtm.js?id=" + i + dl;
		f.parentNode.insertBefore(j, f);
	})(window, document, "script", "dataLayer", "GTM-NXZMQSS");
</script>
</head>
<body>
<div class="right-sidebar">
	<div id="right-sidebar-body customscroll mCustomScrollbar _mCS_2 mCS_no_scrollbar">
		<div id="mCSB_2" class="mCustomScrollBox mCS-dark-2 mCSB_vertical mCSB_inside" style="max-height: none;" tabindex="0">
			<div id="mCSB_2_container" class="mCSB_container mCS_y_hidden mCS_no_scrollbar_y" style="position: relative; top: 0; left: 0;" dir="ltr">
			</div>
			<div id="mCSB_2_scrollbar_vertical" class="mCSB_scrollTools mCSB_2_scrollbar mCS-dark-2 mCSB_scrollTools_vertical mCSB_scrollTools_onDrag_expand" style="dispaly: none;">
			</div>
		</div>
	</div>
</div>
<div class="left-side-bar">
	<div class="brand-logo">
		<div class="main.ado">
			<img src="#" alt="LOGO"><a>LOGO IMAGE</a>
		</div>
		<div class="close-sidebar" data-toggle="left-sidebar-close">
			<i class="fa-solid fa-xmark fa-lg"></i>
		</div>
	</div>
	<div class="menu-block customscroll mCustomScrollbar _mCS_3">
		<div id="mCSB_3" class="mCustomScrollBox mCS-dark-2 mCSB_vertical mCSB_inside" tabindex="0" style="max-height: none;">
			<div id="mCSB_3_container" class="mCSB_container" style="position: relative; top: 0; left: 0;" dir="ltr">
				<div class="sidebar-menu icon-style-1 icon-list-style-1">
					<ul id="accordion-menu">
						<li class="dropdown">
							<a href="main.do" class="dropdown-toggle no-arrow">
								<span class="micon"><i class="fa-solid fa-house"></i></span>
								<span class="mtext">여기오개 HOME</span>
							</a>
						</li>
						<li>
							<div class="dropdown-divider"></div>
						</li>
						<li>
							<div class="sidebar-small-cap">BOARD</div>
						</li>
						<li>
							<a href="getRoomList.ado" target="loadPage" class="dropdown-toggle no-arrow">
								<span class="micon"><i class="fa-solid fa-bed"></i></span>
								<span class="mtext">객실 관리</span>
							</a>
						</li>
						<li>
							<a href="getFacList.ado" target="loadPage" class="dropdown-toggle no-arrow">
								<span class="micon"><i class="fa-brands fa-canadian-maple-leaf"></i></span>
								<span class="mtext">시설 관리</span>
							</a>
						</li>
						<li>
							<a href="getServiceList.ado" target="loadPage" class="dropdown-toggle no-arrow">
								<span class="micon"><i class="fa-regular fa-paper-plane"></i></span>
								<span class="mtext">서비스 관리</span>
							</a>
						</li>
						<li>
							<a href="TourList.ado"  target="loadPage" class="dropdown-toggle no-arrow">
								<span class="micon"><i class="fa-solid fa-cable-car"></i></span>
								<span class="mtext">여행지 관리</span>
							</a>
						</li>
						<li>
							<a href="getReserveList.ado" target="loadPage" class="dropdown-toggle no-arrow">
								<span class="micon"><i class="fa-solid fa-calendar-check"></i></span>
								<span class="mtext">예약 관리</span>
							</a>
						</li>
						<li>
							<a href="getNoticeList.ado" target="loadPage" class="dropdown-toggle no-arrow">
								<span class="micon"><i class="fa-solid fa-pen-to-square"></i></span>
								<span class="mtext">공지사항 관리</span>
							</a>
						</li>
						<li>
							<a href="getQnaList.ado" target="loadPage" class="dropdown-toggle no-arrow">
								<span class="micon"><i class="fa-solid fa-q"></i></span>
								<span class="mtext">문의 관리</span>
							</a>
						</li>
						<li>
                     		<a href="getReviewList.ado" target="loadPage" class="dropdown-toggle no-arrow">
		                        <span class="micon"><i class="fa-solid fa-smile"></i></span>
		                        <span class="mtext">사용후기 관리</span>
		                     </a>
		                  </li>
		                  <li>
						
						<li>
							<a href="getEventList.ado" target="loadPage" class="dropdown-toggle no-arrow">
								<span class="micon"><i class="fa-solid fa-gift"></i></span>
								<span class="mtext">이벤트 관리</span>
							</a>
						</li>
						<li>
							<a href="javscript:;" class="dropdown-toggle no-arrow">
								<span class="micon"><i class="fa-solid fa-circle-exclamation"></i></span>
								<span class="mtext">약관 관리</span>
							</a>
						</li>
						<li>
							<div class="dropdown-divider"></div>
						</li>
						<li>
							<div class="sidebar-small-cap">STATISICS</div>
						</li>
						<li>
							<a href="javscript:;" class="dropdown-toggle no-arrow">
								<span class="micon"><i class="fa-solid fa-chart-line"></i></span>
								<span class="mtext">매출 통계</span>
							</a>
						</li>
						<li>
							<a href="javscript:;" class="dropdown-toggle no-arrow">
								<span class="micon"><i class="fa-solid fa-chart-column"></i></span>
								<span class="mtext">이용자수 통계</span>
							</a>
						</li>
					</ul>
				</div>
			</div>
		
		</div>
	</div>
</div>
</body>
</html>