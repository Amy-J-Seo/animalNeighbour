package co.animal.prj.payment.vo;

import java.sql.Date;

public class PaymentVO {
	private int pNo;
	private String mId;
	private int sNo;
	private String productId;
	private Date pDate;
	private int paymentAmount;
	private int payConfirmNum;	
	
	
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


	public int getPaymentAmount() {
		return paymentAmount;
	}


	public void setPaymentAmount(int paymentAmount) {
		this.paymentAmount = paymentAmount;
	}


	public int getPayConfirmNum() {
		return payConfirmNum;
	}


	public void setPayConfirmNum(int payConfirmNum) {
		this.payConfirmNum = payConfirmNum;
	}


	@Override
	public String toString() {
		return "PaymentVO [pNo=" + pNo + ", mId=" + mId + ", sNo=" + sNo + ", productId=" + productId + ", pDate="
				+ pDate + ", paymentAmount=" + paymentAmount + ", payConfirmNum=" + payConfirmNum + "]";
	}


	
	
}
