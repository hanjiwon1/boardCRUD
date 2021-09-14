<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
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
	
	//bbsID를 초기화시키고 'bbsID'라는 데이터가 넘어온 것이 존재한다면 캐스팅을 통해 변수에 담는다
	int bbsID = 0;
	if (request.getParameter("bbsID") != null) {
		bbsID = Integer.parseInt(request.getParameter("bbsID"));
	}
	
	//넘어온 데이터가 없다면
	if (bbsID == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('유효하지 않은 글입니다.')");
		script.println("location.href='bbs.jsp");
		script.println("</script>");
	}
	
	//유효한 글이라며 구체적 정보를 'bbs'라는 인스턴스에 담는다.
	Bbs bbs = new BbsDAO().getBbs(bbsID);
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
	
	<!-- 게시판 글보기 영역 시작 -->
	
	<div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 1px solid #eeeeee">
				<thead>
					<tr>
						<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width: 20%; border-right: 1px solid #eeeeee">글 제목</td>
						<td colspan="2"><%= bbs.getBbsTitle().replaceAll(" ", "&nbsp;")
								.replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
					<tr>
						<td style="border-right: 1px solid #eeeeee">작성자</td>
						<td colspan="2"><%= bbs.getUserID() %></td>
					</tr>
					<tr>
						<td style="border-right: 1px solid #eeeeee">작성일자</td>
						<td colspan="2"><%= bbs.getBbsDate().substring(0, 11) + bbs.getBbsDate().substring(11, 13) + "시"
								+ bbs.getBbsDate().substring(14, 16) + "분" %></td>
					</tr>
					<tr>
						<td style="border-right: 1px solid #eeeeee; vertical-align: middle">내용</td>
						<td colspan="2" style="height: 200px; text-align: left;"><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;")
							.replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
				</tbody>
			</table>
			<!-- 목록 바로가기 생성 -->
			<a href="bbs.jsp" class="btn btn-primary">목록</a>
			
			<!-- 글 작성자가 접근했을 때 수정과 삭제가 가능하도록 하는 코드 -->
			<%
			if (userID != null && userID.equals(bbs.getUserID())){
			%>
				<a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">수정</a>
				<a href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-primary">삭제</a>
			<%
			}
			%>
		</div>
	</div>
	<!-- 게시판 글보기 영역 끝 -->
	
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
