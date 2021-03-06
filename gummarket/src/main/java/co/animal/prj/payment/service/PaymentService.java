package co.animal.prj.payment.service;

import java.util.List;

import co.animal.prj.payment.vo.PaymentVO;


public interface PaymentService {
	public List<PaymentVO> paymentSelectList();
	public List<PaymentVO> memberPaymentSelectList(PaymentVO vo);
	public PaymentVO paymentSelect(PaymentVO vo);
	public int paymentUpdate(PaymentVO vo);
	public int paymentDelete(PaymentVO vo);
	public int paymentInsert(PaymentVO vo);
	public int confirmPurchase(PaymentVO vo);
}
