package com.uniz.controller;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.uniz.domain.UnizChartVO;
import com.uniz.domain.UserDTO;
import com.uniz.domain.VideoDataVO;
import com.uniz.service.UnizChartService;
import com.uniz.service.VideoService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor

public class UnizChartController {
	
	private UnizChartService service;

	
	@RequestMapping(value = "dataChart", method = RequestMethod.GET)

	public String dateIncome(Locale locale, Model model, HttpSession session) {

		if (session.getAttribute("user") == null)
			return "redirect:/user/loginForm";

		
		return "dataChart";

	}
	

	@RequestMapping(value = "chartList", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")

	public @ResponseBody String lineChart(Locale locale, Model model) {

		Gson gson = new Gson();

		List<UnizChartVO> lineList = service.lineChartData();

		return gson.toJson(lineList);

	}
	

	
	@RequestMapping(value = "/chartList/{userSN}", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")

	public @ResponseBody String pitChart(@PathVariable long userSN, Locale locale, Model model) {
		
		log.info("====================="+userSN);

		Gson gson = new Gson();

		List<UnizChartVO> pieList = service.pieChartData(userSN);
	
		return gson.toJson(pieList);

	}
	
	@GetMapping(value = "/chartVideoLsit/{userSN}",
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	
			public ResponseEntity<List<VideoDataVO>>keywordRedList(
			@PathVariable("userSN") Long userSN)
				{
				return new ResponseEntity<List<VideoDataVO>>(service.keywordRedList(userSN),HttpStatus.OK);
				}
	
	
	@GetMapping("/{videoSN}")
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
	

}
