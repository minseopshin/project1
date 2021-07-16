package project.dto;

public class BoardDto {
	private int id,viewcount,state,singo;
	private String userid,title,content,reportingdate,fname;
	
	public int getSingo() {
		return singo;
	}
	public void setSingo(int singo) {
		this.singo = singo;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getViewcount() {
		return viewcount;
	}
	public void setViewcount(int viewcount) {
		this.viewcount = viewcount;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
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
	public String getReportingdate() {
		return reportingdate;
	}
	public void setReportingdate(String reportingdate) {
		this.reportingdate = reportingdate;
	}
	
}
