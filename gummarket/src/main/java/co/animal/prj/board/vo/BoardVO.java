package co.animal.prj.board.vo;

import java.sql.Date;

public class BoardVO {
	private int bNo;
	private String bCategory;
	private String bTitle;
	private Date bDate;
	private String bContents;
	private String bIsOn;
	private int bHit;
	public BoardVO() {
		super();
	}
	public int getbNo() {
		return bNo;
	}
	public void setbNo(int bNo) {
		this.bNo = bNo;
	}
	public String getbCategory() {
		return bCategory;
	}
	public void setbCategory(String bCategory) {
		this.bCategory = bCategory;
	}
	public String getbTitle() {
		return bTitle;
	}
	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}
	public Date getbDate() {
		return bDate;
	}
	public void setbDate(Date bDate) {
		this.bDate = bDate;
	}
	public String getbContents() {
		return bContents;
	}
	public void setbContents(String bContents) {
		this.bContents = bContents;
	}
	public String getbIsOn() {
		return bIsOn;
	}
	public void setbIsOn(String bIsOn) {
		this.bIsOn = bIsOn;
	}
	public int getbHit() {
		return bHit;
	}
	public void setbHit(int bHit) {
		this.bHit = bHit;
	}
	@Override
	public String toString() {
		return "BoardVO [bNo=" + bNo + ", bCategory=" + bCategory + ", bTitle=" + bTitle + ", bDate=" + bDate
				+ ", bContents=" + bContents + ", bIsOn=" + bIsOn + ", bHit=" + bHit + "]";
	}
	
	
}
