package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn; //자바와 데이터베이스를 connection
	private PreparedStatement pstmt; //쿼리문 대기 및 설정 (PreparedStatement = 설정 및 실행)
	private ResultSet rs; //결과값 받아오기
	
	public UserDAO() { //이 연결 코드를 생성자에 입력해두지 않으면 각 기능을 담당하는 메소드마다 모두 똑같은 코드를 입력해줘야한다. 
		try {
			String dbURL = "jdbc:mariadb://133.186.222.241:3306/bbs"; //MariaDB와 연결시켜주는 주소
			String dbID = "redmine"; //MariaDB계정
			String dbPassword = "epdlxjtm123!@#"; //MariaDB비밀번호(지원이 모름)
			Class.forName("org.mariadb.jdbc.Driver"); //JDBC연결 클래스를 'String'타입으로 불러온다.
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword); //드라이버 매니저에 미리 저장했던 연결 URL과 DB계정 정보를 담아 연결 설정을 한다.
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	//로그인 구현 메소드 (로그인 영역)
	public int login(String userID, String userPassword) {
		String sql = "SELECT userPassword FROM USER WHERE userID = ?"; //실제로 db에서 입력할 쿼리문을 'sql'변수에 미리 넣어놓는다.
		try {
			pstmt = conn.prepareStatement(sql); //sql쿼리문 대기 (미리 설정한 'sql'을 셋팅하는 코드)
			pstmt.setNString(1,  userID);//첫번째 '?'에 매개변수로 받아온 userID를 대입한다.
			rs = pstmt.executeQuery(); //셋팅이 끝난 쿼리문의 실행 결과값을 'rs'변수에 저장한다.
			if (rs.next()) { //rs.next()를 실행했을 때 결과값이 존재한다면 해당 결과값을 얻을 수 있다. (없으면 false -> return -1)
				if (rs.getNString(1).equals(userPassword)) {
					return 1; //결과값이 존재하고 (상위 if문의 true조건), 그 결과값이 매개변수로 넘어온 'userPassword'와 일치한다. -> 로그인 성공, return1
				}
				else
					return 0; //결과값이 존재하지만(id가 존재), 그 결과값이 매개변수로 넘어온 'userPassword'와 일치하지 않는다. (비밀번호 틀림), return 0
			}
			return -1; //쿼리문을 실행했지만 결과값이 나오지 않았다. (아이디 존재하지 않음) return -1
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //실행 오류
	}
	
	public int join(User user) {
		String sql = "insert into USER values(?, ?, ?, ?, ?)"; //'user'테이블에 데이터를 입력하기 위한 쿼리문
		try {
			pstmt = conn.prepareStatement(sql); //sql 쿼리문을 대기 시킨다.
			pstmt.setString(1, user.getUserID()); //각각의 물음표 자리에 사용자가 입력한 내용을 셋팅
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate(); //실제 DB에서 insert를 정상적으로 입력하면 Query 1 OK라고 뜨는데 그 숫자를 받아온다.(정상 입력이라면 1이상의 숫자가 리턴될것이라는 뜻)
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}
