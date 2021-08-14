package co.animal.prj.sales.vo;

import java.sql.Date;

import co.animal.prj.comments.vo.CommentsVO;

public class SalesVO extends CommentsVO{
	private int sNo;
	private String mId;
	private String sCategory;
	private String sTitle;
	private int sHit;
	private int sLike;
	private String sImg;
	private Date sPurchasedDate;
	private int sUseDays;
	private String sReason;
	private String sCondition;
	private int sPrice;
	private int sNetPrice;
	private String sStatus;
	private String sHide;
	
	public SalesVO() {
		super();
	}

	public int getsNo() {
		return sNo;
	}

	public void setsNo(int sNo) {
		this.sNo = sNo;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getsCategory() {
		return sCategory;
	}

	public void setsCategory(String sCategory) {
		this.sCategory = sCategory;
	}

	public String getsTitle() {
		return sTitle;
	}

	public void setsTitle(String sTitle) {
		this.sTitle = sTitle;
	}

	public int getsHit() {
		return sHit;
	}

	public void setsHit(int sHit) {
		this.sHit = sHit;
	}

	public int getsLike() {
		return sLike;
	}

	public void setsLike(int sLike) {
		this.sLike = sLike;
	}

	public String getsImg() {
		return sImg;
	}

	public void setsImg(String sImg) {
		this.sImg = sImg;
	}

	public Date getsPurchasedDate() {
		return sPurchasedDate;
	}

	public void setsPurchasedDate(Date sPurchasedDate) {
		this.sPurchasedDate = sPurchasedDate;
	}

	public int getsUseDays() {
		return sUseDays;
	}

	public void setsUseDays(int sUseDays) {
		this.sUseDays = sUseDays;
	}

	public String getsReason() {
		return sReason;
	}

	public void setsReason(String sReason) {
		this.sReason = sReason;
	}

	public String getsCondition() {
		return sCondition;
	}

	public void setsCondition(String sCondition) {
		this.sCondition = sCondition;
	}

	public int getsPrice() {
		return sPrice;
	}

	public void setsPrice(int sPrice) {
		this.sPrice = sPrice;
	}

	public int getsNetPrice() {
		return sNetPrice;
	}

	public void setsNetPrice(int sNetPrice) {
		this.sNetPrice = sNetPrice;
	}

	public String getsStatus() {
		return sStatus;
	}

	public void setsStatus(String sStatus) {
		this.sStatus = sStatus;
	}

	public String getsHide() {
		return sHide;
	}

	public void setsHide(String sHide) {
		this.sHide = sHide;
	}

	@Override
	public String toString() {
		return "SalesVO [sNo=" + sNo + ", mId=" + mId + ", sCategory=" + sCategory + ", sTitle=" + sTitle + ", sHit="
				+ sHit + ", sLike=" + sLike + ", sImg=" + sImg + ", sPurchasedDate=" + sPurchasedDate + ", sUseDays="
				+ sUseDays + ", sReason=" + sReason + ", sCondition=" + sCondition + ", sPrice=" + sPrice
				+ ", sNetPrice=" + sNetPrice + ", sStatus=" + sStatus + ", sHide=" + sHide + "]";
	}

	

}
