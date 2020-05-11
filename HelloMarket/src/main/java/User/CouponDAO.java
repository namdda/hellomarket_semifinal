package User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CouponDAO {
	
	public CouponDAO() {
		
	}
	
	public List<CouponDTO> showCouponList() {
		List<CouponDTO> coupon = new ArrayList<CouponDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql = "SELECT coupon_name,coupon_price,coupon_terms,c_idx from coupon order by c_idx";
		try {
			conn = Dbconn.getConnection();
			pstmt= conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				CouponDTO couponDTO = new CouponDTO();
				couponDTO.setCouponName(rs.getString("coupon_name"));
				couponDTO.setCouponPrice(rs.getInt("coupon_price"));
				couponDTO.setCouponTerms(rs.getString("coupon_terms"));
				couponDTO.setCouponIdx(rs.getInt("c_idx"));
				coupon.add(couponDTO);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return coupon;
	}
	
	
	public int userCouponList(String userId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int couponCount =0;
		String sql = "SELECT coupon_count from userlist where user_email = ?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				couponCount = rs.getInt("coupon_count");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return couponCount;
	}
	
	public CouponDTO showReceivedCoupon(int index){
		CouponDTO coupon = new CouponDTO();
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		String sql = "SELECT coupon_name,coupon_price,coupon_terms from coupon where c_idx = ?";
		try {
			conn= Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, index);
			rs = pstmt.executeQuery();
				while(rs.next()) {
					CouponDTO couponDTO = new CouponDTO();
					couponDTO.setCouponName(rs.getString("coupon_name"));
					couponDTO.setCouponPrice(rs.getInt("coupon_price"));
					couponDTO.setCouponTerms(rs.getString("coupon_terms"));
					coupon = couponDTO;
				}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		System.out.println(coupon);
		return coupon;
	}
	public CouponDTO choicedCoupon(int index,String userId){
		CouponDTO coupon = new CouponDTO();
		Connection conn = null;
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		String sql = "SELECT coupon_name,coupon_price,coupon_terms,c_idx from coupon where c_idx = ?";
		try {
			conn= Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, index);
			rs = pstmt.executeQuery();
				while(rs.next()) {
					CouponDTO couponDTO = new CouponDTO();
					couponDTO.setCouponName(rs.getString("coupon_name"));
					couponDTO.setCouponPrice(rs.getInt("coupon_price"));
					couponDTO.setCouponTerms(rs.getString("coupon_terms"));
					couponDTO.setCouponIdx(rs.getInt("c_idx"));
					coupon = couponDTO;
				}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		sql = "UPDATE userlist set coupon_idx=? where user_email = ?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, index);
			pstmt.setString(2, userId);
			boolean exe = pstmt.execute();
			if(exe) {
				System.out.println("성공");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return coupon;
	}
	
}
