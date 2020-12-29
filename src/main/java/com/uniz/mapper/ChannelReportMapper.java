package com.uniz.mapper;

import java.util.List;

import com.uniz.domain.BoardReportVO;
import com.uniz.domain.ChannelReportVO;

public interface ChannelReportMapper {
	
	public void report(ChannelReportVO vo);
	
	public void acceptReport(Long postSN);
	
	public List<BoardReportVO> getAllReport();
	
}
