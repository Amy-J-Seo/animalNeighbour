package co.animal.prj.lost.vo;

public class LostVO {
	private int lNo;
	private String mId;	
	private String lTitle;
	private String lName;
	private String lGender;
	private int lAge;
	private String lWhen;
	private String lWhere;
	private String lCharacter;
	private String lImg;
	public LostVO() {
		super();
	}
	public int getlNo() {
		return lNo;
	}
	public void setlNo(int lNo) {
		this.lNo = lNo;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getlTitle() {
		return lTitle;
	}
	public void setlTitle(String lTitle) {
		this.lTitle = lTitle;
	}
	public String getlName() {
		return lName;
	}
	public void setlName(String lName) {
		this.lName = lName;
	}
	public String getlGender() {
		return lGender;
	}
	public void setlGender(String lGender) {
		this.lGender = lGender;
	}
	public int getlAge() {
		return lAge;
	}
	public void setlAge(int lAge) {
		this.lAge = lAge;
	}
	public String getlWhen() {
		return lWhen;
	}
	public void setlWhen(String lWhen) {
		this.lWhen = lWhen;
	}
	public String getlWhere() {
		return lWhere;
	}
	public void setlWhere(String lWhere) {
		this.lWhere = lWhere;
	}
	public String getlCharacter() {
		return lCharacter;
	}
	public void setlCharacter(String lCharacter) {
		this.lCharacter = lCharacter;
	}
	public String getlImg() {
		return lImg;
	}
	public void setlImg(String lImg) {
		this.lImg = lImg;
	}
	@Override
	public String toString() {
		return "LostVO [lNo=" + lNo + ", mId=" + mId + ", lTitle=" + lTitle + ", lName=" + lName + ", lGender="
				+ lGender + ", lAge=" + lAge + ", lWhen=" + lWhen + ", lWhere=" + lWhere + ", lCharacter=" + lCharacter
				+ ", lImg=" + lImg + "]";
	}
	
}
