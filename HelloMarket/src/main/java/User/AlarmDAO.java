package User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;



public class AlarmDAO {
	
	public AlarmDAO(){}
	
	
	public AlarmDTO Showalarm() { //알람 내용 보여주는 함수 
		AlarmDTO alarmDTO = new AlarmDTO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT a_title, a_terms from alarm";
		try {
			conn= Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while(rs.next()) {
				alarmDTO.setAlarmName(rs.getString("a_title"));
				alarmDTO.setAlarmTerms(rs.getString("a_terms"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return alarmDTO;
	}
	
	public int  AlarmNum(String userId) {// 초기 알람수 보여주기
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int alarmCount=0;
		
		String sql = "SELECT alarm_count from userlist where user_email=?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				alarmCount = rs.getInt("alarm_count");
			}
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return alarmCount;
	}
		
	public void AlarmZero(String userId) { 
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		
		try {
			conn = Dbconn.getConnection();
			String sql = "update userlist set alarm_count='0' where user_email =?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}