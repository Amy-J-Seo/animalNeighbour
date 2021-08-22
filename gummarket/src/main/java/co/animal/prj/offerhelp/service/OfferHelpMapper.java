package co.animal.prj.offerhelp.service;

import java.util.List;

import co.animal.prj.offerhelp.vo.OfferHelpVO;

public interface OfferHelpMapper {
	public List<OfferHelpVO> offerHelpSelectList();
	public OfferHelpVO offerHelpSelect(OfferHelpVO vo);
	public int offerHelpUpdate(OfferHelpVO vo);
	public int offerHelpDelete(OfferHelpVO vo);
	public int offerHelpInsert(OfferHelpVO vo);
	
	//주윤 멤머마이페이지
	public int memberTotalOh(OfferHelpVO vo);
	public List<OfferHelpVO> offerHelpSelectListByMember(OfferHelpVO vo);
}
