package co.animal.prj.payment.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.animal.prj.common.DataSource;
import co.animal.prj.payment.service.PaymentService;
import co.animal.prj.payment.service.PaymentServiceMapper;
import co.animal.prj.payment.vo.PaymentVO;

public class PaymentServiceImpl implements PaymentService {
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	
	private PaymentServiceMapper map =sqlSession.getMapper(PaymentServiceMapper.class);
	@Override
	public List<PaymentVO> paymentSelectList() {
		// TODO Auto-generated method stub
		return map.paymentSelectList();
	}

	@Override
	public PaymentVO paymentSelect(PaymentVO vo) {
		// TODO Auto-generated method stub
		return map.paymentSelect(vo);
	}

	@Override
	public int paymentUpdate(PaymentVO vo) {
		// TODO Auto-generated method stub
		return map.paymentUpdate(vo);
	}

	@Override
	public int paymentDelete(PaymentVO vo) {
		// TODO Auto-generated method stub
		return map.paymentDelete(vo);
	}

	@Override
	public int paymentInsert(PaymentVO vo) {
		// TODO Auto-generated method stub
		return map.paymentInsert(vo);
	}

}
