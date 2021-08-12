package co.animal.prj.image.vo;

public class ImageVO {
	private int iNo;
	private String imgPath;
	private String iType;
	private int iMainNum;
	
	
	public ImageVO() {
		super();
	}


	public int getiNo() {
		return iNo;
	}


	public void setiNo(int iNo) {
		this.iNo = iNo;
	}


	public String getImgPath() {
		return imgPath;
	}


	public void setImgPath(String imgPath) {
		this.imgPath = imgPath;
	}


	public String getiType() {
		return iType;
	}


	public void setiType(String iType) {
		this.iType = iType;
	}


	public int getiMainNum() {
		return iMainNum;
	}


	public void setiMainNum(int iMainNum) {
		this.iMainNum = iMainNum;
	}


	@Override
	public String toString() {
		return "ImageVO [iNo=" + iNo + ", imgPath=" + imgPath + ", iType=" + iType + ", iMainNum=" + iMainNum + "]";
	}
	
	
}
