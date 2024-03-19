<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Main</title>
<link rel="stylesheet" href="resources/admin/styles/media.css">

<link rel="stylesheet" href="resources/include/deskapp/vendors/styles/style.css">
<script src="resources/include/deskapp/vendors/scripts/core.js"></script>
<script src="resources/include/deskapp/vendors/scripts/script.min.js"></script>
<script src="resources/include/deskapp/vendors/scripts/process.js"></script>
<script src="resources/include/deskapp/vendors/scripts/layout-settings.js"></script>
<link href="/resources/css/sb-admin-2.css" rel="stylesheet" />

<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body id="page-top">
<div id="wrapper">
	<div id="sidebar">
		<%@ include file="sidebar.jsp" %>
	</div>
	<div id="topbar">
		<%@ include file="topbar.jsp" %>
		<div id="content-wraaper" class="d-flex flex-column">
			<%@ include file="content.jsp" %>	
		</div>
	</div>
</div>
<div id="footer">		
	<%@ include file="footer.jsp" %>
</div>

</body>
</html>