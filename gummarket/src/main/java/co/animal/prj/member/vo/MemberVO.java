package co.animal.prj.member.vo;

public class MemberVO {
	private String mId;
	private String mName;
	private String nickname;
	private String address;
	private String phone;
	private String petInfo;
	private int reviewPoint;
	private String role;
	private String state;
	private String password;
	private int buyPoint;
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

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	public int getReviewPoint() {
		return reviewPoint;
	}

	public void setReviewPoint(int reviewPoint) {
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

	public int getBuyPoint() {
		return buyPoint;
	}

	public void setBuyPoint(int buyPoint) {
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
		return "MemberVO [mId=" + mId + ", mName=" + mName + ", nickname=" + nickname + ", address=" + address
				+ ", phone=" + phone + ", petInfo=" + petInfo + ", reviewPoint=" + reviewPoint + ", role=" + role
				+ ", state=" + state + ", password=" + password + ", buyPoint=" + buyPoint + ", email=" + email + "]";
	}
	
	
	
	
	
}
