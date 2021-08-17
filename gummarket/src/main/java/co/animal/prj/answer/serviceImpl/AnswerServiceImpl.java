package co.animal.prj.answer.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.animal.prj.answer.service.AnswerService;
import co.animal.prj.answer.service.AnswerServiceMapper;
import co.animal.prj.answer.vo.AnswerVO;
import co.animal.prj.common.DataSource;

public class AnswerServiceImpl implements AnswerService {
	private SqlSession sqlsession = DataSource.getInstance().openSession(true);
	
	private AnswerServiceMapper map = sqlsession.getMapper(AnswerServiceMapper.class);
	
	
	@Override
	public List<AnswerVO> answerSelectList() {
		// TODO Auto-generated method stub
		return map.answerSelectList();
	}

	@Override
	public AnswerVO answerSelect(AnswerVO vo) {
		// TODO Auto-generated method stub
		return map.answerSelect(vo);
	}

	@Override
	public int answerUpdate(AnswerVO vo) {
		// TODO Auto-generated method stub
		return map.answerUpdate(vo);
	}

	@Override
	public int answerDelete(AnswerVO vo) {
		// TODO Auto-generated method stub
		return map.answerDelete(vo);
	}

	@Override
	public int answerInsert(AnswerVO vo) {
		// TODO Auto-generated method stub
		return map.answerInsert(vo);
	}

}
