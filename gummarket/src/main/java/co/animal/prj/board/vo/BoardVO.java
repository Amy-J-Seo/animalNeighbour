package co.animal.prj.board.vo;

import java.sql.Date;

public class BoardVO {
	private int bNo;
	private String bCategory;
	private String bTitle;
	private String mId;
	private Date bDate;
	private String bContents;
	private String bIsOn;
	private int bHit;
	private int bLike;
	private String bImg;
	
	
	public void setbImg(String bImg) {
		this.bImg = bImg;
	}
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
	
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public int getbLike() {
		return bLike;
	}
	public void setbLike(int bLike) {
		this.bLike = bLike;
	}
	public String getbImg() {
		return bImg;
	}
	@Override
	public String toString() {
		return "BoardVO [bNo=" + bNo + ", bCategory=" + bCategory + ", bTitle=" + bTitle + ", mId=" + mId + ", bDate="
				+ bDate + ", bContents=" + bContents + ", bIsOn=" + bIsOn + ", bHit=" + bHit + ", bLike=" + bLike + ", bImg=" + bImg +"]";
	}
	
	
}
