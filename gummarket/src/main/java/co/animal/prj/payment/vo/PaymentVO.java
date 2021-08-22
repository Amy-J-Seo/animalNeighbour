package co.animal.prj.payment.vo;

import java.sql.Date;

import co.animal.prj.sales.vo.SalesVO;

public class PaymentVO extends SalesVO{
	private int pNo;
	private String mId;
	private int sNo;
	private String productId;
	private Date pDate;
	private int payAmount;
	private int payConfirmNum;	
	private String confirmPurchase;
	
	public PaymentVO() {
		super();
	}


	public int getpNo() {
		return pNo;
	}


	public void setpNo(int pNo) {
		this.pNo = pNo;
	}


	public String getmId() {
		return mId;
	}


	public void setmId(String mId) {
		this.mId = mId;
	}


	public int getsNo() {
		return sNo;
	}


	public void setsNo(int sNo) {
		this.sNo = sNo;
	}


	public String getProductId() {
		return productId;
	}


	public void setProductId(String productId) {
		this.productId = productId;
	}


	public Date getpDate() {
		return pDate;
	}


	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}


	public int getPayAmount() {
		return payAmount;
	}


	public void setPayAmount(int payAmount) {
		this.payAmount = payAmount;
	}


	public int getPayConfirmNum() {
		return payConfirmNum;
	}


	public void setPayConfirmNum(int payConfirmNum) {
		this.payConfirmNum = payConfirmNum;
	}


	public String getConfirmPurchase() {
		return confirmPurchase;
	}


	public void setConfirmPurchase(String confirmPurchase) {
		this.confirmPurchase = confirmPurchase;
	}


	@Override
	public String toString() {
		return "PaymentVO [pNo=" + pNo + ", mId=" + mId + ", sNo=" + sNo + ", productId=" + productId + ", pDate="
				+ pDate + ", payAmount=" + payAmount + ", payConfirmNum=" + payConfirmNum + ", confirmPurchase="
				+ confirmPurchase + ", getsCategory()=" + getsCategory() + ", getsTitle()=" + getsTitle()
				+ ", getsHit()=" + getsHit() + ", getsLike()=" + getsLike() + ", getsImg()=" + getsImg()
				+ ", getsPurchasedDate()=" + getsPurchasedDate() + ", getsUseDays()=" + getsUseDays()
				+ ", getsReason()=" + getsReason() + ", getsCondition()=" + getsCondition() + ", getsPrice()="
				+ getsPrice() + ", getsNetPrice()=" + getsNetPrice() + ", getsStatus()=" + getsStatus()
				+ ", getsHide()=" + getsHide() + ", toString()=" + super.toString() + ", getcNo()=" + getcNo()
				+ ", getCmId()=" + getCmId() + ", getcType()=" + getcType() + ", getcContents()=" + getcContents()
				+ ", getcMainNum()=" + getcMainNum() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ "]";
	}


	


	
	
}
