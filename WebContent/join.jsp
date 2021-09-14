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
	
	<!-- 회원가입 양식 -->
	<div class="container">
		<div class="col-lg-4"> <!-- 영역 크기 -->
			<div class="jumbotron" style="padding-top: 20px"> <!-- 점보트론은 특정 컨텐츠, 정보를 두드럭지게 하기 위한 큰 박스 -->
				<form method="post" action="joinAction.jsp">
					<h3 style="text-align: center">회원가입 화면</h3>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="ID" name="userID" maxlength="20">
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="password" name="userPassword" maxlength="20">
					</div>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="name" name="userName" maxlength="20">
					</div>
					<div class="form-group" style="text-align: center;">
						<div class="btn-group" data-toggle="buttons">
							<label class="btn btn-primary active"  style="margin: 0px 1px">
								<input type="radio" name="userGender" autocomplete="off" value="남자" checked>남자
							</label>
							<label class="btn btn-primary active" style="margin: 0px 1px">
								<input type="radio" name="userGender" autocomplete="off" value="여자">여자
							</label>
						</div>
					</div>
					<div class="form-group">
						<input type="email" class="form-control" placeholder="email" name="userEmail" maxlength="20">
					</div>
					<input type="submit" class="btn btn-primary form-control" value="sign up">
				</form>
			</div>
		</div>
	</div>
	<!-- 회원가입 양식 끝 -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
