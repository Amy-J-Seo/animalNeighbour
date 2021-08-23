package co.animal.prj.report.service;

import java.util.List;

import co.animal.prj.report.vo.ReportVO;

public interface ReportServiceMapper {
	public List<ReportVO> reportSelectList();
	public List<ReportVO> reportSelectListByMember(ReportVO vo);
	public ReportVO reportSelect(ReportVO vo);
	public int reportUpdate(ReportVO vo);
	public int reportDelete(ReportVO vo);
	public int reportInsert(ReportVO vo);
	public int memberTotalR(ReportVO vo); //사용자 report 숫자
	public int reportFinished(ReportVO vo); //관리자가 리포트 삭제 후 완료 업데이트
	
	public int reportNum();
}
