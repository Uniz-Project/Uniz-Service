package com.uniz.mapper;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.uniz.domain.VideoDataVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/*.xml")
public class VideoMapperTest {
	@Setter(onMethod_ = @Autowired)
	private VideoMapper mapper;
	
	@Test
	public void urlTest() {
		long videoSN = 3;
		
		
		VideoDataVO videoVO = mapper.getVideo(videoSN);
		String changeURL = videoVO.getUrlPath();
		int idx = changeURL.indexOf("=");
		
		videoVO.setUrlPath(changeURL.substring(idx+1));
		
		System.out.println(videoVO.getUrlPath());
	}
	
	@Test
	public void randomVideo() {
		
		//메인페이지 랜덤추천영상
		//1. videoData 크기 가져오기.
		int videoSize = mapper.getVideoTotalCount();
		
		System.out.println("videoSize : " +videoSize);
		
		Set<Integer> set = new HashSet<>();
		
		while(set.size()< 3) {
			Double d = Math.random() * videoSize + 1;
			set.add(d.intValue());
		}
		
		List<Integer> list = new ArrayList<>(set);
		Collections.sort(list);
		
		log.info("list : "+list);
		
		List<VideoDataVO> randomVideo= mapper.getRandomVideo(list);
		
		log.info("randomVideo : " + randomVideo);
	}
	
	@Test
	public void popVideo() {
		
		List<VideoDataVO> popVideo = mapper.getPopularityVideo();
		log.info("popVideo"+ popVideo);
	}
	
	@Test
	public void LatestVideo() {
		List<VideoDataVO> latestVideo = mapper.getLatestVideo();
		log.info("latestVideo : "+ latestVideo);
	}
}
