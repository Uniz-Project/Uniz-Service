package com.uniz.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;

import com.uniz.domain.MyUnizPoint;
import com.uniz.domain.UnizLayerListVO;
import com.uniz.domain.VideoDataVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/*.xml")
@Log4j
public class UnizChartMapperTest {
	
	@Setter(onMethod_ = @Autowired)
	private UnizChartMapper mapper;
	
	
	
//	@Test
//	public void testchartData() {
//		
//		mapper.chartData().forEach(video -> log.info(video));
//
//		
//	}
	
//	@Test
//	public void testPointData() {
//		
//		MyUnizPoint chart = mapper.pointData((long)204);
//			log.info("=============" + chart);
//		
//
//		
//	}
	
	@Test
	public void testkeywordUniz() {
		
		List<MyUnizPoint> unizSN = mapper.pointData((long)204);
		
		log.info("==============" + unizSN);
		
		List<UnizLayerListVO> video = mapper.keywordUniz(unizSN);
		
		video.forEach(list -> log.info(list));
		
		List<VideoDataVO> video2 = mapper.keywordRedList(video);
		
		video2.forEach(list2 -> log.info(list2));
	}
	

}
