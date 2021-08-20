package co.animal.prj.image.service;

import java.util.List;

import co.animal.prj.image.vo.ImageVO;

public interface ImageServiceMapper {
	public List<ImageVO> imageSelectList();
	public ImageVO imageSelect(ImageVO vo);
	public int imageUpdate(ImageVO vo);
	public int imageDelete(ImageVO vo);
	public int imageInsert(ImageVO vo);
	public int fhImageInsert(ImageVO iVo);
}
