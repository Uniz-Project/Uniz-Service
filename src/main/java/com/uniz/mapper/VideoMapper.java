package com.uniz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.uniz.domain.VideoDataVO;

public interface VideoMapper {

	public List<VideoDataVO> getVideoList(@Param("unizSN") Long unizSN);
	
	public VideoDataVO getVideo(Long videoSn);

	public List<VideoDataVO> getLatestVideo();

	public List<VideoDataVO> getPopularityVideo();
	
	public List<VideoDataVO> getRandomVideo(@Param("videoSNList") List<Integer> VideoSN);

	public int getVideoTotalCount();

	public List<Long> getAllVideoSN();

	public List<VideoDataVO> getRandomVideoSimple();
}
