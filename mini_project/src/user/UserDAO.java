package user;

// DAO: 모든 action 기능이 들어감! (데이터베이스 연동!)

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class UserDAO {
	private static UserDAO userDAO = null;

//  싱글톤 패턴 적용
	public static UserDAO getInstance() {
		if(userDAO == null) {
			userDAO = new UserDAO(); 
		}
		return userDAO;
	}
// oracle 연결!!
	private UserDAO() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private Connection getConnection() throws SQLException {
		return DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","mini","mini");
	}
	
	
	// login_action DAO
	public int loginCheck(String user_id, String user_pw) {
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select user_pw");
		sql.append(" from   t_user");
		sql.append(" where  user_id=?");

		try(Connection conn = getConnection();
				PreparedStatement pstmt =  conn.prepareStatement(sql.toString())){
			
			pstmt.setString(1, user_id);
			
			try(ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) { // 입력한 아이디에 해당하는 비번이 있는경우
					return 1;
				} else {
					return 0;
				}
			}catch (Exception e) {
				e.printStackTrace();
			}
		}catch(Exception e){
				e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}

	
}
