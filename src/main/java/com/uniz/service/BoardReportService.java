package com.uniz.service;

import java.util.List;

import com.uniz.domain.BoardReportVO;

public interface BoardReportService {
	
	public void report(BoardReportVO vo);
	
	public List<BoardReportVO> getAllReport();
}
