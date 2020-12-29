package com.uniz.controller;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.uniz.domain.MenuType;
import com.uniz.domain.SearchResult;
import com.uniz.domain.UnizVO;
import com.uniz.domain.VideoDataListResult;
import com.uniz.domain.VideoDataVO;
import com.uniz.service.SearchService;
import com.uniz.service.UnizService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/search/*")
@AllArgsConstructor
public class SearchController {

	@Setter(onMethod_ = @Autowired)
	private UnizService unizService;

	@Setter(onMethod_ = @Autowired)
	private SearchService searchService;


	@GetMapping(value="/index")
	public void index(Locale locale, Model model) {

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate );

		return;
	}
	
	//네브바 검색
	//일단 키워드가 1개인것만 생각
	@GetMapping("/AllList")
	public String searchListAll(String keyword, Model model){
		
		log.info("keyword : " + keyword);
		List<VideoDataVO> VideoData = searchService.getMainSearch(keyword); 
		log.info("videoData"+ VideoData);
		
		model.addAttribute("VideoData",VideoData);
		model.addAttribute("keyword",keyword);
		return "/search/result";
	}
	
	@GetMapping(value="/list",
			produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public String list(@RequestParam("keyword") List<String> keyword,@RequestParam(value="searchOption",defaultValue="0")List<Integer>searchOption, Model model) {
		
		log.info(searchOption);
		
		if(searchOption.get(0).equals(0)) {
			String keyword2 = keyword.get(0);
			List<VideoDataVO> VideoData = searchService.getMainSearch(keyword2);
			
			model.addAttribute("VideoData",VideoData);
			model.addAttribute("keyword",keyword);
			return "/search/result";
		}
		
		// 1. 내 검색 옵션 리스트를 기반으로 서치유니즈 리스트를 가져온다 
		List<UnizVO> searchUnizList = searchService.getSearchUnizList(searchOption);

		// 2. 서치 유니즈 리스트를 통해 비디오 데이터 검색
		List<VideoDataListResult> resultVideos = searchService.getSearchResult(
											keyword.stream()
												.map(String::toUpperCase)
												.collect(Collectors.toList()),
											searchUnizList
										);

		SearchResult searchResult = new SearchResult(keyword, resultVideos);
		// 3. 결과 반환
//		return new ResponseEntity<>(searchResult, HttpStatus.OK);
		
		model.addAttribute("searchResult", searchResult);
		
		log.info("searchResult : " + searchResult);
		
		return "/search/detailResult";
	}

	@GetMapping(value="/lists")
	public String lists(@RequestParam("keyword") List<String> keyword, Long userSN, Model model) {
		
		log.info("search/list.....");
		
		System.out.println("keyword :" + keyword);
		
		System.out.println("userSN : " + userSN);
		// 1. 내 검색 옵션 리스트를 기반으로 서치유니즈 리스트를 가져온다 
		UnizVO searchUnizList = searchService.getSearchUnizList2(userSN);
		//==> 의미없음 2124를 고정으로
		// 2. 서치 유니즈 리스트를 통해 비디오 데이터 검색
		System.out.println("???"+keyword.stream()
												.map(String::toUpperCase)
												.collect(Collectors.toList()));
		List<VideoDataListResult> resultVideos = searchService.getSearchResult2(
											keyword.stream()
												.map(String::toUpperCase)
												.collect(Collectors.toList()),
											searchUnizList
										);

		SearchResult searchResult = new SearchResult(keyword, resultVideos);
		// 3. 결과 반환 - 검색결과페이지로 이동
		model.addAttribute("searchResult", searchResult);
		
		return "/search/result";
	}
	
	@GetMapping(value = "/getUnitag",
			produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<List<UnizVO>> getUnitagList(String keyword, Long userSN) {

		log.info("getUnitagList for search : " + keyword);

		List<UnizVO> list = null;

		if( userSN == null || userSN == 0) {
			// 비로그인 상태
			list = unizService.getPresetList(MenuType.SEARCH.getMenu());
		} else {
			// 로그인 상태 TODO 바꿔야함 
			list = unizService.getPresetList(MenuType.SEARCH.getMenu());
		}

//		System.out.println("list : " + list);

		return new ResponseEntity<>(list, HttpStatus.OK);
	}


	@GetMapping(value = "/getOptions",
			produces=MediaType.APPLICATION_JSON_UTF8_VALUE)
	public ResponseEntity<Map<Integer, String>> getOptions(Long userSN) {

		log.info("search getOptionList : " + userSN);

		return new ResponseEntity<>(searchService.getOptionNameMap(userSN), HttpStatus.OK);
	}


	@PostMapping(value = "/setOptions",
			produces = {
					MediaType.APPLICATION_JSON_UTF8_VALUE
				})
	public ResponseEntity<Map<Integer, String>> setOptions( @RequestParam("options") ArrayList<Integer> options, @RequestParam("userSN") Long userSN) {
		log.info("options: " + options);
		Map<Integer, String> map = new HashMap<>();
		if (userSN != null) {
			map = searchService.setOptions(userSN, options);
			log.info("setOptions map............. : " + map);
		}

		return map.size() > 0
				? new ResponseEntity<>(map, HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}