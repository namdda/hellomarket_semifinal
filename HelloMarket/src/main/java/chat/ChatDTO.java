package chat;

public class ChatDTO {
	private Integer cIdx;
	private String toNick;
	private String fromNick;
	private String cContent;
	private String cTime;
	private Integer c_read;
	public Integer getcIdx() {
		return cIdx;
	}
	public void setcIdx(Integer cIdx) {
		this.cIdx = cIdx;
	}
	public String getToNick() {
		return toNick;
	}
	public void setToNick(String toNick) {
		this.toNick = toNick;
	}
	public String getFromNick() {
		return fromNick;
	}
	public void setFromNick(String fromNick) {
		this.fromNick = fromNick;
	}
	public String getcContent() {
		return cContent;
	}
	public void setcContent(String cContent) {
		this.cContent = cContent;
	}
	public String getcTime() {
		return cTime;
	}
	public void setcTime(String cTime) {
		this.cTime = cTime;
	}
	public Integer getC_read() {
		return c_read;
	}
	public void setC_read(Integer c_read) {
		this.c_read = c_read;
	}
	
}
