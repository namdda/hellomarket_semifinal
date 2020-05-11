package Board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import User.Dbconn;

public class MyBoardDAO {
	
	private Connection conn;
	   private PreparedStatement pstmt;
	   private ResultSet rs;
	   DataSource ds;
	   
	   public MyBoardDAO() {
	      try {
	         conn = Dbconn.getConnection();
	      } catch (Exception e) {
	         e.printStackTrace();
	      }
	   }
	   
	      
	   public int registBoard(MyBoardDTO myboarddto) {
		   
		      try {
		    	 conn = Dbconn.getConnection();
		    	 String deal = "";
		    	 deal = deal.replaceAll("null","");
		    	 String sql = "insert into mysellboard(user_nick, deal_m1, p_image1_path, p_image1_orig_name, p_title, p_m_catagory, p_s_catagory, p_description, p_trade_kind, p_price, p_delivery, p_status1, p_transac_loc) " + 
				            "values (?,?,?,?,?,?,?,?,?,?,?,?,?)";
		    	 
		         pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
		         
		         pstmt.setString(1, myboarddto.getUserNick());
		         pstmt.setString(2, myboarddto.dealstr);
		         pstmt.setString(3, myboarddto.getP_image1_path());
		         pstmt.setString(4, myboarddto.getP_image1_orig_name());
		         pstmt.setString(5, myboarddto.getP_title());
		         pstmt.setString(6, myboarddto.getP_m_category());
		         pstmt.setString(7, myboarddto.getP_s_category());
		         pstmt.setString(8, myboarddto.getP_description());
		         pstmt.setString(9, myboarddto.getP_trade_kind());
		         pstmt.setString(10,myboarddto.getP_price());
		         pstmt.setString(11,myboarddto.deliverstr);
		         pstmt.setString(12,myboarddto.getP_status1());
		         pstmt.setString(13,myboarddto.getP_transac_loc());
		         
		         System.out.println(myboarddto.dealstr); // split으로 나누고, 배열로 저장
//		         String calldeal = (String)myboarddto.dealstr;
//		         String[] deal2 = calldeal.split(" ");
//		         String calldeliver = (String)myboarddto.deliverstr;
//		         String[] deliver = calldeliver.split(" ");
		         System.out.println(myboarddto.deliverstr);
		         
		         int rows = pstmt.executeUpdate();
		        
		         ResultSet geneResultKey = pstmt.getGeneratedKeys();
		            if(geneResultKey.next()) {
		            	
		               myboarddto.setP_idx(geneResultKey.getInt(1));
		            }    
		         if(rows>=1) {
			        	 System.out.println("db 성공"); 
			         }
		      
		      } catch (Exception e) {
		         e.printStackTrace();
		         System.out.println("데이터 연결 실패...");
		      }
		return 0;
		     
		   }
		
	   

	    public List<MyBoardDTO> showAllItem(){
	    	List<MyBoardDTO> myboard = new ArrayList<MyBoardDTO>();
	    	Connection conn = null;
	    	PreparedStatement pstmt = null;
	    	ResultSet rs = null;
	    	
	    	try {
	    		conn = Dbconn.getConnection();
	    		String sql ="select p_idx,p_title,p_price,p_image1_orig_name,p_image1_path from mysellboard";
	    		pstmt = conn.prepareStatement(sql);
	    		rs = pstmt.executeQuery();
	    		while(rs.next()) {
	    			MyBoardDTO myboardDTO = new MyBoardDTO();
	    			myboardDTO.setP_idx(rs.getInt("p_idx"));
	    			myboardDTO.setP_title(rs.getString("p_title"));
	    			myboardDTO.setP_price(rs.getString("p_price"));
	    			myboardDTO.setP_image1_orig_name(rs.getString("p_image1_orig_name"));
	    			myboardDTO.setP_image1_path(rs.getString("p_image1_path"));
	    			myboard.add(myboardDTO);
	    		}
	    	}catch(Exception e) {
	    		e.printStackTrace();
	    	}
	    	return myboard;
	    	
	    }
	    public MyBoardDTO showThisItem(int p_idx){
	    	Connection conn = null;
	    	PreparedStatement pstmt = null;
	    	MyBoardDTO myboardDTO = new MyBoardDTO();
	    	ResultSet rs = null;
	    	String userNick = null;
	    	//String deal = null;
	    	String delivery = null;
	    	
	    	try {
	    		conn = Dbconn.getConnection();
	    		String sql = "select p_image1_orig_name,p_title,p_price,p_description,user_nick,p_regist_date,p_transac_loc,p_m_catagory,p_s_catagory,p_status1,p_like,p_delivery,deal_m1 from mysellboard where p_idx=?";
	    		pstmt = conn.prepareStatement(sql);
	    		pstmt.setInt(1, p_idx);
	    		rs = pstmt.executeQuery();
	    		while(rs.next()) {
	    			myboardDTO.setP_image1_orig_name(rs.getString("p_image1_orig_name"));
	    			myboardDTO.setP_title(rs.getString("p_title"));
	    			myboardDTO.setP_price(rs.getString("p_price"));
	    			myboardDTO.setP_description(rs.getString("p_description"));
	    			myboardDTO.setUserNick(rs.getString("user_nick"));
	    			userNick = rs.getString("user_nick");
	    			myboardDTO.setP_regist_date(rs.getString("p_regist_date"));
	    			myboardDTO.setP_transac_loc(rs.getString("p_transac_loc"));
	    			myboardDTO.setP_m_category(rs.getString("p_m_catagory"));
	    			myboardDTO.setP_s_category(rs.getString("p_s_catagory"));
	    			myboardDTO.setP_status1(rs.getString("p_status1"));
	    			myboardDTO.setP_like(rs.getInt("p_like"));
	    			
			        String[] deliver = rs.getString("p_delivery").split(" "); //length 만큼 보여주게 하기... 
	    			myboardDTO.setP_delivery(deliver);
	    			
	    			String[] deal = rs.getString("deal_m1").split(" ");
	    			myboardDTO.setDeal_m1(deal); // 뭐 어떻게 넣기는 했는데 그 다음에 어떻게 해야할지 모르겠따 
	    			
	    		}
	    	}catch(Exception e) {
	    		e.printStackTrace();
	    	}
	    	return myboardDTO;
	    }
	    
	    public int showUserItemCnt(String userNick) {
	    	Connection conn = null;
	    	PreparedStatement pstmt = null;
	    	MyBoardDTO myboardDTO = new MyBoardDTO();
	    	ResultSet rs = null;
	    	int cnt = 0;
	    	String sql = "SELECT COUNT(user_nick) FROM mysellboard where user_nick = ?";
	    	try {
	    		conn = Dbconn.getConnection();
	    		pstmt= conn.prepareStatement(sql);
	    		pstmt.setString(1, userNick);
	    		rs = pstmt.executeQuery();
	    		if(rs.next()) {
	    			cnt = rs.getInt(1);
	    		}
	    		
	    	}catch(Exception e) {
	    		e.printStackTrace();
	    	}
	    	return cnt;
	    }
	    
	    public List<BoardDTO> showUserItem(String userNick) {
	    	Connection conn = null;
	    	PreparedStatement pstmt = null;
	    	List<BoardDTO> board = new ArrayList<BoardDTO>();
	    	ResultSet rs = null;
	    	String sql = "SELECT p_idx,p_image1_orig_name,p_title,p_price FROM mysellboard where user_nick = ?";
	    	try {
	    		conn = Dbconn.getConnection();
	    		pstmt = conn.prepareStatement(sql);
	    		pstmt.setString(1, userNick);
	    		rs = pstmt.executeQuery();
	    		while(rs.next()) {
	    			BoardDTO boardDTO = new BoardDTO();
	    			boardDTO.setP_idx(rs.getInt("p_idx"));
	    			boardDTO.setP_image1_orig_name(rs.getString("p_image1_orig_name"));
	    			boardDTO.setP_title(rs.getString("p_title"));
	    			boardDTO.setP_price(rs.getString("p_price"));
	    			board.add(boardDTO);
	    		}
	    	}catch(Exception e) {
	    		e.printStackTrace();
	    	}
	    	return board;
	    }

}
