package co.animal.prj.findhelp.vo;

import co.animal.prj.member.vo.MemberVO;

public class FindHelpVO extends MemberVO{
	private int fhNo;
	private String mId;
	private String fhCategory;
	private String fhTitle;
	private String fhAnimal;
	private String fhSize;
	private int fhAge;
	private String fhImg;
	private String fhNeed;
	private String fhCharacter;
	private String fhHow;
	private String fhHide;
	
	public FindHelpVO() {
		super();
	}
	public int getFhNo() {
		return fhNo;
	}
	public void setFhNo(int fhNo) {
		this.fhNo = fhNo;
	}
	public String getmId() {
		return mId;
	}
	public void setmId(String mId) {
		this.mId = mId;
	}
	public String getFhCategory() {
		return fhCategory;
	}
	public void setFhCategory(String fhCategory) {
		this.fhCategory = fhCategory;
	}
	public String getFhTitle() {
		return fhTitle;
	}
	public void setFhTitle(String fhTitle) {
		this.fhTitle = fhTitle;
	}
	public String getFhAnimal() {
		return fhAnimal;
	}
	public void setFhAnimal(String fhAnimal) {
		this.fhAnimal = fhAnimal;
	}
	public String getFhSize() {
		return fhSize;
	}
	public void setFhSize(String fhSize) {
		this.fhSize = fhSize;
	}
	public int getFhAge() {
		return fhAge;
	}
	public void setFhAge(int fhAge) {
		this.fhAge = fhAge;
	}
	public String getFhImg() {
		return fhImg;
	}
	public void setFhImg(String fhImg) {
		this.fhImg = fhImg;
	}
	public String getFhNeed() {
		return fhNeed;
	}
	public void setFhNeed(String fhNeed) {
		this.fhNeed = fhNeed;
	}
	public String getFhCharacter() {
		return fhCharacter;
	}
	public void setFhCharacter(String fhCharacter) {
		this.fhCharacter = fhCharacter;
	}
	public String getFhHow() {
		return fhHow;
	}
	public void setFhHow(String fhHow) {
		this.fhHow = fhHow;
	}
	
	public String getFhHide() {
		return fhHide;
	}
	public void setFhHide(String fhHide) {
		this.fhHide = fhHide;
	}
	@Override
	public String toString() {
		return "FindHelpVO [fhNo=" + fhNo + ", mId=" + mId + ", fhCategory=" + fhCategory + ", fhTitle=" + fhTitle
				+ ", fhAnimal=" + fhAnimal + ", fhSize=" + fhSize + ", fhAge=" + fhAge + ", fhImg=" + fhImg
				+ ", fhNeed=" + fhNeed + ", fhCharacter=" + fhCharacter + ", fhHow=" + fhHow + ", fhHide=" + fhHide
				+ "]";
	}
	
	

}
