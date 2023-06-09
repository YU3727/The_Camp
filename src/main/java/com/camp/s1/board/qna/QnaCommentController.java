package com.camp.s1.board.qna;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.camp.s1.util.Pager;

@Controller
@RequestMapping("/qnaComment/*")
public class QnaCommentController {

	@Autowired
	private QnaCommentService qnaCommentService;
	
	@GetMapping("list")
	public ModelAndView getCommentList(Pager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("commentList", qnaCommentService.getBoardList(pager));
		mv.setViewName("common/commentList");
		
		return mv;
		
	}
	
	
	@PostMapping("add")
	public ModelAndView setCommentAdd(QnaCommentDTO commentDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
	
		mv.addObject("result", qnaCommentService.setBoardAdd(commentDTO));
		mv.setViewName("common/ajaxResult");
		
		
		return mv;
	}
	
	@PostMapping("delete")
	public ModelAndView setCommentDelete(QnaCommentDTO commentDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("result", qnaCommentService.setBoardDelete(commentDTO));
		mv.setViewName("common/ajaxResult");
		
		
		return mv;
	}
	
	@PostMapping("update")
	public ModelAndView setCommentUpdate(QnaCommentDTO commentDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("result", qnaCommentService.setBoardUpdate(commentDTO));
		mv.setViewName("common/ajaxResult");
		
		return mv;
	}
	
	
	@PostMapping("subCommentAdd")
	public ModelAndView setSubCommentAdd(QnaCommentDTO commentDTO) throws Exception {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("result", qnaCommentService.setSubCommentAdd(commentDTO));
		mv.setViewName("common/ajaxResult");
		
		
		
		return mv;
	}
	
}
