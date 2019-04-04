package com.talanton.platform.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.talanton.platform.monitoring.service.EnvDataService;

@Controller
@RequestMapping("/monitoring")
public class EnvDataController {
	private static final Logger logger = LoggerFactory.getLogger(EnvDataController.class);
	
	@Inject
	private EnvDataService service;
	
	@RequestMapping(value="/show", method=RequestMethod.GET)
	public String drawPie() throws Exception {
		return "chart/drawPie";
	}
	
	@RequestMapping(value="/paging", method=RequestMethod.GET)
	public @ResponseBody String paging() throws Exception {
		int lastId = service.getLastId();
		logger.debug("last id = " + lastId);
		return "" + lastId;
	}
}