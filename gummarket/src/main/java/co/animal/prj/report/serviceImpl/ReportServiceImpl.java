package co.animal.prj.report.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.animal.prj.common.DataSource;
import co.animal.prj.report.service.ReportService;
import co.animal.prj.report.service.ReportServiceMapper;
import co.animal.prj.report.vo.ReportVO;

public class ReportServiceImpl implements ReportService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true)	;
	private ReportServiceMapper map = sqlSession.getMapper(ReportServiceMapper.class);
	@Override
	public List<ReportVO> reportSelectList() {
		// TODO Auto-generated method stub
		return map.reportSelectList();
	}

	@Override
	public ReportVO reportSelect(ReportVO vo) {
		// TODO Auto-generated method stub
		return map.reportSelect(vo);
	}

	@Override
	public int reportUpdate(ReportVO vo) {
		// TODO Auto-generated method stub
		return map.reportUpdate(vo);
	}

	@Override
	public int reportDelete(ReportVO vo) {
		// TODO Auto-generated method stub
		return map.reportDelete(vo);
	}

	@Override
	public int reportInsert(ReportVO vo) {
		// TODO Auto-generated method stub
		return map.reportInsert(vo);
	}

}
