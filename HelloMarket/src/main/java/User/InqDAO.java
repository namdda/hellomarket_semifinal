package User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class InqDAO {

	public Boolean insertInquiry(InqDTO Inq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		boolean state = false;
		try {
			conn = Dbconn.getConnection();
			conn.setAutoCommit(false);
			String sql = "INSERT INTO inquiry (user_nick, inq_hp, inq_email, inq_type, inq_subtype, inq_title, inq_content) values (?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, Inq.getUserNick());
			pstmt.setInt(2, Inq.getInqHp());
			pstmt.setString(3, Inq.getInqEmail());
			pstmt.setString(4, Inq.getInqType());
			pstmt.setString(5, Inq.getInqSubType());
			pstmt.setString(6, Inq.getInqTitle());
			pstmt.setString(7, Inq.getInqContent());
			
			int rows = pstmt.executeUpdate();
			state = (rows >= 1);
			
			conn.commit();
		}catch (Exception e) {
			e.printStackTrace();
			if(conn != null) {
				try {
					conn.rollback();
				}catch(Exception sqle) {
					sqle.printStackTrace();
				}
			}
		}finally {
			Dbconn.close(conn, pstmt);
		}
		return state;
	}
	
	public List<InqDTO> InqList(String userNick){
		InqDTO inqDTO = new InqDTO();
		List<InqDTO> inqlist = new ArrayList<InqDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT inq_title, inq_type, inq_wait, inq_date FROM inquiry WHERE user_nick=?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userNick);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				String inqTitle = rs.getString(1);
				inqDTO.setInqTitle(inqTitle);
				String inqType = rs.getString(2);
				inqDTO.setInqType(inqType);
				String inqWait = rs.getString(3);
				inqDTO.setInqWait(inqWait);
				String inqDate = rs.getString(4);
				inqDTO.setInqDate(inqDate);
				inqlist.add(inqDTO);
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			Dbconn.close(conn, pstmt, rs);
		}
		return inqlist;
	}
}
