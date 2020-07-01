package attendance;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import board.BoardDAO;

public class AttDAO {
   private static AttDAO attDAO = null;
   private static Logger logger = LoggerFactory.getLogger(BoardDAO.class);

//  싱글톤 패턴 적용
   public static AttDAO getInstance() {
      if(attDAO == null) {
         attDAO = new AttDAO(); 
      }
      return attDAO;
   }
// oracle 연결!!
   private AttDAO() {
      try {
         Class.forName("net.sf.log4jdbc.DriverSpy");
      } catch (Exception e) {
         e.printStackTrace();
      }
   }
   
   private Connection getConnection() throws SQLException {
      return DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","mini","mini");
   }


//   check_action DAO
   public boolean check(AttDTO attDTO) {
      boolean result = false;
      
      StringBuffer sql = new StringBuffer();
      sql.append(" insert into t_attendance(user_id, attendance)");
      sql.append(" values(?, ?)");
      
      try(Connection conn = getConnection();
         PreparedStatement pstmt =  conn.prepareStatement(sql.toString())){
         pstmt.setString(1, attDTO.getUser_id());
         pstmt.setString(2, attDTO.getAttendance());
         
         if (pstmt.executeUpdate() > 0) { // 정상수행이면 1로 return 한다.
            result = true;
         }
      }catch(Exception e){
            e.printStackTrace();
      }
      return result; // 데이터베이스 오류
   }
}