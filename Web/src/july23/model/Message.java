package july23.model;

public class Message {
	
	private int id;
	private String guestName;
	private String password;
	private String message;
	
	public int getId() {
		return id;
	}
	public void setId(int message_id) {
		this.id = message_id; /* 이름이 안맞아서?? id -> guest_id -> message_id로 수정 --> 이름 문제가 아니라 시퀀스 문제였음 */ 
	}
	public String getGuestName() {
		return guestName;
	}
	public void setGuestName(String guestName) {
		this.guestName = guestName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	
	public boolean hasPasswd() {
		return password != null && !password.isEmpty();
	}
}
