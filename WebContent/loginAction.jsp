<%@page import="java.io.PrintWriter"%> <!-- 자바스크립트를 사용하기 위해서 -->
<%@page import="user.UserDAO"%> <!-- 앞에서 만든 클래스를 사용 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %> <!-- 넘어온 데이터 한글 깨짐 방지 -->
<jsp:useBean id="user" class="user.User" scope="page" /> <!-- User클래스를 자바빈즈로 사용, scope: 사용 범위  -->
<jsp:setProperty name="user" property="userID" /> <!-- 로그인 페이지에서 받아온 사용자 ID를 'userID'에 저장 -->
<jsp:setProperty name="user" property="userPassword" /> <!-- 로그인 페이지에서 받아온 사용자의 PW를 'userPassword'에 저장 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp게시판</title>
</head>
<body>
	<% 
	UserDAO userDAO = new UserDAO(); //UserDAO 클래스 인스턴스 'userDAO'를 생성한다.
	//int타입 변수 'result'에 'userDAO'인스턴스 클래스의 'login'메소드의 실행 결과를 저장한다.
	// 'login'메소드의 매개변수는 실제 브라우저에서 사용자가 입력한 아이디와 비밀번호가 들어간다.
	int result = userDAO.login(user.getUserID(), user.getUserPassword());
	if (result == 1){ //login메소드를 만들 때 결과에 따른 반환값을 모두 다르게 설정했다. (UserDAO.java) 반환값에 따라 사용자에게 보여지는 화면의 로직을 다르게 설정해준다.
		PrintWriter script = response.getWriter(); //자바스크립트 문장을 실행하게 해준다.
		script.println("<script>");
		script.println("alert('로그인 성공')");
		script.println("location.href='main.jsp'"); //location.href='main.jsp' <- 'main.jsp'페이지로 이동시켜준다
		script.println("</script>");
	} else if (result == 0){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다')");
		script.println("history.back()");
		script.println("</script>");
	} else if(result == -1){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다')");
		script.println("history.back()");
		script.println("</script>");
	} else if(result == -2){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('데이터베이스 오류입니다')");
		script.println("history.back()"); //history.back() <- 이전 페이지로 돌아간다.
		script.println("</script>");
	}
	%>
</body>
</html>