<%@page import="java.io.PrintWriter"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>jsp 게시판</title>
</head>
<body>
	<% 
	//사용자의 세션을 확인하고 이미 로그인이 된 상태라면 회원가입을 진행하지 못하게 하는 코드 입니다.
	
	String userID = null;
	//세션 확인
	if (session.getAttribute("userID") != null) {
		userID = (String)session.getAttribute("userID");
	}
	//이미 로그인 된 상태이면 회원가입 방지
	if(userID != null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인 되어있습니다.')");
		script.println("location.href = 'main.jsp'");	
		script.println("</script>");
	}
	//세션확인, 로그인시 회원가입방지 코드 끝입니다.
	
	if (user.getUserID() == null || user.getUserPassword() == null || user.getUserName() == null || user.getUserGender() == null || user.getUserEmail() == null) {
		//해당 if문: 회원가입시 빈칸을 두고 회원가입버튼을 누른 경우
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('입력이 안된 사항이 있습니다')");
		script.println("history,back()");
		script.println("</script>");
	} else { //else문: 모든 칸을 채운 경우 -> 아이디중복과 회원가입성공으로 나뉜다
		UserDAO userDAO = new UserDAO();
		int result = userDAO.join(user);
		if (result == -1) { //모든 칸 다 채우고 아이디 중복
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 존재하는 아이디입니다')");
			script.println("history.back()");
			script.println("</script>");
		} else { //회원가입 성공
			session.setAttribute("userID", user.getUserID()); //회원가입 성공시 유저에게 세션을 부여하는 코드
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('회원가입 성공')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
	}
	%>
</body>
</html>