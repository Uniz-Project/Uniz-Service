package com.uniz.service;

import java.util.List;

import com.uniz.domain.UnizChartVO;
import com.uniz.domain.UnizLayerListVO;
import com.uniz.domain.VideoDataVO;

public interface UnizChartService {
	
	public List<UnizChartVO> lineChartData();
	
	public List<UnizChartVO> pieChartData(long userSN);
	
	public List<VideoDataVO> keywordRedList(long userSN);
	
	public VideoDataVO getVideo(long videoSn);





}
