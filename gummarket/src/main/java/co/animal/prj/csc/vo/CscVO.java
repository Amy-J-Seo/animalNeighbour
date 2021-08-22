package co.animal.prj.csc.vo;

import java.sql.Date;

public class CscVO {
	private int csNo;
	private String mId;
	private String csTitle;
	private Date csDate;
	private String csContents;
	private String csHide;
	
	public CscVO() {
		super();
	}
	
	public int getCsNo() {
		return csNo;
	}
	public void setCsNo(int csNo) {
		this.csNo = csNo;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getCsTitle() {
		return csTitle;
	}
	public void setCsTitle(String csTitle) {
		this.csTitle = csTitle;
	}
	public Date getCsDate() {
		return csDate;
	}
	public void setCsDate(Date csDate) {
		this.csDate = csDate;
	}
	public String getCsContents() {
		return csContents;
	}
	public void setCsContents(String csContents) {
		this.csContents = csContents;
	}
	
	public String getCsHide() {
		return csHide;
	}
	public void setCsHide(String csHide) {
		this.csHide = csHide;
	}
	
	@Override
	public String toString() {
		return "CscVO [csNo=" + csNo + ", mId=" + mId + ", csTitle=" + csTitle + ", csDate=" + csDate + ", csContents="
				+ csContents + ", csHide=" + csHide + "]";
	}
	
	
	
}
