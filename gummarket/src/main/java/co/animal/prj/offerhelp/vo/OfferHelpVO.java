package co.animal.prj.offerhelp.vo;

public class OfferHelpVO {
	private int ohNo;
	private String mId;
	private String ohCategory;
	private String ohTitle;
	private String ohContents;
	private String ohHistory;
	private int ohAddress;
	private String OhImg;
	private String ohDetails;
	private String fhCharacter;
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
	public int getOhAddress() {
		return ohAddress;
	}
	public void setOhAddress(int ohAddress) {
		this.ohAddress = ohAddress;
	}
	public String getOhImg() {
		return OhImg;
	}
	public void setOhImg(String ohImg) {
		OhImg = ohImg;
	}
	public String getOhDetails() {
		return ohDetails;
	}
	public void setOhDetails(String ohDetails) {
		this.ohDetails = ohDetails;
	}
	public String getFhCharacter() {
		return fhCharacter;
	}
	public void setFhCharacter(String fhCharacter) {
		this.fhCharacter = fhCharacter;
	}
	@Override
	public String toString() {
		return "OfferHelpVO [ohNo=" + ohNo + ", mId=" + mId + ", ohCategory=" + ohCategory + ", ohTitle=" + ohTitle
				+ ", ohContents=" + ohContents + ", ohHistory=" + ohHistory + ", ohAddress=" + ohAddress + ", OhImg="
				+ OhImg + ", ohDetails=" + ohDetails + ", fhCharacter=" + fhCharacter + "]";
	}

}
