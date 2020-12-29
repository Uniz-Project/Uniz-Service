package com.uniz.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ChannelReportVO {
	
	private Long postSN;
	private Long userSN;
	private String title;
	private String reason;
	private String detail;
	private int state;
	private Date reportDate;
	
}
