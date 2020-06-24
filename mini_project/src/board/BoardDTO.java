package board;

import java.io.Serializable;
import java.sql.Date;

public class BoardDTO implements Serializable{
	
	private long no;
	private String title;
	private String user_id;
	private String content;
	private Date regdate;
	
	public long getNo() {
		return no;
	}
	public void setNo(long no) {
		this.no = no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	@Override
	public String toString() {
		return "BoardDTO [no=" + no + ", title=" + title + ", user_id=" + user_id + ", content=" + content
				+ ", regdate=" + regdate + "]";
	}
	
	
}
