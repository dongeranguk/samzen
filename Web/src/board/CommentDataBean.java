package board;

import java.sql.Timestamp;

public class CommentDataBean {
	private int comment_num;
	private int content_num;
	private String commenter;
	private String commentt;
	private String passwd;
	private Timestamp reg_date;
	private String ip;
	
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public int getContent_num() {
		return content_num;
	}
	public void setContent_num(int content_num) {
		this.content_num = content_num;
	}
	public String getCommenter() {
		return commenter;
	}
	public void setCommenter(String commenter) {
		this.commenter = commenter;
	}
	public String getCommentt() {
		return commentt;
	}
	public void setCommentt(String commentt) {  // 댓글값이 null이 들어가서 보니까 매개변수 이름이 commnett여서 commentt로 오타 수정
		this.commentt = commentt;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
}
