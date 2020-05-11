package User;

public class CouponDTO {
	private Integer couponIdx;
	private String couponName;
	private Integer couponPrice;
	public Integer getCouponIdx() {
		return couponIdx;
	}
	public void setCouponIdx(Integer couponIdx) {
		this.couponIdx = couponIdx;
	}
	public String getCouponName() {
		return couponName;
	}
	public void setCouponName(String couponName) {
		this.couponName = couponName;
	}
	public Integer getCouponPrice() {
		return couponPrice;
	}
	public void setCouponPrice(Integer couponPrice) {
		this.couponPrice = couponPrice;
	}
	public String getCouponTerms() {
		return couponTerms;
	}
	public void setCouponTerms(String couponTerms) {
		this.couponTerms = couponTerms;
	}
	private String couponTerms;
	@Override
	public String toString() {

		return "CouponDTO couponName="+couponName;
	}
	
}
