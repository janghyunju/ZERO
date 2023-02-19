package com.kh.saeha.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.saeha.dao.BuyDAO;
import com.kh.saeha.vo.BuyVO;
import com.kh.saeha.vo.ProductVO;

@Service
public class BuyServiceImpl implements BuyService {

	@Inject
	private BuyDAO dao;
	
	// 상품목록에서 구매하기를 눌렀을때 구매하기한 상품을 얻기
	@Override
	public ProductVO buylist(int pd_bno) throws Exception {
		return dao.buylist(pd_bno);
	}
	
	// 구매테이블에 입력
	@Override
	public void buywrite(BuyVO buyVO) throws Exception {
		dao.buywrite(buyVO);
	}

}
