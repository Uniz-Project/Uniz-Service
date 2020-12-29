package com.uniz.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.uniz.domain.BoardReportVO;
import com.uniz.domain.ChannelReportVO;
import com.uniz.mapper.ChannelReportMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ChannelReportServiceImpl implements ChannelReportService {
	
	private ChannelReportMapper mapper;
	private ChannelService channelMapper;
	
	@Override
	public void report(ChannelReportVO vo) {
		
		log.info("report vo = " + vo);
		mapper.report(vo);
		
	}
	
	@Override
	public List<BoardReportVO> getAllReport() {
		
		return  mapper.getAllReport();
		
	}

}
