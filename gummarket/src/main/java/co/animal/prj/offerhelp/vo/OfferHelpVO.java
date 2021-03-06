package co.animal.prj.offerhelp.vo;

import co.animal.prj.member.vo.MemberVO;

public class OfferHelpVO extends MemberVO{
	private int ohNo;
	private String mId;
	private String ohCategory;
	private String ohTitle;
	private String ohContents;
	private String ohHistory;
	private String ohAddress;
	private String ohCharacter;
	private String ohDetails;
	private String OhImg;
	private String OhHide;
	
	public OfferHelpVO() {
		super();
	}

	public int getOhNo() {
		return ohNo;
	}

	public void setOhNo(int ohNo) {
		this.ohNo = ohNo;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getOhCategory() {
		return ohCategory;
	}

	public void setOhCategory(String ohCategory) {
		this.ohCategory = ohCategory;
	}

	public String getOhTitle() {
		return ohTitle;
	}

	public void setOhTitle(String ohTitle) {
		this.ohTitle = ohTitle;
	}

	public String getOhContents() {
		return ohContents;
	}

	public void setOhContents(String ohContents) {
		this.ohContents = ohContents;
	}

	public String getOhHistory() {
		return ohHistory;
	}

	public void setOhHistory(String ohHistory) {
		this.ohHistory = ohHistory;
	}

	public String getOhAddress() {
		return ohAddress;
	}

	public void setOhAddress(String ohAddress) {
		this.ohAddress = ohAddress;
	}

	public String getOhCharacter() {
		return ohCharacter;
	}

	public void setOhCharacter(String ohCharacter) {
		this.ohCharacter = ohCharacter;
	}

	public String getOhDetails() {
		return ohDetails;
	}

	public void setOhDetails(String ohDetails) {
		this.ohDetails = ohDetails;
	}

	public String getOhImg() {
		return OhImg;
	}

	public void setOhImg(String ohImg) {
		OhImg = ohImg;
	}

	public String getOhHide() {
		return OhHide;
	}

	public void setOhHide(String ohHide) {
		OhHide = ohHide;
	}

	@Override
	public String toString() {
		return "OfferHelpVO [ohNo=" + ohNo + ", mId=" + mId + ", ohCategory=" + ohCategory + ", ohTitle=" + ohTitle
				+ ", ohContents=" + ohContents + ", ohHistory=" + ohHistory + ", ohAddress=" + ohAddress
				+ ", ohCharacter=" + ohCharacter + ", ohDetails=" + ohDetails + ", OhImg=" + OhImg + ", OhHide="
				+ OhHide + "]";
	}
	

}
