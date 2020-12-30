package com.uniz.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.uniz.domain.ChannelAttachVO;
import com.uniz.domain.ChannelBoardVO;
import com.uniz.domain.ChannelDTO;
import com.uniz.domain.ChannelPageDTO;
import com.uniz.domain.ChannelReportVO;
import com.uniz.domain.ChannelVO;
import com.uniz.domain.Criteria;
import com.uniz.mapper.ChannelMapper;
import com.uniz.service.ApplyCreatorService;
import com.uniz.service.ChannelReportService;
import com.uniz.service.ChannelService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/channel/*")
@Controller
@Log4j
@AllArgsConstructor
public class ChannelController {
	
	private ChannelService service;
	private ChannelMapper mapper;
	private ApplyCreatorService applyService;
	private ChannelReportService reportService;
	
	// main 페이지로 이동
	@GetMapping("/ch")
	public String getMain( Criteria cri , Model model) {
		
		log.info("cri ==== " + cri);
		
		model.addAttribute("list", service.getChannelList(cri));
		
		int total = service.getTotal(cri);
		
		log.info("total ==== " + total);
		
		model.addAttribute("pageMaker", new ChannelDTO(cri, total));
		
		return "channel/main";
	}
	
	//채널 생성 페이지로 이동
	@GetMapping("/chcreate")
	
	public String getChCreate(Model model, HttpSession session) throws Exception {
		
		final Integer USERTYPE = (Integer)session.getAttribute("userType");
		
		final Long USERSN = (Long)session.getAttribute("userSN");
		
		log.info(" userType : " + USERTYPE);
		
		log.info(" USERSN ==== " + USERSN);
		
		if( session.getAttribute("user") != null && USERTYPE >= 2) {
			
			model.addAttribute("apply", applyService.getApply(USERSN));
			
			return "/channel/chcreate";
			
		}else if(session.getAttribute("user") != null && (int)session.getAttribute("userType") == 1) {
			
			return "redirect:/channel/ch";
			
		} else {
			
			return "/user/loginForm";
			
		}
		
	}
	
	@PostMapping("/checkChannelCreate")
	public @ResponseBody Map<String, Object> checkLogin(@RequestBody Long userSN, HttpSession session){
		
		log.info("userSN=======  " + userSN);
		
		final int CONFIRM = mapper.confirmChannel(userSN); // 개설한 채널이 있는지 체크
		
		final int USERTYPE = (int)session.getAttribute("userType"); // usertype 2면 크리에이터, 1이면 일반유저
		
		log.info("CONFIRM : " + CONFIRM);
		
		log.info("USERTYPE : " + USERTYPE);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("CONFIRM" , CONFIRM);
		
		map.put("USERTYPE" , USERTYPE);
		
		log.info("map~~~~~ " + map);
		
		return map;
		
	}
	
	@PostMapping("/checkTitle")
	public @ResponseBody Map<String, Object> checkTitle(@RequestBody String channelTitle){
		
		log.info("channelTitle : " + channelTitle);
		
		String result = service.duplicateTitle(channelTitle);
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("result", result);
		
		log.info("duplicate map : " + map);
		
		return map;
	}
	
	
	// postSN 을 가진채로 게시글 읽는 페이지로 이동
	@GetMapping("/get/{postSN}")
	public String get(@PathVariable("postSN") Long postSN, Model model , HttpSession session ) throws Exception {
	
			Long userSN = (Long)session.getAttribute("userSN");
			
			final int POSTSN = mapper.checkPost(postSN);
		
			if(POSTSN == 1){
				
				ChannelBoardVO vo = service.getPost(postSN);
				log.info("vo= " +vo);
				log.info("userSN= " + vo.getUserSN());
				model.addAttribute("board", vo);
					
				if(!vo.getUserSN().equals(userSN)) {
					service.updateViewCnt(postSN, 1L );
				}
				
				return "channel/get";
			
			}else {
			
				return "channel/main";
				
			}
		
	}
	
	// 채널 게시판으로 이동
	@GetMapping("/board/{channelSN}")
	public String getBoard(@PathVariable("channelSN")Long channelSN, ChannelBoardVO vo ,Model model) {
		
		final int CHECKCHANNEL = service.checkChannel(channelSN);
		
		if(CHECKCHANNEL== 1){
			
			model.addAttribute("channel", service.getList(channelSN));
		
			return "channel/board";

		}else {
		
			return "channel/main";
		
		}
	}
	
	// channelSN 을 가지고 게시글 쓰는 페이지로 이동
	@GetMapping("/register/{channelSN}")
	public String register(@PathVariable("channelSN") Long channelSN ,Model model) {
		log.info("channelSN= " +channelSN);
		
		return "channel/register";
	}
	
	// postSN 과 channelSN을 가지고 게시글 수정 페이지로 이동
	@GetMapping("/modify/{postSN}/{channelSN}")
	public String modify(@PathVariable("postSN") Long postSN,@PathVariable("channelSN") Long channelSN , Model model) {
		
		ChannelBoardVO vo = service.getPost(postSN);
		
		log.info("channel VO ==== " + vo);
		
		model.addAttribute("board", vo);
		
		return "channel/modify";
	}
	
	
	// 게시글 작성
	@PostMapping("/register")
	public String register( ChannelBoardVO vo , RedirectAttributes rttr) {
		
		if(vo.getAttachList() != null) {
			
			vo.getAttachList().forEach(attach -> log.info(attach));
			
		}
		
		service.register(vo);
		
		rttr.addFlashAttribute("result", vo.getPostSN());
		log.info("vo= " +vo);
		
		return "redirect:/channel/ch";
	}
	
	@PostMapping("/report")
	public String report(ChannelReportVO vo, RedirectAttributes rttr) {
		log.info("controller report vo = " + vo);
		reportService.report(vo);
		
		return "redirect:/channel/get/" + vo.getPostSN();
	}
	
	//채널 게시판 생성
	@PostMapping("/chcreate")
	public String createChannel (ChannelVO vo , RedirectAttributes rttr) {
		service.createChannel(vo);
		rttr.addFlashAttribute("reult", vo.getChannelTitle());
		
		return "redirect:/channel/ch/";
	}
	
	// 채널  목록 보여줌
	@GetMapping(value= "/list/{page}" ,
	produces = { MediaType.APPLICATION_XML_VALUE,
				 MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ChannelPageDTO> getChannelList(@PathVariable("page") int page){
		log.info("get Channel List........");
		

		Criteria cri = new Criteria(page, 10);

		return new ResponseEntity<>(service.getAllChannelList(cri) , HttpStatus.OK);
	}
	
	
	// 채널 별 게시글 목록 보여줌
	@GetMapping(value ="/list/{channelSN}/{page}",
			produces = {
					 MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ChannelPageDTO>getPostList (@PathVariable("channelSN") Long channelSN, @PathVariable("page") int page ){
		
		Criteria cri = new Criteria(page, 10);
		
		return new ResponseEntity<>(service.getPostListPaging( cri , channelSN), HttpStatus.OK);
		
	}
	
	// 채널 게시물 전체 목록 보여줌
	@GetMapping(value ="/list/all/{page}",
			produces = { MediaType.APPLICATION_XML_VALUE,
					 MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<ChannelPageDTO>getAllPost(@PathVariable("page") int page){
		
		Criteria cri = new Criteria(page, 10);
		
		return new ResponseEntity<>(service.getListPage(cri), HttpStatus.OK);
	}
	
	
	//게시글 삭제
	@PostMapping(value ="/remove")		
	public String remove(@RequestParam("postSN") Long postSN,@RequestParam("channelSN") Long channelSN ,RedirectAttributes rttr){
		
		List<ChannelAttachVO> attachList = service.getAttachList(postSN);
		
		log.info("게시물 삭제 : " + postSN);
		
		boolean deletecheck = service.delete(postSN);
		
		if(deletecheck) {
			
			deleteFiles(attachList);
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/channel/board/" + channelSN;
	}
	
	// 게시글 수정 하는 기능
	@PostMapping("/modify")
	public String modify(@RequestParam("postSN") Long postSN ,@RequestParam("channelSN") Long channelSN ,ChannelBoardVO vo, RedirectAttributes rttr) {
		log.info("modify before");
		
		if(service.update(vo)) {
			log.info("modify after");
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/channel/board/" + channelSN;
		
	}
	
	@GetMapping(value ="/chgetAttachList",
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<ChannelAttachVO>> getAttachList(Long postSN){
		
		log.info("getAttachList====== : " + postSN);
		
		return new ResponseEntity<>(service.getAttachList(postSN) , HttpStatus.OK);
		
	}
	
	
private void deleteFiles(List<ChannelAttachVO> attachList) {
		
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		attachList.forEach(attach -> {
			
		  try {
			  
		  
			Path file = Paths.get("C:\\ch\\file\\" + attach.getUploadPath()+ "\\"+
					attach.getUuid()+"_" + attach.getFileName());
			
			Files.deleteIfExists(file);
			
			if(Files.probeContentType(file).startsWith("image")) {
				
				Path thumNail = Paths.get("C:\\ch\\file\\" + attach.getUploadPath() + 
						"\\s_" + attach.getUuid()+"_"+attach.getFileName());
				
				Files.delete(thumNail);
				
			}
			
		  }catch(Exception e) {
			  log.error("delete File error " + e.getMessage());
		  }
		});
		
	}
	
	
}
