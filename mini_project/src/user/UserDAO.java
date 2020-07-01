package user;

// DAO: 모든 action 기능이 들어감! (데이터베이스 연동!)

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import board.BoardDAO;
import board.BoardDTO;


public class UserDAO {
	private static UserDAO userDAO = null;
	private static Logger logger = LoggerFactory.getLogger(BoardDAO.class);

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
			Class.forName("net.sf.log4jdbc.DriverSpy");
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
	// 회원가입!
		public boolean join(UserDTO userDTO) {
				
			boolean result = false;
			StringBuffer sql = new StringBuffer();
			sql.append(" insert into T_USER(user_id, user_pw, user_name, user_gender, user_email, user_birthdate, user_phone, user_postcode, user_addr, user_detailaddr, user_extraaddr)");
			sql.append(" values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			
			try(Connection conn = getConnection();
					PreparedStatement pstmt =  conn.prepareStatement(sql.toString())){
				pstmt.setString(1, userDTO.getUser_id());
				pstmt.setString(2, userDTO.getUser_pw());
				pstmt.setString(3, userDTO.getUser_name());
				pstmt.setString(4, userDTO.getUser_gender());
				pstmt.setString(5, userDTO.getUser_email());
				pstmt.setString(6, userDTO.getUser_birthdate());
				pstmt.setString(7, userDTO.getUser_phone());
				pstmt.setString(8, userDTO.getUser_postcode());
				pstmt.setString(9, userDTO.getUser_addr());
				pstmt.setString(10, userDTO.getUser_detailaddr());
				pstmt.setString(11, userDTO.getUser_extraaddr());
				
				if (pstmt.executeUpdate() > 0) { // 정상수행이면 1로 return 한다.
					result = true;
				}

			}catch(Exception e){
					e.printStackTrace();
			}
			return result; // 데이터베이스 오류
		}
	
	// 회원정보 보기
		public UserDTO getUser(String user_id) {
			UserDTO userDTO=null;
			
			StringBuffer sql = new StringBuffer();
			sql.append(" select *");
			sql.append(" from t_user");
			sql.append(" where user_id=?");
			
			try (Connection conn = getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql.toString())){
				
				pstmt.setString(1, user_id);
				try (ResultSet rs = pstmt.executeQuery()) {
					if(rs.next()){
						userDTO = new UserDTO();
						userDTO.setUser_id(rs.getString("user_id"));
						userDTO.setUser_pw(rs.getString("user_pw"));
						userDTO.setUser_name(rs.getString("user_name"));
						userDTO.setUser_gender(rs.getString("user_gender"));
						userDTO.setUser_email(rs.getString("user_email"));
						userDTO.setUser_birthdate(rs.getString("user_birthdate"));
						userDTO.setUser_phone(rs.getString("user_phone"));
						userDTO.setUser_postcode(rs.getString("user_postcode"));
						userDTO.setUser_addr(rs.getString("user_addr"));
						userDTO.setUser_detailaddr(rs.getString("user_detailaddr"));
						userDTO.setUser_extraaddr(rs.getString("user_extraaddr"));
					}
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		return userDTO;
	}
		
	// 회원관리수정
		public boolean updateUser(UserDTO userDTO) {
			boolean result = false;
			
			StringBuffer sql = new StringBuffer();
			sql.append(" update t_user set");
			sql.append(" 		user_name=?");
			sql.append(" 	   ,user_gender=?");
			sql.append(" 	   ,user_email=?");
			sql.append(" 	   ,user_birthdate=?");
			sql.append(" 	   ,user_phone=?");
			sql.append(" 	   ,user_postcode=?");
			sql.append(" 	   ,user_addr=?");
			sql.append(" 	   ,user_detailaddr=?");
			sql.append(" 	   ,user_extraaddr=?");
			sql.append(" where user_id=?");
			
			try(Connection conn = getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql.toString())){
				pstmt.setString(1, userDTO.getUser_name());
				pstmt.setString(2, userDTO.getUser_gender());
				pstmt.setString(3, userDTO.getUser_email());
				pstmt.setString(4, userDTO.getUser_birthdate());
				pstmt.setString(5, userDTO.getUser_phone());
				pstmt.setString(6, userDTO.getUser_postcode());
				pstmt.setString(7, userDTO.getUser_addr());
				pstmt.setString(8, userDTO.getUser_detailaddr());
				pstmt.setString(9, userDTO.getUser_extraaddr());
				pstmt.setString(10, userDTO.getUser_id());
				
				if (pstmt.executeUpdate() > 0) {
					result = true;
				}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return result;
		}
		
	//회원탈퇴
		public boolean deleteUser(UserDTO userDTO) {
			boolean result = false;
			StringBuffer sql = new StringBuffer();
			sql.append(" delete t_user");
			sql.append(" where user_id = ?");
			
			try (Connection conn = getConnection();
					PreparedStatement pstmt = conn.prepareStatement(sql.toString())){
				pstmt.setString(1, userDTO.getUser_id());
//				pstmt.setString(2, userDTO.getUser_pw());
				
				if(pstmt.executeUpdate() > 0) {
					result = true;
				}
			} catch(Exception e) {
				e.printStackTrace();
			} 
		return result;
	}
		
	// 회원가입시 중복아이디 미리 확인!
		public boolean isExistUser_id(String user_id) { 
			boolean result = false;
			StringBuffer sql = new StringBuffer();
			sql.append(" select 'false' ");
			sql.append(" from   t_user");
			sql.append(" where  user_id=?");

			try(Connection conn = getConnection();
					PreparedStatement pstmt =  conn.prepareStatement(sql.toString())){
				pstmt.setString(1, user_id);
				
				try(ResultSet rs = pstmt.executeQuery()) {
					if (!rs.next()) { 
						result=true;
					}
				}
			}catch(Exception e){
					e.printStackTrace();
			}
			return result; 
		}
}
			
