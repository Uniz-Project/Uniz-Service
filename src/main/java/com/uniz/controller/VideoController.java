package com.uniz.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.uniz.domain.UserDTO;
import com.uniz.domain.VideoDataVO;
import com.uniz.service.VideoService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@AllArgsConstructor
public class VideoController {

	private VideoService service;
	
	//videoList에서 썸네일을 클릭하면 이동하는 해당동영상 재상페이지
	@GetMapping("/video/{videoSN}")
	public String videoList(@PathVariable long videoSN, Model model, HttpSession session) {
		log.info("videoSn : " + videoSN);
		
		//USERSN없으면 에러임
		if(session.getAttribute("user") != null) {			
			UserDTO userDto= (UserDTO)session.getAttribute("user");//대윤추가
			Long userSN = userDto.getUserSN(); // 대윤추가
			
			model.addAttribute("userSN",userSN);
		}
		
		VideoDataVO videoVO= service.getVideo(videoSN); //대윤변경 (매개변수 userSN추가)
		
		log.info("videoVO : " + videoVO); 
		
		model.addAttribute("videoData", videoVO);
		
		return "videoDetail";
	}
	
	//videoList에서 썸네일을 클릭하면 이동하는 해당동영상 재상페이지
		@GetMapping("/video/{videoSN}/{lastPosition}")
		public String showHistoryVideo(@PathVariable long videoSN,@PathVariable int lastPosition ,Model model, HttpSession session) {
			log.info("videoSn : " + videoSN);
			
			//USERSN없으면 에러임
			if(session.getAttribute("user") != null) {			
				UserDTO userDto= (UserDTO)session.getAttribute("user");//대윤추가
				Long userSN = userDto.getUserSN(); // 대윤추가
				
				model.addAttribute("userSN",userSN);
			}
			
			VideoDataVO videoVO= service.getVideo(videoSN); //대윤변경 (매개변수 userSN추가)
			videoVO.setLastPosition(lastPosition);
			log.info("videoVO : " + videoVO); 
			
			model.addAttribute("videoData", videoVO);
			
			
			return "videoDetail";
		}
	
	
}