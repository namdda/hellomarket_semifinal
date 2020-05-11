package Comment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import User.Dbconn;

public class CommentDAO {
	
	public CommentDAO() {
		
	}
	
	public List<CommentDTO> insertComment(int pIdx,String userNick,String c_content) {
		List<CommentDTO> commentDTO = new ArrayList<CommentDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "INSERT INTO item_comment(p_idx,user_nick,c_content) VALUES(?,?,?)";
		try {
			CommentDTO comment = new CommentDTO();
			conn =Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pIdx);
			pstmt.setString(2, userNick);
			pstmt.setString(3, c_content);
			pstmt.executeUpdate();
			comment.setpIdx(pIdx);
			comment.setUserNick(userNick);
			comment.setcContent(c_content);
			commentDTO.add(comment);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return commentDTO;
	}
	
	public List<CommentDTO> getCommentList(int pIdx){
		List<CommentDTO> comment = new ArrayList<CommentDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT c_idx,user_nick,c_content,c_date from item_comment where p_idx = ?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pIdx);
			rs =pstmt.executeQuery();
			while(rs.next()) {
				CommentDTO commentDTO = new CommentDTO();
				commentDTO.setcIdx(rs.getInt("c_idx"));
				commentDTO.setUserNick(rs.getString("user_nick"));
				commentDTO.setcContent(rs.getString("c_content"));
				int commentTime = Integer.parseInt(rs.getString("c_date").substring(11, 13));
				String timeType = "오전";
				if(commentTime >= 12) {
					timeType ="오후";
					commentTime -=12;
				}
				commentDTO.setcDate(rs.getString("c_date").substring(5,11)+" "+ timeType + " " + commentTime + ":" + rs.getString("c_date").substring(14,16)+ " ");
				comment.add(commentDTO);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return comment;
	}
	


	public int getCmtCnt(int pIdx) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		String sql = "SELECT COUNT(c_idx) from item_comment where p_idx = ?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pIdx);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
		
	}
	
}
