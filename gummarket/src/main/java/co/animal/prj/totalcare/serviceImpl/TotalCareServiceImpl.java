package co.animal.prj.totalcare.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.animal.prj.common.DataSource;
import co.animal.prj.report.vo.ReportVO;
import co.animal.prj.totalcare.service.TotalCareServiceMapper;

public class TotalCareServiceImpl implements TotalCareServiceMapper {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private TotalCareServiceMapper map = sqlSession.getMapper(TotalCareServiceMapper.class);
	@Override
	public List<ReportVO> totalCareSelectList() {
		// TODO Auto-generated method stub
		return map.totalCareSelectList();
	}



}
