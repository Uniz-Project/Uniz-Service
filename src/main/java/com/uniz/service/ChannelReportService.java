package com.uniz.service;

import java.util.List;

import com.uniz.domain.BoardReportVO;
import com.uniz.domain.ChannelReportVO;

public interface ChannelReportService {
	
	public void report(ChannelReportVO vo);
	
	public List<BoardReportVO> getAllReport();
}
