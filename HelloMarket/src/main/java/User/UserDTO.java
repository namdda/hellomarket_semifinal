package User;

public class UserDTO {

	private String userPass;
	private String userId;
	private int userIdx;
	private String userNick;
	private String userProf;
	private int sellerStar;
	private int sellerLevel;
	private int userFollower;
	private int userFollowing;
	public int getUserFollower() {
		return userFollower;
	}
	public void setUserFollower(int userFollower) {
		this.userFollower = userFollower;
	}
	public int getUserFollowing() {
		return userFollowing;
	}
	public void setUserFollowing(int userFollowing) {
		this.userFollowing = userFollowing;
	}
	public int getUserPh() {
		return userPh;
	}
	public int getSellerStar() {
		return sellerStar;
	}
	public void setSellerStar(int sellerStar) {
		this.sellerStar = sellerStar;
	}
	public void setUserPh(int userPh) {
		this.userPh = userPh;
	}

	private int userPh;
	public String getUserProf() {
		return userProf;
	}
	public void setUserProf(String userProf) {
		this.userProf = userProf;
	}

	public int getSellerLevel() {
		return sellerLevel;
	}
	public void setSellerLevel(int sellerLevel) {
		this.sellerLevel = sellerLevel;
	}

	int couponIdx;
	
	public int getCouponIdx() {
		return couponIdx;
	}
	public void setCouponIdx(int couponIdx) {
		this.couponIdx = couponIdx;
	}
	public int getUserIdx() {
		return userIdx;
	}
	public void setUserIdx(int userIdx) {
		this.userIdx = userIdx;
	}
	public String getUserNick() {
		return userNick;
	}
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	public String getUserPass() {
		return userPass;
	}
	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
	
	
}
