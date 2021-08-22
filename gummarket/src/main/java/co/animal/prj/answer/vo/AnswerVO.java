package co.animal.prj.answer.vo;

import java.sql.Date;

public class AnswerVO {
	private int aNo;
	private int csNo;
	private String aTitle;
	private Date aDate;
	private String aContents;
	public AnswerVO() {
		super();
	}
	public int getaNo() {
		return aNo;
	}
	public void setaNo(int aNo) {
		this.aNo = aNo;
	}
	public int getCsNo() {
		return csNo;
	}
	public void setCsNo(int csNo) {
		this.csNo = csNo;
	}
	public String getaTitle() {
		return aTitle;
	}
	public void setaTitle(String aTitle) {
		this.aTitle = aTitle;
	}
	public Date getaDate() {
		return aDate;
	}
	public void setaDate(Date aDate) {
		this.aDate = aDate;
	}
	public String getaContents() {
		return aContents;
	}
	public void setaContents(String aContents) {
		this.aContents = aContents;
	}
	@Override
	public String toString() {
		return "AnswerVO [aNo=" + aNo + ", csNo=" + csNo + ", aTitle=" + aTitle + ", aDate=" + aDate + ", aContents="
				+ aContents + "]";
	}
	
}
