package Board;

import java.util.Arrays;

public class BoardDTO {
	private int p_idx;
	   private String userNick;
	   private String user_email;
	   private String [] deal_m1;
	   
	   String dealstr = "";
	   String deliverstr = "";
	   
	   private String p_image1_path;
	   private String p_image1_orig_name;
	   private String p_title;
	   private String p_m_category;
	   private String p_s_category;
	   private String p_description;
	   private String p_trade_kind;
	   private String p_price;
	   private String[] p_delivery;
	  // private String p_exchange;
	   private String p_status1;
	   //private String p_status2;
	   private String p_transac_loc;

	   private String member_nick;
	   private String member_level;
	   private String member_star;
	   private int p_like;
	   private String p_regist_date;
	    
	    
		public int getP_idx() {
			return p_idx;
		}
		public void setP_idx(int p_idx) {
			this.p_idx = p_idx;
		}
		public String getUser_email() {
			return user_email;
		}
		public void setUser_email(String user_email) {
			this.user_email = user_email;
		}
		
		public String getUserNick() {
			return userNick;
		}
		public void setUserNick(String userNick) {
			this.userNick = userNick;
		}
		
		public String getP_regist_date() {
			return p_regist_date;
		}
		public void setP_regist_date(String p_regist_date) {
			this.p_regist_date = p_regist_date;
		}
		
		
		public String[] getDeal_m1() {
			return deal_m1;
		}
		public void setDeal_m1(String[] deal_m1) {
			this.deal_m1 = deal_m1;
			
			
			for(int i=0; i<deal_m1.length; i++){
				dealstr = dealstr + deal_m1[i] + " "; 
			}
		}
		
		
		
		public String getP_image1_path() {
			return p_image1_path;
		}
		public void setP_image1_path(String p_image1_path) {
			this.p_image1_path = p_image1_path;
		}
		
		public String getP_image1_orig_name() {
			return p_image1_orig_name;
		}
		public void setP_image1_orig_name(String p_image1_orig_name) {
			this.p_image1_orig_name = p_image1_orig_name;
		}

		public String getP_title() {
			return p_title;
		}
		public void setP_title(String p_title) {
			this.p_title = p_title;
		}
		public String getP_m_category() {
			return p_m_category;
		}
		public void setP_m_category(String p_m_category) {
			this.p_m_category = p_m_category;
		}
		public String getP_s_category() {
			return p_s_category;
		}
		public void setP_s_category(String p_s_category) {
			this.p_s_category = p_s_category;
		}
		public String getP_description() {
			return p_description;
		}
		public void setP_description(String p_description) {
			this.p_description = p_description;
		}
		public String getP_trade_kind() {
			return p_trade_kind;
		}
		public void setP_trade_kind(String p_trade_kind) {
			this.p_trade_kind = p_trade_kind;
		}
		public String getP_price() {
			return p_price;
		}
		public void setP_price(String p_price) {
			this.p_price = p_price;
		}
		public String[] getP_delivery() {
			return p_delivery;
		}
		public void setP_delivery(String[] p_delivery) {
			this.p_delivery = p_delivery;
			
			for(int j=0; j<p_delivery.length; j++){
				deliverstr = deliverstr + p_delivery[j] + " "; 
			}
			
		}

		public String getP_status1() {
			return p_status1;
		}
		public void setP_status1(String p_status1) {
			this.p_status1 = p_status1;
		}

		public String getP_transac_loc() {
			return p_transac_loc;
		}
		public void setP_transac_loc(String p_transac_loc) {
			this.p_transac_loc = p_transac_loc;
		}
		public String getMember_nick() {
			return member_nick;
		}
		public void setMember_nick(String member_nick) {
			this.member_nick = member_nick;
		}
		public String getMember_level() {
			return member_level;
		}
		public void setMember_level(String member_level) {
			this.member_level = member_level;
		}
		public String getMember_star() {
			return member_star;
		}
		public void setMember_star(String member_star) {
			this.member_star = member_star;
		}
		
		public int getP_like() {
		 	return p_like;
		 }
		 public void setP_like(int p_like) {
		 	this.p_like = p_like;
		 }
		 
		 
		 
		 
		public String getDealstr() {
			return dealstr;
		}
		public void setDealstr(String dealstr) {
			this.dealstr = dealstr;
		}
		public String getDeliverstr() {
			return deliverstr;
		}
		public void setDeliverstr(String deliverstr) {
			this.deliverstr = deliverstr;
		}
		@Override
		public String toString() {
			return "MyBoardDTO [p_idx=" + p_idx + ", userNick=" + userNick + ", user_email=" + user_email + ", deal_m1="
					+ Arrays.toString(deal_m1) + ", p_image1_path=" + p_image1_path + ", p_image1_orig_name="
					+ p_image1_orig_name + ", p_title=" + p_title + ", p_m_category=" + p_m_category + ", p_s_category="
					+ p_s_category + ", p_description=" + p_description + ", p_trade_kind=" + p_trade_kind
					+ ", p_price=" + p_price + ", p_delivery=" + Arrays.toString(p_delivery) + ", p_status1="
					+ p_status1 + ", p_transac_loc=" + p_transac_loc + ", member_nick=" + member_nick
					+ ", member_level=" + member_level + ", member_star=" + member_star + ", p_like=" + p_like
					+ ", p_regist_date=" + p_regist_date + "]";
		}

    

   
}