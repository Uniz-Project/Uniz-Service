package com.uniz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.uniz.domain.MyUnizPoint;
import com.uniz.domain.UnizChartVO;
import com.uniz.domain.UnizLayerListVO;
import com.uniz.domain.VideoDataVO;

public interface UnizChartMapper {
	
	public List<UnizChartVO> lineChartData();
	public List<UnizChartVO> pieChartData(long userSN);
	public List<MyUnizPoint> pointData(long userSN);
	
	public List<VideoDataVO> keywordRedList(
		@Param("unizSNlist") List<UnizLayerListVO> UnizLayerList);
	public List<UnizLayerListVO> keywordUniz(
		@Param("unizSN") List<MyUnizPoint> unizSN);
	

}
