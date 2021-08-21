package co.animal.prj.report.service;

import java.util.List;

import co.animal.prj.report.vo.ReportVO;


public interface ReportService {
	public List<ReportVO> reportSelectList();
	public List<ReportVO> reportSelectListByMember(ReportVO vo);
	public ReportVO reportSelect(ReportVO vo);
	public int reportUpdate(ReportVO vo);
	public int reportDelete(ReportVO vo);
	public int reportInsert(ReportVO vo);
}
