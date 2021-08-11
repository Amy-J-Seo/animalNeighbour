package co.animal.prj.member.vo;

public class MemberVO {
	private String mId;
	private String mName;
	private String nickname;
	private String adress;
	private String phone;
	private String petInfo;
	private String reviewPoint;
	private String role;
	private String state;
	private String password;
	private String buyPoint;
	private String email;
	
	public MemberVO() {
		super();
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getAdress() {
		return adress;
	}

	public void setAdress(String adress) {
		this.adress = adress;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPetInfo() {
		return petInfo;
	}

	public void setPetInfo(String petInfo) {
		this.petInfo = petInfo;
	}

	public String getReviewPoint() {
		return reviewPoint;
	}

	public void setReviewPoint(String reviewPoint) {
		this.reviewPoint = reviewPoint;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getBuyPoint() {
		return buyPoint;
	}

	public void setBuyPoint(String buyPoint) {
		this.buyPoint = buyPoint;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public String toString() {
		return "MemberVO [mId=" + mId + ", mName=" + mName + ", nickname=" + nickname + ", adress=" + adress
				+ ", phone=" + phone + ", petInfo=" + petInfo + ", reviewPoint=" + reviewPoint + ", role=" + role
				+ ", state=" + state + ", password=" + password + ", buyPoint=" + buyPoint + ", email=" + email + "]";
	}
	
	
	
	
	
}
