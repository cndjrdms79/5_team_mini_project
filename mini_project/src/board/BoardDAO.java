package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BoardDAO {
	private static BoardDAO boardDAO = null;

//  싱글톤 패턴 적용
	public static BoardDAO getInstance() {
		if(boardDAO == null) {
			boardDAO = new BoardDAO(); 
		}
		return boardDAO;
	}
// oracle 연결!!
	private BoardDAO() {
		try {
			Class.forName("oracle.jdbc.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@SuppressWarnings("unused")
	private Connection getConnection() throws SQLException {
		return DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","mini","mini");
	}
	
	
	// board_selete DAO
	// t_board 목록 가져오기
	public List<BoardDTO> board_selete() {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		StringBuffer sql = new StringBuffer();
		sql.append(" select * ");
		sql.append(" from   t_board");

		try(Connection conn = getConnection();
				PreparedStatement pstmt =  conn.prepareStatement(sql.toString())){
			
			try(ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) { // 입력한 아이디에 해당하는 비번이 있는경우
					BoardDTO boardDTO = new BoardDTO();
					boardDTO.setNo(rs.getInt("no"));
					boardDTO.setTitle(rs.getString("title"));
					boardDTO.setUser_id(rs.getString("user_id"));
					boardDTO.setRegdate(rs.getDate("regdate"));
					list.add(boardDTO);
			}
				
			}catch (Exception e) {
				e.printStackTrace();
			}
		}catch(Exception e){
				e.printStackTrace();
		}
		
		return list;
	}
	
}