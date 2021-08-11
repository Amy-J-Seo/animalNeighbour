package co.animal.prj.payment.vo;

import java.sql.Date;

public class PaymentVO {
	private int pNo;
	private String mId;
	private int sNo;
	private String pPayment;
	private Date pDate;
	private char pDone;
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
	public String getpPayment() {
		return pPayment;
	}
	public void setpPayment(String pPayment) {
		this.pPayment = pPayment;
	}
	public Date getpDate() {
		return pDate;
	}
	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}
	public char getpDone() {
		return pDone;
	}
	public void setpDone(char pDone) {
		this.pDone = pDone;
	}
	@Override
	public String toString() {
		return "PaymentVO [pNo=" + pNo + ", mId=" + mId + ", sNo=" + sNo + ", pPayment=" + pPayment + ", pDate=" + pDate
				+ ", pDone=" + pDone + "]";
	}
	
}
