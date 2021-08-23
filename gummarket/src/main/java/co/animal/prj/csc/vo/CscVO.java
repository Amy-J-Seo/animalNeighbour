package co.animal.prj.csc.vo;

import java.sql.Date;

import co.animal.prj.member.vo.MemberVO;

public class CscVO extends MemberVO{
	private int csNo;
	//private String mId;
	private String csTitle;
	private Date csDate;
	private String csContents;
	private String csHide;
	private String csStatus;
	
	public CscVO() {
		super();
	}
	
	public int getCsNo() {
		return csNo;
	}
	public void setCsNo(int csNo) {
		this.csNo = csNo;
	}

	/*
	 * public String getmId() { return mId; } public void setmId(String mId) {
	 * this.mId = mId; }
	 */
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

	public String getCsStatus() {
		return csStatus;
	}

	public void setCsStatus(String csStatus) {
		this.csStatus = csStatus;
	}

	@Override
	public String toString() {
		return "CscVO [csNo=" + csNo + ", csTitle=" + csTitle + ", csDate=" + csDate + ", csContents=" + csContents
				+ ", csHide=" + csHide + ", csStatus=" + csStatus + "]";
	}


	
	
	
}
