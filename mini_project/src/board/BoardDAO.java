package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class BoardDAO {
	private static BoardDAO boardDAO = null;
	private static Logger logger = LoggerFactory.getLogger(BoardDAO.class);
	
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
			Class.forName("net.sf.log4jdbc.DriverSpy");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private Connection getConnection() throws SQLException {
		return DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","mini","mini");
	}
	
	
	// board_selete DAO
	// t_board 목록 가져오기(bbs.jsp)
	public List<BoardDTO> board_selete() {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		StringBuffer sql = new StringBuffer();
		sql.append(" select no, title, user_id, regdate ");
		sql.append(" from   t_board");
		sql.append(" order by no desc");

		try(Connection conn = getConnection();
				PreparedStatement pstmt =  conn.prepareStatement(sql.toString())){
			
			try(ResultSet rs = pstmt.executeQuery()) {
				while (rs.next()) { // 입력한 아이디에 해당하는 비번이 있는경우
					BoardDTO boardDTO = new BoardDTO();
					boardDTO.setNo(rs.getLong("no"));
					boardDTO.setTitle(rs.getString("title"));
					boardDTO.setUser_id(rs.getString("user_id"));
					boardDTO.setRegdate(rs.getDate("regdate"));
					list.add(boardDTO);
			}
				
			}
		}catch(Exception e){
				e.printStackTrace();
		}
		return list;
	}
	//게시글 상세보기
	public BoardDTO getView(long no) {
		BoardDTO boardDTO = null;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" select no, title, user_id, regdate, content");
		sql.append(" from   t_board");
		sql.append(" where  no = ?");
		
		try (Connection conn = getConnection();
			PreparedStatement pstmt = 
				conn.prepareStatement(sql.toString())){
			pstmt.setLong(1, no);
			try (ResultSet rs = pstmt.executeQuery()) {
			
				if(rs.next()){
					boardDTO = new BoardDTO();
					boardDTO.setNo(rs.getLong("no"));
					boardDTO.setTitle(rs.getString("title"));
					boardDTO.setUser_id(rs.getString("user_id"));
					boardDTO.setRegdate(rs.getDate("regdate"));
					boardDTO.setContent(rs.getString("content"));
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		return boardDTO;
	}
	
	// 게시글 작성하기
	public boolean writeBoard(BoardDTO boardDTO) {
		boolean result = false;
		
		StringBuffer sql = new StringBuffer();
		sql.append(" insert into t_board(no, title, content, user_id)");
		sql.append(" values(t_board_no_seq.nextval, ?, ?, ?)");
		
		try(Connection conn = getConnection();
				PreparedStatement pstmt = conn.prepareStatement(sql.toString())){
			
			pstmt.setString(1, boardDTO.getTitle());
			pstmt.setString(2, boardDTO.getContent());
			pstmt.setString(3, boardDTO.getUser_id());
			
			if(pstmt.executeUpdate() > 0) {
				result = true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	// 게시글 수정하기
		public boolean updateBoard(BoardDTO boardDTO) {
			boolean result = false;
			
			StringBuffer sql = new StringBuffer();
			sql.append(" update t_board set");
			sql.append("        title  = ?");
			sql.append("       ,content= ?");
			sql.append(" where  no = ?");
			
			try (Connection conn = getConnection();
				PreparedStatement pstmt = 
					conn.prepareStatement(sql.toString())){

				pstmt.setString(1, boardDTO.getTitle());
				pstmt.setString(2, boardDTO.getContent());
				pstmt.setLong(3, boardDTO.getNo());

				if (pstmt.executeUpdate() > 0) {
					result = true;
				}
			} catch(Exception e) {
				e.printStackTrace();
			} 
			return result;
		}
		
	// 게시글 삭제하기
		public boolean deleteBoard(BoardDTO boardDTO) {
			boolean result = false;

			StringBuffer sql= new StringBuffer();
			sql.append(" delete t_board");
			sql.append(" where  no = ?");
			sql.append(" and	title = ?");
			
			try (Connection conn = getConnection();
				PreparedStatement pstmt = 
					conn.prepareStatement(sql.toString())){
				
				pstmt.setLong(1, boardDTO.getNo());
				pstmt.setString(2, boardDTO.getTitle());
				if(pstmt.executeUpdate() > 0) {
					result = true;
				}
			} catch(Exception e) {
				e.printStackTrace();
			} 
			return result;
		}
		
}