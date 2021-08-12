package co.animal.prj.report.vo;

public class ReportVO {
	private int rNo;
	private int sNo;
	private String rWhy;
	
	public ReportVO() {
		super();
	}
	
	public int getrNo() {
		return rNo;
	}
	public void setrNo(int rNo) {
		this.rNo = rNo;
	}
	public int getsNo() {
		return sNo;
	}
	public void setsNo(int sNo) {
		this.sNo = sNo;
	}
	public String getrWhy() {
		return rWhy;
	}
	public void setrWhy(String rWhy) {
		this.rWhy = rWhy;
	}
	
	@Override
	public String toString() {
		return "ReportVO [rNo=" + rNo + ", sNo=" + sNo + ", rWhy=" + rWhy + "]";
	}
	
}
