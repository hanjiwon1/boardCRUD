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
	<%
	//사용자가 메인페이지로 이동했을 때 세션에 값이 담겨있는지를 체크하는 부분
	String userID = null;
	if (session.getAttribute("userID") != null) {
		userID = (String)session.getAttribute("userID");
	}	
	%>
	
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
				<li class="active"><a href="bbs.jsp">board</a></li>
			</ul>
			<%
			//로그인 하지 않았을 때 보여지는 화면
			if (userID == null){
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">sign in<span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="login.jsp">sign in</a></li>
						<li><a href="join.jsp">sign up</a></li>
					</ul>
				</li>
			</ul>
			<%
			//로그인 시 보여지는 화면
			} else { 
			%>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" 
					aria-hashpopup="true" aria-expended="false">회원관리 <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logoutAction.jsp">로그아웃</a></li>
					</ul>
				</li>
			</ul>
			<%
			}
			%>
		</div>
	</nav>
	<!-- nav바 끝 -->
	
	<!-- 게시판 글쓰기 영역 시작 -->
	
	<div class="container">
		<div class="row">
			<form method="post" action='writeAction.jsp'>
				<table class="table table-striped" style="text-align: center; border 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="text" class="form-control" placeholder="title" name="bbsTitle" maxlength="50"></td>
						</tr>
						<tr>
							<td><textarea class="form-control" placeholder="content" name="bbsContent" maxlength="2048" style="height: 350px;"></textarea></td>
						</tr>
					</tbody>
				</table>
				<!-- 글쓰기 버튼 생성 -->
				<input type="submit" class="btn btn-primry pull-right" value="글쓰기">
			</form>
		</div>
	</div>
	<!-- 게시판 글쓰기 영역 끝 -->
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
