package com.uniz.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uniz.domain.VideoDataVO;
import com.uniz.mapper.UnizMapper;
import com.uniz.mapper.VideoMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class VideoServiceImpl implements VideoService{
	
	@Setter(onMethod_ = @Autowired)
	private VideoMapper videoMapper;
	private UnizMapper unizMapper;
	
	@Override
	public VideoDataVO getVideo(long videoSn) {
		
		log.info("getVideoInfo" + videoSn);
		
		VideoDataVO videoVO = videoMapper.getVideo(videoSn);
		
		String changeURL = videoVO.getUrlPath();
		
		int idx = changeURL.indexOf("=");
		
		videoVO.setUrlPath(changeURL.substring(idx+1));
		
		System.out.println(videoVO.getUrlPath());
		Long utbCateSN = videoVO.getUtbCateSN();		
		
		//2개
		List<Long> parentUniz = unizMapper.findParentUniz(utbCateSN);
		
		videoVO.setParentUniz(parentUniz);
		
		return videoVO;
	}
	
}
