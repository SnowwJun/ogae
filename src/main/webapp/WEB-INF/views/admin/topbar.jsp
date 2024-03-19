<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Topbar</title>
<script src="resources/include/deskapp/vendors/scripts/core.js"></script>
</head>
<body>
<div class="header">
	<div class="header-left">
		<div class="menu-icon"><i class="fa-solid fa-bars"></i></div>
		<div class="search-toggle-icon" data-toggle="header_search"><i class="fa-solid fa-magnifying-glass"></i></div>
		<div class="header-search">
			<form>
				<div class="form-group mb-0">
					<i class="dw-search2 fa-solid fa-magnifying-glass"></i>
					<input type="text" class="form-contorl search-input" placeholder="Search Here">
				</div>
			</form>
		</div>
	</div>
	<div class="header-right">
		<div class="user-notification">
			<div class="dropdown">
				<a class="dropdown-toggle no-arrow" href="#" role="button" data-toggle="dropdown" aria-expanded="false">
					<i class="icon-copy fa-solid fa-bell"></i>
					<span class="badge notification-active"></span>
				</a>
			</div>
		</div>
		<div class="user-info-dropdown">
			<div class="dropdown">
				<a class="dropdown-toggle" href="#" role="button" data-toggle="dropdown">
					<span class="user-icon">
						<i class="fa-solid fa-shield-dog"></i>
					</span>
					<span class="user-name">${admin.name}</span>
				</a>
				<div class="dropdown-menu dropdown-menu-right dropdown-menu-icon-list">
					<a class="dropdown-item" href=""><i class="fa-solid fa-user fa-sm"></i>Profile</a>
					<a class="dropdown-item" href=""><i class="fa-solid fa-gear"></i>Setting</a>
					<a class="dropdown-item" href="logout.ado" data-toggle="modal" data-target="#logoutModal"><i class="fa-solid fa-right-from-bracket fa-sm"></i>Log Out</a>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>