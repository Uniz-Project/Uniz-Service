package com.uniz.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.uniz.domain.BoardReportVO;
import com.uniz.mapper.BoardReportMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardReportServiceImpl implements BoardReportService {
	
	private BoardReportMapper mapper;
	private BoardService boardMapper;
	
	@Override
	public void report(BoardReportVO vo) {
		
		log.info("report vo = " + vo);
		mapper.report(vo);
		
	}
	
	@Override
	public List<BoardReportVO> getAllReport() {
		
		return  mapper.getAllReport();
		
	}

}
