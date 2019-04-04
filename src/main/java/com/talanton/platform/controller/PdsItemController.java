package com.talanton.platform.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLDecoder;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.io.IOUtils;
import org.apache.tomcat.jni.OS;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.talanton.platform.article.domain.Criteria;
import com.talanton.platform.article.domain.PageMaker;
import com.talanton.platform.pds.domain.PdsItem;
import com.talanton.platform.pds.service.PdsItemService;
import com.talanton.platform.utils.upload.MediaUtils;

@Controller
@RequestMapping("/pds")
public class PdsItemController {
	private static final Logger logger = LoggerFactory.getLogger(PdsItemController.class);

	@Inject
	private PdsItemService service;
	
	@Resource(name="windowUploadPath")	// 윈도우 OS 서버일 경우 저장 경로를 컨테이너로부터 주입 받음
	private String windowUploadPath;	// C:\나 D:\ 드라이브 경로를 가짐
	
	@Resource(name="linuxUploadPath")	// Linux OS 서버일 경우 저장 경로를 컨테이너로부터 주입 받음
	private String linuxUploadPath;		// 드라이브 없이 파일 경로를 사용
	
	private String getUploadPath() {
		return OS.IS_LINUX ? linuxUploadPath : windowUploadPath;
	}
	
	private String getUploadFilePath() {
		return getUploadPath() + File.separator + "upload";
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public void listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {
		logger.info(cri.toString());
		model.addAttribute("list", service.listCriteria(cri));
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listCount(cri));
		model.addAttribute("pageMaker", pageMaker);
	}
	
	@RequestMapping(value="/upload", method=RequestMethod.GET)
	public void uploadForm() { }	// /pds/upload.jsp 파일이 반환됨
	
	@RequestMapping(value="/upload", method=RequestMethod.POST)
	public String uploadForm(String description, MultipartFile file, Model model) throws Exception {
		logger.info("originalName: " + file.getOriginalFilename());
		logger.info("size: " + file.getSize());
		logger.info("contentType: " + file.getContentType());
		
		// 브라우저로부터 수신한 파일을 대살 폴더에 복사하여 저장
		String savedName = uploadFile(file.getOriginalFilename(), file.getBytes());
		PdsItem item = new PdsItem();		// 파일 정보를 데이터베이스에 저장하기 위하여 객체 생성
		item.setDescription(description);	// 설명 저장
		item.setFileName(file.getOriginalFilename());	// 브라우저로부터 수신한 원래 파일 정보 저장
		item.setFileSize(file.getSize());				// 파일 크기
		item.setRealPath(getUploadFilePath() + File.separator + savedName);	// 서버에 저장한 파일 이름
		
		service.create(item);		// 파일 정보를 데이터베이스에 추가
		
		return "redirect:/pds/list";	// 파일 목록 보기로 이동
	}
	
	private String uploadFile(String originalFilename, byte[] fileData) throws IOException {
		UUID uid = UUID.randomUUID();
		String savedName = uid.toString() + "_" + originalFilename;
		File uploadDir = new File(getUploadFilePath());
		if(!uploadDir.exists())	uploadDir.mkdir();
		File target = new File(uploadDir, savedName);
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}
	
	@ResponseBody
	@RequestMapping(value="/backup", method=RequestMethod.GET)
	public ResponseEntity<byte[]> backup(String id) throws Exception {
		PdsItem pds = service.read(id);
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
//		logger.info("id : " + id);
		
		try {
			String originalName = pds.getFileName();
			String formatName = originalName.substring(originalName.lastIndexOf(".") + 1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(pds.getRealPath());
			if(mType != null) {
				headers.setContentType(mType);
			} else {
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment); filename=\"" +
						new String(originalName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			}
			headers.setContentLength((int)pds.getFileSize());
			headers.add("Content-Transfer-Encoding", "binary");
			headers.add("Pragma", "no-cache;");
			headers.add("Expires", "-1;");
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.OK);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}

	@RequestMapping(value="/download", method=RequestMethod.GET)
	public ResponseEntity<InputStreamResource> download(String id) throws Exception {
//		logger.info("id : " + id);
		
		PdsItem pds = service.read(id);
		String originalName = pds.getFileName();
		HttpHeaders headers = new HttpHeaders();
		File file = new File(pds.getRealPath());
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
		headers.add("Content-Disposition", "attachment; filename=" + URLDecoder.decode(originalName, "UTF-8"));
		return ResponseEntity.ok().headers(headers).contentLength(pds.getFileSize())
				.contentType(MediaType.parseMediaType("application/octet-stream"))
				.body(new InputStreamResource(new FileInputStream(file)));
	}
	
	@ResponseBody
	@RequestMapping(value="/getDB", method=RequestMethod.POST)
	public ResponseEntity<byte[]> getDB(String id, String key) throws Exception {
		PdsItem pds = service.read(id);
		if(!key.equals(pds.getKind())) {
			return new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}
		InputStream in = null;
		ResponseEntity<byte[]> entity = null;
		logger.info("id : " + id);
		
		try {
			String originalName = pds.getFileName();
			String formatName = originalName.substring(originalName.lastIndexOf(".") + 1);
			MediaType mType = MediaUtils.getMediaType(formatName);
			HttpHeaders headers = new HttpHeaders();
			in = new FileInputStream(pds.getRealPath());
			if(mType != null) {
				headers.setContentType(mType);
			} else {
				headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
				headers.add("Content-Disposition", "attachment); filename=\"" +
						new String(originalName.getBytes("UTF-8"), "ISO-8859-1") + "\"");
			}
			headers.setContentLength((int)pds.getFileSize());
			headers.add("Content-Transfer-Encoding", "binary");
			headers.add("Pragma", "no-cache;");
			headers.add("Expires", "-1;");
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(in), headers, HttpStatus.CREATED);
		} catch(Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		} finally {
			in.close();
		}
		return entity;
	}
}