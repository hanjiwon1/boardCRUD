<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <meta name="viewport" content="width=device-width", initial-scale="1"> -->
<link rel="stylesheet" href="css/bootstrap.css">
<title>jsp게시판</title>
</head>
<body>
	<!-- 네비게이션 바 -->
	<nav class="navbar navbar-default">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" 
			data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" 
			aria-expanded="false">
				<!-- 햄버거아이콘 생성 (화면 크기가 작아질 때 생김) -->
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
				<span class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="main.jsp">한지원</a>
		</div>
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="main.jsp">home</a></li>
				<li><a href="bbs.jsp">board</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">sign in<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li class="active"><a href="login.jsp">sign in</a></li>
						<li><a href="join.jsp">sign up</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</nav>
	<!-- nav바 끝 -->
	
	<!-- 로그인 양식 -->
	<div class="container">
		<div class="col-lg-4">
			<div class="jumbotron" style="padding-top: 20px;">
				<form method="post" action="loginAction.jsp">
					<div class="form-group">
						<input type="text" class="form-control" 
						placeholder="id" name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" 
						placeholder="password" name="userPassword" 
						maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control" 
					value="sign in">
				</form>
			</div>
		</div>
	</div>
	<!-- 로그인 양식 끝 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
