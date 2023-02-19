package com.kh.saeha.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.saeha.service.CartService;
import com.kh.saeha.service.ProductService;
import com.kh.saeha.vo.CartVO;
import com.kh.saeha.vo.ProductVO;


@Controller
@RequestMapping("/sae_cart/*")
public class CartController {
	
	private static final Logger logger = LoggerFactory.getLogger(GoodsBoardController.class);
	
	@Inject
	CartService cartservice;
	
	@Inject
	ProductService productservice;
	
	
	// ajax로 장바구니 추가 및 상태 반환
	@PostMapping("/add")
	@ResponseBody
	public String addcart(CartVO cartVO, ProductVO productVO, HttpServletRequest request) throws Exception {
		logger.info("addcart");

		HttpSession session = request.getSession();	
		String user_id = (String)session.getAttribute("userid");
		
		productVO.setPd_id(user_id);
		cartVO.setCt_id(user_id);
		
		// 로그인 체크
		if(user_id == null || user_id == "") {
			return "3";
		}
		
		// 장바구니 중복체크
		int check = cartservice.checkcart(productVO);
		System.out.println(check);
		if(check <= 0) {
			// 장바구니 등록
			cartservice.addcart(cartVO);
			return "1";
			
		}else {
			// 장바구니 중복
			return "2";
		}
	}
	
	// 카트 리스트
	@RequestMapping(value = "/cartlist", method = RequestMethod.GET)
	public String cartlist(CartVO cartVO, ProductVO productVO, HttpServletRequest request, Model model) throws Exception {
		logger.info("cartlist");
		
		HttpSession session = request.getSession();
		String user_id = (String)session.getAttribute("userid");
		
		if(user_id == null || user_id == "") {
			return "sae_member/login";
		}
		
		List<CartVO> list = cartservice.cartlist(user_id);
		
		for (int i = 0; i < list.size(); i++) {
			cartVO = list.get(i);
			String path = productservice.getImg(cartVO.getCt_pno());
			int stock = cartservice.stock(cartVO);
			
			cartVO.setCt_stock(stock);
			if (path == null) {
				cartVO.setP_filepath("/productimg/img.png");

			} else {
				cartVO.setP_filepath(path);
			}

		}
		
		model.addAttribute("cartlist", list);
		
		
		return "sae_cart/cartlist";
	}

}
