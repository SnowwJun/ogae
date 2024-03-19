<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>
<!-- link rel="stylesheet" href="/resources/css/admin/sb-admin-2.css" -->
<link rel="stylesheet" href="/resources/css/admin/sb-admin-2.min.css">
<script type="text/javascript" src="resources/include/vendor/jquery/jquery.min.js"></script>
<script type="text/javascript" src="resources/include/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script type="text/javascript" src="resources/include/vendor/jquery-easing/jquery.easing.min.js"></script>
<script type="text/javascript" src="resources/include/jscript/admin/sb-admin-2.min.js"></script>
<script>
	$(document).ready(function() {
		$('#login').click(function() {
			if($('#id').val() == '' || $('#password').val() == '') {
				alert('아이디 또는 비밀번호를 입력해주세요.');
				return false;
			} else {
				$('#loginForm').submit();
			}
		});
		
		var msg = '<%=session.getAttribute("msg")%>';
		if(msg != null && msg != '' && msg != 'null') {
			alert(msg);
		}
	});
	
	$(document).keyup(function(event) {
		if(event.which === 13) {
			$('#loginForm').submit();
		}
	});	
</script>
</head>
<body class="bg-gradient-primary">
<div class="container">
	<div class="row justify-content-center">
		<div class="col-xl-10 col-lg-12 col-md-9">
			<div class="card o-hidden border-0 shadow-lg my-5">
				<div class="card-body p-0">
					<div class="row">					
						<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
						<div class="col-lg-6">
							<div class="p-5">
								<div class="text-center">
									<h1 class="h4 text-gray-900 mb-4">Admin Login</h1>
								</div>
								<form class="user" action="login.ado" method="post" id="loginForm">
									<div class="form-group">
										<input type="text" class="form-control form-control-user" id="id" name="id" placeholder="Enter ID">
									</div>
									<div class="form-group">
										<input type="password" class="form-control form-control-user" id="password" name="password" placeholder="Password">
									</div>
									<div class="form-group">
										<div class="custom-control custom-checkbox small">
											<input type="checkbox" class="custom-control-input" id="customCheck">
											<label class="custom-control-label" for="customCheck">Remember Me</label>
										</div>
									</div>
									<a id="login" href="#" class="btn btn-primary btn-user btn-block">Login</a>
									<!-- input type="submit" class="btn btn-primary btn-user btn-block" value="Login"> -->
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>