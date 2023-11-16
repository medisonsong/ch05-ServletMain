package kr.story.vo;

import java.sql.Date;

//자바빈(VO)
public class StoryVO {
	//멤버변수
	private int num;
	private String title;
	private String content;
	private String ip;
	private int snum; //작성자 번호
	private Date reg_date;
	
	private String id; //컬럼에는 없지만 작성자 번호를 조인해서 id를 보여지게 할거임

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public int getSnum() {
		return snum;
	}

	public void setSnum(int snum) {
		this.snum = snum;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
}
