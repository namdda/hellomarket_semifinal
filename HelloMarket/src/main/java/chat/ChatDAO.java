package chat;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import User.Dbconn;

public class ChatDAO {

	public void sendChat(String toNick,String fromNick,String cContent) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO chat_list(to_nick,from_nick,c_content) values(?,?,?)";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, toNick);
			pstmt.setString(2, fromNick);
			pstmt.setString(3, cContent);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<ChatDTO> thisChat(String toNick,String fromNick) throws SQLException {
		List<ChatDTO> chatHistory = new ArrayList<ChatDTO>();
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT c_idx,to_nick,from_nick,c_content,c_time from chat_list where ((from_nick=? AND to_nick=?) OR (from_nick=? AND to_nick=?)) ORDER BY c_time";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fromNick);
			pstmt.setString(2, toNick);
			pstmt.setString(3, toNick);
			pstmt.setString(4, fromNick);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ChatDTO chatDTO = new ChatDTO();
				chatDTO.setcIdx(rs.getInt("c_idx"));
				chatDTO.setToNick(rs.getString("to_nick"));
				chatDTO.setFromNick(rs.getString("from_nick"));
				chatDTO.setcContent(rs.getString("c_content").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt").replaceAll("\n", "<br>"));
				int chatTime = Integer.parseInt(rs.getString("c_time").substring(11, 13));
				String timeType = "오전";
				if(chatTime >= 12) {
					timeType ="오후";
					chatTime -=12;
				}
				chatDTO.setcTime(timeType + " " + chatTime + ":" + rs.getString("c_time").substring(14,16)+ " ");
				chatHistory.add(chatDTO);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			conn.close();
			pstmt.close();
			rs.close();
		}
		return chatHistory;
	}
	
	public List<ChatDTO> userChatList(String fromNick) throws SQLException {
		List<ChatDTO> chatHistory = new ArrayList<ChatDTO>();
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select c_idx,to_nick,from_nick,c_content,c_time from chat_list where c_idx in(SELECT MAX(c_idx) from chat_list where to_nick= ? OR from_nick= ? GROUP BY from_nick,to_nick);";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fromNick);
			pstmt.setString(2, fromNick);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ChatDTO chatDTO = new ChatDTO();
				chatDTO.setcIdx(rs.getInt("c_idx"));
				chatDTO.setToNick(rs.getString("to_nick"));
				chatDTO.setFromNick(rs.getString("from_nick"));
				chatDTO.setcContent(rs.getString("c_content").replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt").replaceAll("\n", "<br>"));
				int chatTime = Integer.parseInt(rs.getString("c_time").substring(11, 13));
				String timeType = "오전";
				if(chatTime >= 12) {
					timeType ="오후";
					chatTime -=12;
				}
				chatDTO.setcTime(timeType + " " + chatTime + ":" + rs.getString("c_time").substring(14,16)+ " ");
				chatHistory.add(chatDTO);
			}
			for(int i = 0; i < chatHistory.size();i++) {
				ChatDTO x = chatHistory.get(i);
				for(int j=0;j<chatHistory.size();j++) {
					ChatDTO y = chatHistory.get(j);
					if(x.getFromNick().equals(y.getToNick())&& x.getToNick().equals(y.getFromNick())) {
						if(x.getcIdx() < y.getcIdx()) {
							chatHistory.remove(x);
							i--;
							break;
						}else {
							chatHistory.remove(y);
							j--;
						}
					}
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			if(rs != null) {
				pstmt.close();
				conn.close();
				rs.close();
			}
		}
		return chatHistory;
	}
}
