package com.uniz.mapper;

import java.util.List;

import com.uniz.domain.ApplyAttachVO;

public interface ApplyAttachMapper {
	
	public void insert(ApplyAttachVO vo);
	
	public void delete(String uuid);
	
	public List<ApplyAttachVO> findByUserSN(Long userSN);
	
	public List<ApplyAttachVO> getAllAttach();
	
	public void deleteAll(Long userSN);
	
	
}
