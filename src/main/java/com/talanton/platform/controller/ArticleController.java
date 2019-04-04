package com.talanton.platform.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.talanton.platform.article.domain.ArticleVO;
import com.talanton.platform.article.domain.BPageMaker;
import com.talanton.platform.article.domain.BSearchCriteria;
import com.talanton.platform.article.service.ArticleService;

@Controller
@RequestMapping("/article")
public class ArticleController {
	private static final Logger logger = LoggerFactory.getLogger(ArticleController.class);

	@Inject
	private ArticleService service;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") BSearchCriteria cri, Model model) throws Exception {
		logger.info(cri.toString());
		model.addAttribute("list", service.listSearchCriteria(cri));
		BPageMaker pageMaker = new BPageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listSearchCount(cri));
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/readPage", method=RequestMethod.GET)
	public void read(@RequestParam("bId") int bId, @ModelAttribute("cri") BSearchCriteria cri, Model model) throws Exception {
		model.addAttribute(service.read(bId));
	}
	
	@RequestMapping(value="/removePage", method=RequestMethod.POST)
	public String remove(int bId, BSearchCriteria cri, RedirectAttributes rttr) throws Exception {
		service.remove(bId);
		rttr.addAttribute("board_id", cri.getBoard_id());
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/article/list";
	}
	
	@RequestMapping(value="/modifyPage", method=RequestMethod.GET)
	public void modifyGET(int bId, @ModelAttribute("cri") BSearchCriteria cri, Model model) throws Exception {
		model.addAttribute(service.read(bId));
	}
	
	@RequestMapping(value="/modifyPage", method=RequestMethod.POST)
	public String modifyPOST(ArticleVO article, BSearchCriteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("modPage post ...");
		
		service.modify(article);
		rttr.addAttribute("board_id", cri.getBoard_id());
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/article/list";
	}
	
	@RequestMapping(value="/register", method=RequestMethod.GET)
	public void registerGET(@ModelAttribute("cri") BSearchCriteria cri) throws Exception {
		logger.info("register get ...");
	}
	
	@RequestMapping(value="/register", method=RequestMethod.POST)
	public String registerPOST(ArticleVO article, HttpServletRequest request, BSearchCriteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("register post ...");
		logger.info(article.toString());
		
		article.setbIp(request.getRemoteAddr());
		service.register(article);
		rttr.addAttribute("board_id", cri.getBoard_id());
		rttr.addFlashAttribute("msg", "success");

		return "redirect:/article/list";
	}
	
	@RequestMapping(value="/reply", method=RequestMethod.GET)
	public void replyGET(int bId, @ModelAttribute("cri") BSearchCriteria cri, Model model) throws Exception {
		logger.info("reply get ...");
		logger.info("bid = " + bId);
		
		model.addAttribute(service.read(bId));
	}
	
	@RequestMapping(value="reply", method=RequestMethod.POST)
	public String replyPOST(ArticleVO article, HttpServletRequest request, BSearchCriteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("reply post ...");
		logger.info(article.toString());
		
		article.setbIp(request.getRemoteAddr());
		service.reply(article);
		rttr.addAttribute("board_id", cri.getBoard_id());
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addAttribute("searchType", cri.getSearchType());
		rttr.addAttribute("keyword", cri.getKeyword());
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/article/list";
	}
	
	@RequestMapping(value="/getAttach/{bId}")
	@ResponseBody
	public List<String> getAttach(@PathVariable("bId") Integer bId) throws Exception {
		return service.getAttach(bId);
	}
}
