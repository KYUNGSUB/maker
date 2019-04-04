package com.talanton.platform.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.talanton.platform.article.domain.ArticleVO;
import com.talanton.platform.article.domain.Criteria;
import com.talanton.platform.article.domain.PageMaker;
import com.talanton.platform.article.domain.SearchCriteria;
import com.talanton.platform.board.domain.BoardVO;
import com.talanton.platform.board.service.BoardService;

@Controller
@RequestMapping("/board")
public class BoardController {
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService service;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void listBoard(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		logger.info("board list()");
		
		model.addAttribute("list", service.listCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCountCriteria(cri));
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void registerGET() throws Exception {
		logger.info("register get ...");
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerPOST(BoardVO board, RedirectAttributes rttr) throws Exception {
		logger.info("register post ...");
		logger.info(board.toString());
		
		service.register(board);
		rttr.addFlashAttribute("msg", "success");

		return "redirect:/board/list";
	}
	
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public void read(@RequestParam("board_id") int board_id, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		model.addAttribute(service.read(board_id));
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void modifyGET(int board_id, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		model.addAttribute(service.read(board_id));
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPOST(BoardVO board, Criteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("modBoard post ...");
		
		service.modify(board);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/board/list";
	}
	
	@RequestMapping(value="/remove", method=RequestMethod.GET)
	public String remove(int board_id, Criteria cri, RedirectAttributes rttr) throws Exception {
		service.remove(board_id);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/board/list";
	}
}
