package com.talanton.platform.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.apache.tomcat.jni.OS;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.talanton.platform.article.domain.Criteria;
import com.talanton.platform.dbmake.domain.MusicServer;
import com.talanton.platform.dbmake.domain.TblMusicServer;
import com.talanton.platform.dbmake.service.DbMakeService;
import com.talanton.platform.pds.domain.PdsItem;
import com.talanton.platform.pds.service.PdsItemService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	private static Random random = new Random();
	
	@Inject
	private DbMakeService service;
	
	@Resource(name="windowUploadPath")
	private String windowUploadPath;
	
	@Resource(name="linuxUploadPath")
	private String linuxUploadPath;
	
	private String getUploadPath() {
		return OS.IS_LINUX ? linuxUploadPath : windowUploadPath;
	}
	
	@Inject
	private PdsItemService pService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("home");
		
		return "home";
	}
	
	@RequestMapping(value="/db_make", method=RequestMethod.GET)
	public String db_make() throws Exception {
		int total = service.listMusicCount();
		logger.info("total count: " + total);
		Criteria cri = new Criteria();
		int loopCount = total % 10 == 0 ? total / 10 : total / 10 + 1;
		for(int i = 1;i <= loopCount;i++) {
			logger.info("i : " + i);
			cri.setPage(i);
			List<TblMusicServer> tList = service.listMusicServer(cri);
			for(int j = 0;j < tList.size();j++) {
				TblMusicServer tMusic = tList.get(j);
				MusicServer music = tMusic.toMusic();
				service.create(music);
			}
			Thread.sleep(50);
		}
		return "redirect:/";
	}
	
	@RequestMapping(value="/music_upload", method=RequestMethod.GET)
	public String music_upload() throws Exception {
		String sourceDir = "D:\\mp3-music";
		Map<String, String> fMap = getSourceFilesMap(sourceDir);
		int total = service.listCount();
		logger.info("total count: " + total);
		String uploadPath = getUploadPath();
		File uploadRootDir = new File(uploadPath);
		if(!uploadRootDir.exists())	uploadRootDir.mkdirs();
		for(int i = 1;i <= total;i++) {
			MusicServer music = service.read(i);
			logger.info("pid : " + music.getPid());
			String sourcePath = (String)fMap.get(music.getFile_info());
			File sourceFile = new File(sourcePath);
			long currentTime = System.currentTimeMillis();
			int randomValue = random.nextInt(50);
			String destFilename = Long.toString(currentTime) + "_"
					+ Integer.toString(randomValue);
			StringBuilder sb = new StringBuilder(uploadPath);
			sb.append(File.separator).append(String.format("%02d", (int)(currentTime % 50)));
			File uploadSubDir = new File(sb.toString());
			if(!uploadSubDir.exists())	uploadSubDir.mkdir();
			sb.append(File.separator).append(destFilename);
			String destFilePath = sb.toString();
			File destFile = new File(destFilePath);
			FileUtils.copyFile(sourceFile, destFile);
			PdsItem pds = new PdsItem();
			pds.setDescription(music.getPid());
			pds.setFileName(music.getFile_info());
			pds.setFileSize(music.getFile_size());
			pds.setRealPath(destFilePath);
			pService.create(pds);
			Thread.sleep(500);
		}
		return "redirect:/";
	}

	private Map<String, String> getSourceFilesMap(String sourceDir) {
		Map<String, String> map = new HashMap<String, String>();
		File rootDir = new File(sourceDir);
		for(String childFile : rootDir.list()) {
			String childPath = sourceDir + File.separator + childFile;
			File childDir = new File(childPath);
			for(String grandChild : childDir.list()) {
				String grandPath = childPath + File.separator + grandChild;
				map.put(grandChild, grandPath);
			}
		}
		return map;
	}
	
	@RequestMapping(value="/indivisual_privacy", method=RequestMethod.GET)
	public String indivisual_privacy() throws Exception {
		return "indivisual_privacy";
	}
}
