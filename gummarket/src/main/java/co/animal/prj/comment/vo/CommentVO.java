package co.animal.prj.comment.vo;


public class CommentVO {
	private int cNo;
	private String mId;
	private String cType;
	private String cContents;
	public CommentVO() {
		super();
	}
	public int getcNo() {
		return cNo;
	}
	public void setcNo(int cNo) {
		this.cNo = cNo;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
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
	@Override
	public String toString() {
		return "CommentVO [cNo=" + cNo + ", mId=" + mId + ", cType=" + cType + ", cContents=" + cContents + "]";
	}
	
}
