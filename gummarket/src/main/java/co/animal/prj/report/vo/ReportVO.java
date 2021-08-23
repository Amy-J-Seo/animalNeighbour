package co.animal.prj.report.vo;

public class ReportVO {
	private int rNo;
	private int mainNo;
	private String rWhy;
	private String category;
	private String mId;
	private String rHide;
	
	
	public ReportVO() {
		super();
	}
	public int getrNo() {
		return rNo;
	}
	public void setrNo(int rNo) {
		this.rNo = rNo;
	}
	public int getMainNo() {
		return mainNo;
	}
	public void setMainNo(int mainNo) {
		this.mainNo = mainNo;
	}
	public String getrWhy() {
		return rWhy;
	}
	public void setrWhy(String rWhy) {
		this.rWhy = rWhy;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	
	public String getrHide() {
		return rHide;
	}
	public void setrHide(String rHide) {
		this.rHide = rHide;
	}
	@Override
	public String toString() {
		return "ReportVO [rNo=" + rNo + ", mainNo=" + mainNo + ", rWhy=" + rWhy + ", category=" + category + ", mId="
				+ mId + ", rHide=" + rHide + "]";
	}
	
	

}
