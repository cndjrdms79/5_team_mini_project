package board;

import java.io.Serializable;
import java.sql.Date;

public class BoardDTO implements Serializable{
	
	private long no;
	private String title;
	private String user_id;
	private String content;
	private Date regdate;
	private String file_name;
	private String file_volume;
	private String content_type;
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
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public String getFile_volume() {
		return file_volume;
	}
	public void setFile_volume(String file_volume) {
		this.file_volume = file_volume;
	}
	public String getContent_type() {
		return content_type;
	}
	public void setContent_type(String content_type) {
		this.content_type = content_type;
	}
	@Override
	public String toString() {
		return "BoardDTO [no=" + no + ", title=" + title + ", user_id=" + user_id + ", content=" + content
				+ ", regdate=" + regdate + ", file_name=" + file_name + ", file_volume=" + file_volume
				+ ", content_type=" + content_type + "]";
	}
	
}