package com.uniz.mapper;

import java.util.List;

import com.uniz.domain.BoardReportVO;

public interface BoardReportMapper {
	
	public void report(BoardReportVO vo);
	
	public void acceptReport(Long postSN);
	
	public List<BoardReportVO> getAllReport();
	
}
