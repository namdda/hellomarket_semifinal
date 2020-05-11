package User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.websocket.Session;

public class UserDAO {

	public UserDAO() {
		
	}
	
	public int login(String user_email,String user_pwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String pass =null;
		String sql = "SELECT MD5(?)";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_pwd);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				pass = rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println(pass);
		sql = "SELECT user_pwd FROM userlist WHERE user_email=?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString("user_pwd").equals(pass)) {
					return 1;
				}	
				else return 0;
			}
			return -1;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -2;
	}
	public UserDTO profile(String userId) {
		UserDTO userDTO = new UserDTO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT user_prof,seller_level,user_ph from userlist where user_email = ?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				userDTO.setUserProf(rs.getString("user_prof"));
				userDTO.setSellerLevel(rs.getInt("seller_level"));
				userDTO.setUserPh(rs.getInt("user_ph"));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return userDTO;
	}
	
	public void changeProfile(String userId,String changeProf) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "UPDATE userlist set user_prof =? where user_email =?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, changeProf);
			pstmt.setString(2, userId);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void changePic(String userNick) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "UPDATE userlist set user_pic=? where user_nick =?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userNick);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void changePhone(String userId,int changePhone) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "UPDATE userlist set user_ph =? where user_email =?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, changePhone);
			pstmt.setString(2, userId);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public String selectUserNick(String user_email) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String userNick;
		String sql = "SELECT user_nick FROM userlist WHERE user_email=?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user_email);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				userNick = rs.getString(1);
				return userNick;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return "no";
	}
		
	public int join(UserDTO user) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		UserDAO setUser_nick = new UserDAO();
		String sql = "INSERT INTO userlist(user_email,user_pwd,user_nick) values(?,MD5(?),?)";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserId());
			pstmt.setString(2, user.getUserPass());
			pstmt.setString(3, "default");
			pstmt.executeUpdate();
			setUser_nick.set_userNick(user);
			return 0;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return -1;
	}

	public void set_userNick(UserDTO user) {
		int user_idx = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String user_nick = "";
		String sql = "select user_idx from userlist where user_email=?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserId());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				user_idx = rs.getInt(1);
				user_nick = "n"+100000+user_idx;
				user.setUserNick(user_nick);
				user.setUserIdx(user_idx);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		sql ="update userlist set user_nick=? where user_idx=?";
		try {
			conn= Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserNick());
			pstmt.setInt(2, user.getUserIdx());
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public void changeUserNick(String userId,String changeNick) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "UPDATE userlist set user_nick = ? where user_email=?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, changeNick);
			pstmt.setString(2, userId);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int user_coupon(String userId) {
		int couponIdx=0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "Select coupon_idx from userlist where user_email = ?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				couponIdx = rs.getInt("coupon_idx");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return couponIdx;
	}
	
	public int getUser_level(String userNick) {
		int userLevel = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "Select seller_level from userlist where user_nick = ?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userNick);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				userLevel = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return userLevel;
	}
	
	public int getUserIdx(String userNick) {
		int user_idx = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select user_idx from userlist where user_nick=?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userNick);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				user_idx = rs.getInt(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return user_idx;
}
	public UserDTO getUserInfo(int userIdx) {
		UserDTO userDTO = new UserDTO();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select user_nick,user_prof,seller_star,seller_level,user_following,user_follower from userlist where user_idx=?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, userIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				userDTO.setUserNick(rs.getString("user_nick"));
				userDTO.setUserProf(rs.getString("user_prof"));
				userDTO.setSellerStar(rs.getInt("seller_star"));
				userDTO.setSellerLevel(rs.getInt("seller_level"));
				userDTO.setUserFollowing(rs.getInt("user_following"));
				userDTO.setUserFollower(rs.getInt("user_follower"));
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return userDTO;
		
	}
}
