package user;

import java.io.Serializable;

import org.apache.commons.codec.digest.DigestUtils;

public class UserDTO implements Serializable {
	
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_gender;
	private String user_email;
	private String user_birthdate;
	private String user_phone;
	private String user_addr;
	private String user_postcode;
	private String user_detailaddr;
	private String user_extraaddr;
	
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = DigestUtils.sha512Hex(user_pw);
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_birthdate() {
		return user_birthdate;
	}
	public void setUser_birthdate(String user_birthdate) {
		this.user_birthdate = user_birthdate;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_addr() {
		return user_addr;
	}
	public void setUser_addr(String user_addr) {
		this.user_addr = user_addr;
	}
	public String getUser_postcode() {
		return user_postcode;
	}
	public void setUser_postcode(String user_postcode) {
		this.user_postcode = user_postcode;
	}
	public String getUser_detailaddr() {
		return user_detailaddr;
	}
	public void setUser_detailaddr(String user_detailaddr) {
		this.user_detailaddr = user_detailaddr;
	}
	public String getUser_extraaddr() {
		return user_extraaddr;
	}
	public void setUser_extraaddr(String user_extraaddr) {
		this.user_extraaddr = user_extraaddr;
	}
	
	@Override
	public String toString() {
		return "UserDTO [user_id=" + user_id + ", user_pw=" + user_pw + ", user_name=" + user_name + ", user_gender="
				+ user_gender + ", user_email=" + user_email + ", user_birthdate=" + user_birthdate + ", user_phone="
				+ user_phone + ", user_addr=" + user_addr + ", user_postcode=" + user_postcode + ", user_detailaddr="
				+ user_detailaddr + ", user_extraaddr=" + user_extraaddr + "]";
	}
}
