package co.animal.prj.comments.vo;


public class CommentsVO {
	
	private int cNo;
	private String cmId;
	private String cType;
	private String cContents;
	private int cMainNum;
	
	@Override
	public String toString() {
		return "CommentsVO [cNo=" + cNo + ", cmId=" + cmId + ", cType=" + cType + ", cContents=" + cContents
				+ ", cMainNum=" + cMainNum + "]";
	}
	
	public CommentsVO() {
		super();
	}
	public int getcNo() {
		return cNo;
	}
	public void setcNo(int cNo) {
		this.cNo = cNo;
	}
	
	public String getCmId() {
		return cmId;
	}
	public void setCmId(String cmId) {
		this.cmId = cmId;
	}
	public String getcType() {
		return cType;
	}
	public void setcType(String cType) {
		this.cType = cType;
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
