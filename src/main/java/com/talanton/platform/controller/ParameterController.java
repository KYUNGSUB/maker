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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.talanton.platform.article.domain.Criteria;
import com.talanton.platform.article.domain.PageMaker;
import com.talanton.platform.parameter.domain.SettingItem;
import com.talanton.platform.parameter.service.ParameterService;

@Controller
@RequestMapping("/parameter")
public class ParameterController {
	private static final Logger logger = LoggerFactory.getLogger(ParameterController.class);

	@Inject
	private ParameterService service;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void listParameter(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		logger.info("parameter list()");
		
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
	public String registerPOST(SettingItem parameter, RedirectAttributes rttr) throws Exception {
		logger.info("register post ...");
		logger.info(parameter.toString());
		
		service.register(parameter);
		rttr.addFlashAttribute("msg", "success");

		return "redirect:/parameter/list";
	}
	
	@RequestMapping(value="/read", method=RequestMethod.GET)
	public void read(@RequestParam("parameterName") String parameterName, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		model.addAttribute(service.read(parameterName));
	}
	
	@RequestMapping(value="/get", method=RequestMethod.GET)
	public @ResponseBody String get(@RequestParam("parameterName") String parameterName) throws Exception {
		SettingItem parameter = service.read(parameterName);
		return parameter.getValue();
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.GET)
	public void modifyGET(String parameterName, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		model.addAttribute(service.read(parameterName));
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	public String modifyPOST(SettingItem parameter, Criteria cri, RedirectAttributes rttr) throws Exception {
		logger.info("mod Parameter post ...");
		
		service.modify(parameter);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "success");
		
		return "redirect:/parameter/list";
	}
	
	@RequestMapping(value="/remove", method=RequestMethod.GET)
	public String remove(String parameterName, Criteria cri, RedirectAttributes rttr) throws Exception {
		service.remove(parameterName);
		rttr.addAttribute("page", cri.getPage());
		rttr.addAttribute("perPageNum", cri.getPerPageNum());
		rttr.addFlashAttribute("msg", "success");
		return "redirect:/parameter/list";
	}
}
