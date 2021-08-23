package co.animal.prj.offerhelp.vo;

public class CommentsVO {
	
	private String cmId;
	private String cContents;
	private int cMainNum;
	//private String cmId;
	
	@Override
	public String toString() {
		return "CommentsVO [cmId=" + cmId + ", cContents=" + cContents + ", cMainNum=" + cMainNum + "]";
	}
	
	public String getCmId() {
		return cmId;
	}
	public void setCmId(String cmId) {
		this.cmId = cmId;
	}
	public String getcContents() {
		return cContents;
	}
	public void setcContents(String cContents) {
		this.cContents = cContents;
	}
	public int getcMainNum() {
		return cMainNum;
	}
	public void setcMainNum(int cMainNum) {
		this.cMainNum = cMainNum;
	}
	
	
	
}
