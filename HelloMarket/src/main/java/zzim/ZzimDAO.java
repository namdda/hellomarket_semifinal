package zzim;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import User.Dbconn;

public class ZzimDAO {
	public ZzimDAO() {
		
	}
	
	public void itemZzim(int pIdx,int userIdx,int pLike) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		pLike = pLike+1;
		String sql = "INSERT INTO like_item(p_idx,u_idx) VALUES(?,?)";
		
		try {
			conn =Dbconn.getConnection();
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, pIdx);
			pstmt.setInt(2, userIdx);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		sql = "UPDATE sellboard set p_like =? where p_idx =?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pLike);
			pstmt.setInt(2, pIdx);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void zzimCancel(int pIdx,int userIdx,int pLike) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		pLike = pLike-1;
		String sql = "DELETE FROM like_item where p_idx=? and u_idx=?";
		try {
			conn =Dbconn.getConnection();
			pstmt =conn.prepareStatement(sql);
			pstmt.setInt(1, pIdx);
			pstmt.setInt(2, userIdx);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		sql = "UPDATE sellboard set p_like =? where p_idx =?";
		try {
			conn = Dbconn.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pLike);
			pstmt.setInt(2, pIdx);
			pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
	public List<ZzimDTO> itemZzimed(int pIdx) {
		List<ZzimDTO> list = new ArrayList<ZzimDTO>();
		System.out.println(pIdx);
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "Select u_idx from like_item where p_idx =?";
		try {
			conn = Dbconn.getConnection();
			pstmt= conn.prepareStatement(sql);
			pstmt.setInt(1, pIdx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ZzimDTO ZzimDTO = new ZzimDTO();
				ZzimDTO.setUser_idx(rs.getInt("u_idx"));
				list.add(ZzimDTO);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
