package User;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Dbconn {
	private static Connection conn = null;
	private Dbconn() { }
	
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mariadb://127.0.0.1:3306/helloMarket", "root", "1234");
		return conn;
	}
	
	public static void close(Connection conn, PreparedStatement pstmt) {
		try {
			if(pstmt != null) { pstmt.close(); }
		}catch(Exception e) {e.printStackTrace();}
		try {
			if(conn != null) { conn.close(); }
		}catch(Exception e) {e.printStackTrace();}
	}

	public static void close(Connection conn, PreparedStatement pstmt, ResultSet rs) {
		try {
			if(rs != null) { rs.close(); }
		}catch(Exception e) {e.printStackTrace();}
		close(conn, pstmt);
	}
}
