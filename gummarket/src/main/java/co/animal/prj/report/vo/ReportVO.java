package co.animal.prj.report.vo;

public class ReportVO {
	private int rNo;
	private int mainNo;
	private String rWhy;
	private String category;
	
	public ReportVO() {
		super();
	}
	
	public int getrNo() {
		return rNo;
	}
	public void setrNo(int rNo) {
		this.rNo = rNo;
	}
	public int getmainNo() {
		return mainNo;
	}
	public void setmainNo(int mainNo) {
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

	@Override
	public String toString() {
		return "ReportVO [rNo=" + rNo + ", mainNo=" + mainNo + ", rWhy=" + rWhy + ", category=" + category + "]";
	}
	

}
