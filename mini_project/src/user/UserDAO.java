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
	public UserDTO loginCheck(UserDTO userDTO) {
		UserDTO userInfo = null;
		StringBuffer sql = new StringBuffer();
		sql.append(" select user_id, user_name");
		sql.append(" from   t_user");
		sql.append(" where  user_id=? and user_pw=?");

		try(Connection conn = getConnection();
				PreparedStatement pstmt =  conn.prepareStatement(sql.toString())){
			pstmt.setString(1, userDTO.getUser_id());
			pstmt.setString(2, userDTO.getUser_pw());
			
			try(ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) { // 입력한 아이디에 해당하는 비번이 있는경우
					userInfo = new UserDTO();
					userInfo.setUser_id(rs.getString("user_id"));
					userInfo.setUser_name(rs.getString("user_name"));
				}
			}
		}catch(Exception e){
				e.printStackTrace();
		}
		return userInfo; // 데이터베이스 오류
	}

		public boolean join(UserDTO userDTO) {
			
			boolean result = false;
			StringBuffer sql = new StringBuffer();
			sql.append(" insert into T_USER(user_id, user_pw, user_name, user_gender, user_email, user_birthdate, user_phone, user_addr)");
			sql.append(" values(?, ?, ?, ?, ?, ?, ?, ?)");
			
			try(Connection conn = getConnection();
					PreparedStatement pstmt =  conn.prepareStatement(sql.toString())){
				pstmt.setString(1, userDTO.getUser_id());
				pstmt.setString(2, userDTO.getUser_pw());
				pstmt.setString(3, userDTO.getUser_name());
				pstmt.setString(4, userDTO.getUser_gender());
				pstmt.setString(5, userDTO.getUser_email());
				pstmt.setString(6, userDTO.getUser_birthdate());
				pstmt.setString(7, userDTO.getUser_phone());
				pstmt.setString(8, userDTO.getUser_addr());
				if (pstmt.executeUpdate() > 0) { // 정상수행이면 1로 return 한다.
					result = true;
				}

			}catch(Exception e){
					e.printStackTrace();
			}
			return result; // 데이터베이스 오류
		}
			
		
	
}
