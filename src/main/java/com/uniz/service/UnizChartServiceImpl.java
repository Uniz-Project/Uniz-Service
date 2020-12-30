package com.uniz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.uniz.domain.MyUnizPoint;
import com.uniz.domain.UnizChartVO;
import com.uniz.domain.UnizLayerListVO;
import com.uniz.domain.VideoDataVO;
import com.uniz.mapper.UnizChartMapper;
import com.uniz.mapper.UnizMapper;
import com.uniz.mapper.VideoMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor

public class UnizChartServiceImpl implements UnizChartService {
	
	@Setter(onMethod_ = @Autowired)
	private UnizChartMapper mapper;
	private VideoMapper videoMapper;
	private UnizMapper unizMapper;
	
	@Override
	public List<UnizChartVO> lineChartData() {
		
		log.info("get chartData........");
		
		return mapper.lineChartData();
	}

	@Override
	public List<UnizChartVO> pieChartData(long userSN) {
		
		log.info("get pieChartData...........");
		
		return mapper.pieChartData(userSN);
	}


	@Override
	public List<VideoDataVO> keywordRedList(long userSN) {
		
			List<MyUnizPoint> pointUnizSN = mapper.pointData(userSN);
	
			List<UnizLayerListVO> layerUnizSN = mapper.keywordUniz(pointUnizSN);
			
			log.info("get keyword List" + userSN);
		
			return mapper.keywordRedList(layerUnizSN);
			
			
		}
	
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
		Long parentUniz = unizMapper.findParentUniz(utbCateSN);		
		videoVO.setUtbCateSN(parentUniz);
		
		return videoVO;
	}


	}


