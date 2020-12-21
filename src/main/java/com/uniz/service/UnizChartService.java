package com.uniz.service;

import java.util.List;

import com.uniz.domain.UnizChartVO;

public interface UnizChartService {
	
	public List<UnizChartVO> chartData();
	public List<UnizChartVO> chartData2(long userSN);

}
