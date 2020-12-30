package com.uniz.service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.uniz.domain.MyUnizPoint;
import com.uniz.domain.UnizLayerListVO;
import com.uniz.domain.UnizVO;
import com.uniz.domain.VideoDataVO;
import com.uniz.mapper.UnizChartMapper;
import com.uniz.mapper.UnizHitMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UnizChartTest {

	@Setter(onMethod_ = {@Autowired})
	private UnizChartService service;
	private UnizChartMapper mapper;
	

	
//	@Test
//	public void testkeywordHitListTest2() {
//		
//		List<MyUnizPoint> unizSN3 = mapper.pointData((long)204);
//		
//		List<UnizLayerListVO> unizSN2 = mapper.keywordUniz(unizSN3);
//		
//		service.keywordRedList(unizSN2).forEach(list -> log.info(list));
//	}
	
	

}
