package com.camp.s1.product.order;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.camp.s1.member.MemberDTO;
import com.camp.s1.util.Pager;

@Controller
@RequestMapping("/product/order/*")
public class ProductOrderController {
	
	@Autowired
	private ProductOrderService productOrderService;
	
	// order List 출력
	@GetMapping("list")
	public ModelAndView getProductOrderList(Pager pager, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		pager.setId(memberDTO.getId());
		List<ProductOrderDTO> ar = productOrderService.getProductOrderList(pager);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("product/order/list");
		return mv;
		
	}
	
	// Detail 주문 페이지
	@GetMapping("detail")
	public ModelAndView getProductOrderDetail(ProductOrderDTO productOrderDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		productOrderDTO = productOrderService.getProductOrderDetail(productOrderDTO);
		mv.addObject("dto", productOrderDTO);
		mv.setViewName("product/order/detail");
		return mv;
	}
	
	//Add 주문 정보 입력
	@PostMapping("order")
	public ModelAndView setProductOrderAdd(ProductOrderDTO productOrderDTO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO=(MemberDTO)session.getAttribute("member");
		productOrderDTO.setId(memberDTO.getId());
		int result = productOrderService.setProductOrderAdd(productOrderDTO);
		String msg = "주문 실패";
		if(result>0) {
			msg = "주문 성공";
		}
		mv.addObject("result", msg);
		mv.addObject("url", "../order/list");
		mv.setViewName("common/result");
		
		return mv;
	}
	
	// cartEachOrder
	@PostMapping("cartEachOrder")
	public ModelAndView setCartEachOrderAdd(ProductOrderDTO productOrderDTO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO = (MemberDTO)session.getAttribute("member");
		productOrderDTO.setId(memberDTO.getId());
		int result = productOrderService.setCartEachOrderAdd(productOrderDTO);
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	// cartAllorder
	@PostMapping("cartAllOrder")
	public ModelAndView setCartAllOrderAdd(ProductOrderDTO productOrderDTO, HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberDTO memberDTO=(MemberDTO)session.getAttribute("member");
		productOrderDTO.setId(memberDTO.getId());
		int result = productOrderService.setCartAllOrderAdd(productOrderDTO);
		mv.addObject("result", result);
		
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	// Payment 주문 결제
	@PostMapping("payment")
	public ModelAndView setProductOrderPayment(ProductOrderDTO productOrderDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = productOrderService.setProductOrderPayment(productOrderDTO);
		mv.setViewName("redirect:list");
		return mv;
	}
	
	// Delete 주문 취소
	@PostMapping("delete")
	public ModelAndView setProductOrderDelete(ProductOrderDTO productOrderDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = productOrderService.setProductOrderDelete(productOrderDTO);
		String msg = "취소 실패";
		if(result>0) {
			msg = "취소 성공";
		}
		mv.addObject("result", msg);
		mv.addObject("url", "./list");
		mv.setViewName("common/result");
		return mv;
	}

}
