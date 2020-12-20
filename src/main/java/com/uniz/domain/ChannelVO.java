package com.uniz.domain;

import java.util.Date;

import lombok.Data;

@Data
public class ChannelVO {
	
	private Long channelSN;
	private Long userSN;
	private String channelTitle;
	private String channelComment;
	private Date createDateTime;
	private Date updateDateTime;
	
}
