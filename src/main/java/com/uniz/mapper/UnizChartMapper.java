package com.uniz.mapper;

import java.util.List;

import com.uniz.domain.UnizChartVO;

public interface UnizChartMapper {
	
	public List<UnizChartVO> chartData();
	public List<UnizChartVO> chartData2(long userSN);

}
