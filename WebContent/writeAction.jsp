<%@page import="java.io.PrintWriter"%>
<%@page import="bbs.BbsDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<jsp:setProperty name="bbs" property="bbsTitle" />
<jsp:setProperty name="bbs" property="bbsContent" />
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
	if(userID == null) {
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('로그인 필요')");
		script.println("location.href = 'login.jsp'");	
		script.println("</script>");
	}else {
		if (bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안된 사항이 있습니다')");
			script.println("history,back()");
			script.println("</script>");
		} else {
			BbsDAO bbsDAO = new BbsDAO();
			int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent()); //정상 입력시 글쓰기 로직 실행
			if (result == -1) { //데이터베이스 오류
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기 실패')");
				script.println("history.back()");
				script.println("</script>");
			} else { //글쓰기 정상 수행 후 알림창 띄우고 게시판목록화면으로 이동
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글쓰기 완료')");
				script.println("location.href='bbs.jsp'");
				script.println("</script>");
			}
		}
	}
	%>
</body>
</html>