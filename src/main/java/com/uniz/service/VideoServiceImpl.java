package com.uniz.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

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
public class VideoServiceImpl implements VideoService {

	@Setter(onMethod_ = @Autowired)
	private VideoMapper videoMapper;
	private UnizMapper unizMapper;

	@Override
	public VideoDataVO getVideo(long videoSn) {

		log.info("getVideoInfo" + videoSn);

		VideoDataVO videoVO = videoMapper.getVideo(videoSn);

		String changeURL = videoVO.getUrlPath();

		int idx = changeURL.indexOf("=");

		videoVO.setUrlPath(changeURL.substring(idx + 1));

		System.out.println(videoVO.getUrlPath());
		Long utbCateSN = videoVO.getUtbCateSN();

		// 2개
		Long parentUniz = unizMapper.findParentUniz(utbCateSN);

		videoVO.setUtbCateSN(parentUniz);

		return videoVO;
	}

	@Override
	public List<VideoDataVO> getLatestVideo() {

		return videoMapper.getLatestVideo();
	}

	@Override
	public List<VideoDataVO> getPopularityVideo() {

		return videoMapper.getPopularityVideo();
	}

	@Override
	public List<VideoDataVO> getRandomVideo() {

		// 1. videoData 크기 가져오기.
		int videoSize = videoMapper.getVideoTotalCount();

		System.out.println("videoSize : " + videoSize);

		Set<Integer> set = new HashSet<>();

		while (set.size() < 3) {
			Double d = Math.random() * videoSize + 1;
			set.add(d.intValue());
		}

		List<Integer> list = new ArrayList<>(set);
		Collections.sort(list);

		log.info("list : " + list);

		List<VideoDataVO> randomVideo = videoMapper.getRandomVideo(list);
		
		log.info("randomVideo Size = "+ randomVideo.size());
		
	
		return randomVideo;
	}

	@Override
	public List<VideoDataVO> getRandomVideoSimple() {
		
		return videoMapper.getRandomVideoSimple();
	}
	
	

}
