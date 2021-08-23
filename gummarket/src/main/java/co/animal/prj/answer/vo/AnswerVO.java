package co.animal.prj.answer.vo;

import java.sql.Date;

import co.animal.prj.csc.vo.CscVO;

public class AnswerVO extends CscVO{
	private int aNo;
	
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
		return "AnswerVO [aNo=" + aNo + ", aTitle=" + aTitle + ", aDate=" + aDate + ", aContents="
				+ aContents + "]";
	}
	
}
