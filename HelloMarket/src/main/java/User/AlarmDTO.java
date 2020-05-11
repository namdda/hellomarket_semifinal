package User;

public class AlarmDTO {

	private Integer alarmIdx;
	private String alarmName;
	private String alarmTerms;
	
	public Integer getAlarmIdx() {
		return alarmIdx;
	}
	public void setAlarmIdx(Integer alarmIdx) {
		this.alarmIdx = alarmIdx;
	}
	public String getAlarmName() {
		return alarmName;
	}
	public void setAlarmName(String alarmName) {
		this.alarmName = alarmName;
	}
	public String getAlarmTerms() {
		return alarmTerms;
	}
	public void setAlarmTerms(String alarmTerms) {
		this.alarmTerms = alarmTerms;
	}
	
	@Override
	public String toString() {
		return "AlarmDTO [alarmIdx=" + alarmIdx + ", alarmName=" + alarmName + ", alarmTerms=" + alarmTerms + "]";
	}
	
	

}