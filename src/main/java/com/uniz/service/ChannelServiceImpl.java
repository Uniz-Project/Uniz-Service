package com.uniz.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.uniz.domain.ChannelAttachVO;
import com.uniz.domain.ChannelBoardVO;
import com.uniz.domain.ChannelPageDTO;
import com.uniz.domain.ChannelVO;
import com.uniz.domain.Criteria;
import com.uniz.domain.UserData;
import com.uniz.mapper.ChannelAttachMapper;
import com.uniz.mapper.ChannelMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ChannelServiceImpl implements ChannelService {
	
	@Setter(onMethod_ = @Autowired)
	private ChannelMapper mapper;
	
	@Setter(onMethod_ = @Autowired)
	private ChannelAttachMapper attachMapper;
	
	public List<ChannelBoardVO> getChannelList(Criteria cri){
		log.info("채널  목록 출력");
		return mapper.getChannelList(cri);
	}
	
	@Override
	public List<ChannelBoardVO> getList(Long channelSN){
		
		log.info("board매퍼 ======="+ mapper);
		
		return mapper.getList(channelSN);
		
	}
	
	public List<ChannelBoardVO> getPostList(Criteria cri ,Long channelSN){
		log.info("해당 채널 게시글 목록 출력");
		return mapper.getPostList( cri , channelSN);
	}
	
	public ChannelPageDTO getAllChannelList(Criteria cri) { // 채널 전체 목록 페이징 처리
		
		return new ChannelPageDTO (mapper.getChannelCount(), mapper.getChannelList(cri));
	}
	
	public ChannelPageDTO getPostListPaging(Criteria cri , Long channelSN) {
		
		return new ChannelPageDTO ( mapper.getTotalCountByChannel(channelSN), mapper.getPostList(cri, channelSN));
	}
	
	public List<ChannelBoardVO> getAllPost(Criteria cri){
		return mapper.getAllPost(cri);
	}
	
	public ChannelPageDTO getListPage(Criteria cri) {
		return new ChannelPageDTO( mapper.getCountByPost() , mapper.getAllPost(cri));
	}
	
	@Override
	public int getTotal(Criteria cri) {
		
		return mapper.getTotalCount(cri);
		
	}
	
	public ChannelBoardVO getPost(Long postSN){
		log.info("게시글 출력 ");
		
		return mapper.getPost(postSN);
	}
	
	public int checkChannel(Long channelSN) {
		
		return mapper.checkChannel(channelSN);
		
	}
	
	public String duplicateTitle(String channelTitle) {
		
		final String NO_DUPLICATION = "SUCCESS";
		final String YES_DUPLICATION = "DUPLICATION";
		
		if(channelTitle != null) {
			
			try {
				
				if(mapper.duplicateTitle(channelTitle) <= 0) {
					return NO_DUPLICATION;
				}
				
			}catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		return YES_DUPLICATION;
		
	}
	
	public List<UserData> checkUserType(Long userSN) {
		
		return mapper.checkUserType(userSN);
		
	}
	
	public void createChannel(ChannelVO vo) {
		mapper.createChannel(vo);
	}
	
	@Transactional
	@Override
	public void register(ChannelBoardVO vo) {
		
		mapper.insertPost(vo);
		mapper.insertCont(vo);
		
		if(vo.getAttachList() == null || vo.getAttachList().size() <= 0) {
			
			return;
			
		}
		
		vo.getAttachList().forEach(attach ->{
			attach.setPostSN(vo.getPostSN());
			attachMapper.insert(attach);
		});
		
	}
	
	@Transactional
	@Override
	public boolean delete(Long postSN) {
		
		attachMapper.deleteAll(postSN);
		
		mapper.deleteReply(postSN);
		
		int chCont = mapper.deleteCont(postSN);
		int chPost = mapper.deletePost(postSN); 
		
		if(chCont == 1 && chPost == 1) {
			log.info("삭제중");
			return true;
		}
		
		return false;
		
	}
	
	@Transactional
	@Override
	public boolean update(ChannelBoardVO vo) {
		
		attachMapper.deleteAll(vo.getPostSN());
		
		boolean modifyResult = mapper.updateCont(vo) == 1 && mapper.updatePost(vo) ==1;
		
		if(modifyResult && vo.getAttachList() != null 
				&& vo.getAttachList().size() > 0) {
			
				vo.getAttachList().forEach(attach -> {
				
				attach.setPostSN(vo.getPostSN());
				attachMapper.insert(attach);
				
			});
			
		}
			return modifyResult;
	}
	
	@Override
	public void updateViewCnt(Long postSN, Long amount) {
		
		mapper.updateViewCnt(postSN , amount);
		
	}
	
	@Override
	public List<ChannelAttachVO> getAttachList(Long postSN){
		
		log.info("첨부 파일 불러오기 : " + postSN);
		
		return attachMapper.findByPostSN(postSN);
		
	}

}
