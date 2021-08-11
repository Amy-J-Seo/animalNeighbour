package co.animal.prj.image.vo;

public class ImageVO {
	private int iNo;
	private String imgPath;
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
	@Override
	public String toString() {
		return "ImageVO [iNo=" + iNo + ", imgPath=" + imgPath + "]";
	}
	
}
