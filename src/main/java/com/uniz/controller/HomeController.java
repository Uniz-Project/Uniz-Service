package com.uniz.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.uniz.domain.VideoDataVO;
import com.uniz.service.BoardService;
import com.uniz.service.SampleService;
import com.uniz.service.VideoService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;

/**
 * Handles requests for the application home page.
 */
@Log4j
@Controller
@AllArgsConstructor
public class HomeController {
	
	private SampleService service;
	private VideoService videoService;
	private BoardService boardService;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		//메인페이지 기능
		//1. 오늘의 추천영상 - 전체 영상에서 랜덤으로 3개 추출
//		List<VideoDataVO> randomVideo = videoService.getRandomVideo();
//		log.info("randomVideo" + randomVideo);
		List<VideoDataVO> randomVideo = videoService.getRandomVideoSimple();
		model.addAttribute("randomVideo",randomVideo);
		
		
		//2. 최신영상 4개 보여주기 
		List<VideoDataVO> latestVideo = videoService.getLatestVideo();
		model.addAttribute("latestVideo", latestVideo);
		
		//3. 인기 영상 4개 보여주기(likecnt-dislikecnt)+viewcnt
		List<VideoDataVO> popVideo = videoService.getPopularityVideo();
		model.addAttribute("popVideo",popVideo);
		
		//4. 랜덤 게시글 보여주기
		model.addAttribute("board", boardService.getRandomPost());
		
		return "home";
	}
	 
	@RequestMapping(value = "/maincontent", method = RequestMethod.GET)
	public void home2(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		model.addAttribute("dbTime", service.getTime() );
		
	}
}
