package project.dto;

public class NoticeDto {
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	private int id;
	private String title,content,viewcount,reportingdate,pwd;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
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
	public String getViewcount() {
		return viewcount;
	}
	public void setViewcount(String viewcount) {
		this.viewcount = viewcount;
	}
	public String getReportingdate() {
		return reportingdate;
	}
	public void setReportingdate(String reportingdate) {
		this.reportingdate = reportingdate;
	}
	
	
	
}
