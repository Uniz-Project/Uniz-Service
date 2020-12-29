package com.uniz.service;

import java.util.List;

import com.uniz.domain.VideoDataVO;

public interface VideoService {
	public VideoDataVO getVideo(long videoSn);

	public List<VideoDataVO> getLatestVideo();

	public List<VideoDataVO> getPopularityVideo();

	public List<VideoDataVO> getRandomVideo();
}
