package co.animal.prj.image.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.animal.prj.common.DataSource;
import co.animal.prj.image.service.ImageService;
import co.animal.prj.image.service.ImageServiceMapper;
import co.animal.prj.image.vo.ImageVO;

public class ImageServiceImpl implements ImageService {
	private SqlSession sqlSession =DataSource.getInstance().openSession();
	private ImageServiceMapper map = sqlSession.getMapper(ImageServiceMapper.class);
	@Override
	public List<ImageVO> imageSelectList() {
		// TODO Auto-generated method stub
		return map.imageSelectList();
	}

	@Override
	public ImageVO imageSelect(ImageVO vo) {
		// TODO Auto-generated method stub
		return map.imageSelect(vo);
	}

	@Override
	public int imageUpdate(ImageVO vo) {
		// TODO Auto-generated method stub
		return map.imageUpdate(vo);
	}

	@Override
	public int imageDelete(ImageVO vo) {
		// TODO Auto-generated method stub
		return map.imageDelete(vo);
	}

	@Override
	public int imageInsert(ImageVO vo) {
		// TODO Auto-generated method stub
		return map.imageInsert(vo);
	}

}
